--[[
*****************************************************************
** Context menu engine for mpv.                                **
** Origin_ Avi Halachmi https://github.com/avih                **
** Extension_ Thomas Carmichael https://gitlab.com/carmanaught **
*****************************************************************
mpv的tcl图形菜单的附属脚本 (2)/(3)
--]]

local function iso639_1(isoVal)
    local iso639_1_vals = {
        ZH = "Chinese",
        EN = "English",
    }
    return iso639_1_vals[isoVal]
end

local function iso639_2(isoVal)
    local iso639_2_vals = {
        CHI = "Chinese",
        ENG = "English",
    }
    return iso639_2_vals[isoVal]
end

local langcodes = {
    iso639_1 = iso639_1,
    iso639_2 = iso639_2,
}

return langcodes
