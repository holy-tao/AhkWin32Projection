#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DUMP_POINTERS_VERSION.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class DUMP_POINTERS_EX extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {DUMP_POINTERS_VERSION}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := DUMP_POINTERS_VERSION(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    DumpData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    CommonBufferVa {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CommonBufferSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOLEAN}
     */
    AllocateCommonBuffers {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceObject {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    DriverList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwPortFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MaxDeviceDumpSectionSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    MaxDeviceDumpLevel {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    MaxTransferSize {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Pointer<Void>}
     */
    AdapterObject {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Void>}
     */
    MappedRegisterBase {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<BOOLEAN>}
     */
    DeviceReady {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PDUMP_DEVICE_POWERON_ROUTINE>}
     */
    DumpDevicePowerOn {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<Void>}
     */
    DumpDevicePowerOnContext {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
