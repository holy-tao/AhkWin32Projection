#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct SET_ACTIVE_COLOR_PROFILE_NAME {
    #StructPack 2

    ColorProfileName : WCHAR[1]

}
