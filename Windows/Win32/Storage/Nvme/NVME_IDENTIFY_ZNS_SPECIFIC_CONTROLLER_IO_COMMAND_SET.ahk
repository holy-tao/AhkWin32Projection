#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_ZNS_SPECIFIC_CONTROLLER_IO_COMMAND_SET extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 1

    /**
     * @type {Integer}
     */
    ZASL {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
