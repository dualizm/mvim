local utils = {}

function utils.require_plugins(plugins)
    for _,plugin in ipairs(plugins) do
        require('+.'..plugin)
    end
end

function utils.with_require(plugin_name, fcall)
    local ok, _ = pcall(require, plugin_name)
    if ok then
        fcall()
    end
end


return utils
