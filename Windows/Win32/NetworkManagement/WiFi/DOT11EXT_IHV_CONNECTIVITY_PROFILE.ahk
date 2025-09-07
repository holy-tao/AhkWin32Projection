#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_CONNECTIVITY_PROFILE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszXmlFragmentIhvConnectivity{
        get {
            if(!this.HasProp("__pszXmlFragmentIhvConnectivity"))
                this.__pszXmlFragmentIhvConnectivity := PWSTR(this.ptr + 0)
            return this.__pszXmlFragmentIhvConnectivity
        }
    }
}
