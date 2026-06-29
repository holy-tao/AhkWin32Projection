#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines options that are used to set window visual style attributes.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-wta_options
 * @namespace Windows.Win32.UI.Controls
 */
export default struct WTA_OPTIONS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A combination of flags that modify window visual style attributes. Can be a combination of the <a href="https://docs.microsoft.com/windows/desktop/Controls/wtnca">WTNCA</a> constants.
     */
    dwFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A bitmask that describes how the values specified in <b>dwFlags</b> should be applied. If the bit corresponding to a value in <b>dwFlags</b> is 0, that flag will be removed. If the bit is 1, the flag will be added.
     */
    dwMask : UInt32

}
