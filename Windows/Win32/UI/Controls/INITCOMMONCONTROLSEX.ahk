#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INITCOMMONCONTROLSEX_ICC.ahk" { INITCOMMONCONTROLSEX_ICC }

/**
 * Carries information used to load common control classes from the dynamic-link library (DLL). This structure is used with the InitCommonControlsEx function.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-initcommoncontrolsex
 * @namespace Windows.Win32.UI.Controls
 */
export default struct INITCOMMONCONTROLSEX {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwICC : INITCOMMONCONTROLSEX_ICC

}
