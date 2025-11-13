#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_AUTH_DHCHAP_DESCRIPTOR extends Win32Struct
{
    static sizeof => 64

    static packingSize => 1

    /**
     * @type {Integer}
     */
    AuthId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    HALEN {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    DHLEN {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    IdList{
        get {
            if(!this.HasProp("__IdListProxyArray"))
                this.__IdListProxyArray := Win32FixedArray(this.ptr + 4, 60, Primitive, "char")
            return this.__IdListProxyArray
        }
    }
}
