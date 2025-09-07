#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER_V1 extends Win32Struct
{
    static sizeof => 36

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    SourceGuid {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    LogTag {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 14, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Initialize {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Uninitialize {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }
}
