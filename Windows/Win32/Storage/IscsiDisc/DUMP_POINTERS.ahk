#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class DUMP_POINTERS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<IntPtr>}
     */
    AdapterObject {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    MappedRegisterBase {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    DumpData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    CommonBufferVa {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CommonBufferPa {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    CommonBufferSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    AllocateCommonBuffers {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    UseDiskDump {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * @type {Array<Byte>}
     */
    Spare1{
        get {
            if(!this.HasProp("__Spare1ProxyArray"))
                this.__Spare1ProxyArray := Win32FixedArray(this.ptr + 46, 2, Primitive, "char")
            return this.__Spare1ProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceObject {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
