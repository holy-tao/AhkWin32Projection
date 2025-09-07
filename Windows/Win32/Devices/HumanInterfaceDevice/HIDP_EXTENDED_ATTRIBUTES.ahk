#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class HIDP_EXTENDED_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumGlobalUnknowns {
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

    /**
     * @type {Pointer<HIDP_UNKNOWN_TOKEN>}
     */
    GlobalUnknowns {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "uint")
            return this.__DataProxyArray
        }
    }
}
