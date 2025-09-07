#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_SESSION_INFO extends Win32Struct
{
    static sizeof => 146

    static packingSize => 2

    /**
     * @type {Integer}
     */
    uSessionInfoLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    ucSessionInfo{
        get {
            if(!this.HasProp("__ucSessionInfoProxyArray"))
                this.__ucSessionInfoProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__ucSessionInfoProxyArray
        }
    }
}
