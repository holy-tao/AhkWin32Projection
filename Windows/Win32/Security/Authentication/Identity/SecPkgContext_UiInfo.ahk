#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_UiInfo extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hParentWindow{
        get {
            if(!this.HasProp("__hParentWindow"))
                this.__hParentWindow := HWND(0, this)
            return this.__hParentWindow
        }
    }
}
