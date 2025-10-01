#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class SIPAEVENT_REFS_ROLLBACK_PROTECTION_USER_PAYLOAD_HASH_DATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    ChecksumType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    ChecksumBuffer{
        get {
            if(!this.HasProp("__ChecksumBufferProxyArray"))
                this.__ChecksumBufferProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__ChecksumBufferProxyArray
        }
    }
}
