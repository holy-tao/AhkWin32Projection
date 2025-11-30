#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class DRIVER_OBJECT extends Win32Struct
{
    static sizeof => 336

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    DeviceObject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    DriverStart {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    DriverSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    DriverSection {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<DRIVER_EXTENSION>}
     */
    DriverExtension {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {UNICODE_STRING}
     */
    DriverName{
        get {
            if(!this.HasProp("__DriverName"))
                this.__DriverName := UNICODE_STRING(56, this)
            return this.__DriverName
        }
    }

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    HardwareDatabase {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<FAST_IO_DISPATCH>}
     */
    FastIoDispatch {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<DRIVER_INITIALIZE>}
     */
    DriverInit {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<DRIVER_STARTIO>}
     */
    DriverStartIo {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<DRIVER_UNLOAD>}
     */
    DriverUnload {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Array<DRIVER_DISPATCH>}
     */
    MajorFunction{
        get {
            if(!this.HasProp("__MajorFunctionProxyArray"))
                this.__MajorFunctionProxyArray := Win32FixedArray(this.ptr + 112, 28, Primitive, "ptr")
            return this.__MajorFunctionProxyArray
        }
    }
}
