#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_CONNECTIVITY_PROFILE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<Char>}
     */
    pszXmlFragmentIhvConnectivity {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
