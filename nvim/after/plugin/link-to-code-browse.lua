function LinkToCode()
    local filePath = vim.api.nvim_buf_get_name(0)

    local package = runCommand(filePath, "basename `git rev-parse --show-toplevel`")

    local commitId = runCommand(filePath, "git rev-parse origin")

    local gitFilePath = runCommand(filePath, "git ls-files --full-name $(basename " .. filePath .. ")")

    local lineNumber = vim.api.nvim_win_get_cursor(0)[1]

    local url = string.format("https://<git url>/packages/%s/blobs/%s/--/%s#L%s", package, commitId, gitFilePath, lineNumber)
    return url
end

function runCommand(filePath, command)
    local fullCommand = "cd $(dirname " .. filePath .. "); " .. command;
    local handle = io.popen(fullCommand)
    local result = handle:read("*a")
    handle:close()
    return result:gsub("[\n\r]", "")
end
