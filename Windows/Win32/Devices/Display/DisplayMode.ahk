#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\DEVMODE_DISPLAY_FIXED_OUTPUT.ahk" { DEVMODE_DISPLAY_FIXED_OUTPUT }
#Import "..\..\Graphics\Gdi\DEVMODE_COLLATE.ahk" { DEVMODE_COLLATE }
#Import "..\..\Graphics\Gdi\DEVMODE_TRUETYPE_OPTION.ahk" { DEVMODE_TRUETYPE_OPTION }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Graphics\Gdi\DEVMODE_FIELD_FLAGS.ahk" { DEVMODE_FIELD_FLAGS }
#Import "..\..\Graphics\Gdi\DEVMODE_DUPLEX.ahk" { DEVMODE_DUPLEX }
#Import "..\..\Graphics\Gdi\DEVMODE_COLOR.ahk" { DEVMODE_COLOR }
#Import "..\..\Graphics\Gdi\DEVMODEW.ahk" { DEVMODEW }
#Import "..\..\Graphics\Gdi\DEVMODE_DISPLAY_ORIENTATION.ahk" { DEVMODE_DISPLAY_ORIENTATION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The DisplayMode structure describes a display device.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/ns-cloneviewhelper-displaymode
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DisplayMode {
    #StructPack 4

    /**
     * A single wide-character string that contains the name of the display device.
     */
    DeviceName : WCHAR[32]

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodew">DEVMODEW</a> structure that contains characteristics of the display device.
     */
    devMode : DEVMODEW

}
