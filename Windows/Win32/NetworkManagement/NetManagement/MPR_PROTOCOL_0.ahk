#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class MPR_PROTOCOL_0 extends Win32Struct
{
    static sizeof => 184

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwProtocolId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    wszProtocol {
        get => StrGet(this.ptr + 4, 40, "UTF-16")
        set => StrPut(value, this.ptr + 4, 40, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszDLLName {
        get => StrGet(this.ptr + 86, 48, "UTF-16")
        set => StrPut(value, this.ptr + 86, 48, "UTF-16")
    }
}
