#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_SECURITY_PROFILE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszXmlFragmentIhvSecurity{
        get {
            if(!this.HasProp("__pszXmlFragmentIhvSecurity"))
                this.__pszXmlFragmentIhvSecurity := PWSTR(this.ptr + 0)
            return this.__pszXmlFragmentIhvSecurity
        }
    }

    /**
     * @type {BOOL}
     */
    bUseMSOnex{
        get {
            if(!this.HasProp("__bUseMSOnex"))
                this.__bUseMSOnex := BOOL(this.ptr + 8)
            return this.__bUseMSOnex
        }
    }
}
