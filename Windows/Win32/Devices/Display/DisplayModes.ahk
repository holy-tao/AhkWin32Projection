#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\DEVMODE_DISPLAY_FIXED_OUTPUT.ahk" { DEVMODE_DISPLAY_FIXED_OUTPUT }
#Import "..\..\Graphics\Gdi\DEVMODE_COLLATE.ahk" { DEVMODE_COLLATE }
#Import "..\..\Graphics\Gdi\DEVMODE_TRUETYPE_OPTION.ahk" { DEVMODE_TRUETYPE_OPTION }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Graphics\Gdi\DEVMODE_FIELD_FLAGS.ahk" { DEVMODE_FIELD_FLAGS }
#Import ".\DisplayMode.ahk" { DisplayMode }
#Import "..\..\Graphics\Gdi\DEVMODE_DUPLEX.ahk" { DEVMODE_DUPLEX }
#Import "..\..\Graphics\Gdi\DEVMODE_COLOR.ahk" { DEVMODE_COLOR }
#Import "..\..\Graphics\Gdi\DEVMODEW.ahk" { DEVMODEW }
#Import "..\..\Graphics\Gdi\DEVMODE_DISPLAY_ORIENTATION.ahk" { DEVMODE_DISPLAY_ORIENTATION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The DisplayModes structure contains a list of display modes.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/ns-cloneviewhelper-displaymodes
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DisplayModes {
    #StructPack 4

    /**
     * The number of display modes in the array that the <b>displayMode</b> member specifies.
     */
    numDisplayModes : Int32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-displaymode">DisplayMode</a> structures that describe characteristics of display devices.
     */
    displayMode : DisplayMode[1]

}
