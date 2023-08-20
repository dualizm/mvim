local utils = {}

function utils.categories(categories)
    for name, category in pairs(categories) do
        if name == 'plugins' then
            for _,file in ipairs(category) do
                require('+.'..file)
            end
        else
            for _,file in ipairs(category) do
                require(file)
            end
        end
    end
end

return utils
