#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_DISEQC_SEND extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulRequestId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulPacketLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    argbPacketData{
        get {
            if(!this.HasProp("__argbPacketDataProxyArray"))
                this.__argbPacketDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__argbPacketDataProxyArray
        }
    }
}
