#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_UiInfo {
    #StructPack 8

    hParentWindow : HWND

}
