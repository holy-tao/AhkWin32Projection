#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\DRIVER_OBJECT.ahk
#Include .\DEVOBJ_EXTENSION.ahk
#Include .\VPB.ahk
#Include ..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk
#Include .\PIO_TIMER.ahk
#Include .\DEVICE_OBJECT.ahk
#Include .\IRP.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class DEVICE_OBJECT extends Win32Struct {
    static sizeof => 160

    static packingSize => 8

    class _Queue extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        ListEntry {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        Wcb {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

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
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    ReferenceCount {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<DRIVER_OBJECT>}
     */
    DriverObject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    NextDevice {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    AttachedDevice {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<IRP>}
     */
    CurrentIrp {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {PIO_TIMER}
     */
    Timer {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Characteristics {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Pointer<VPB>}
     */
    Vpb {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceExtension {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    StackSize {
        get => NumGet(this, 76, "char")
        set => NumPut("char", value, this, 76)
    }

    /**
     * @type {_Queue}
     */
    Queue {
        get {
            if(!this.HasProp("__Queue"))
                this.__Queue := DEVICE_OBJECT._Queue(80, this)
            return this.__Queue
        }
    }

    /**
     * @type {Integer}
     */
    AlignmentRequirement {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    DeviceQueue {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    Dpc {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    ActiveThreadCount {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {PSECURITY_DESCRIPTOR}
     */
    SecurityDescriptor {
        get {
            if(!this.HasProp("__SecurityDescriptor"))
                this.__SecurityDescriptor := PSECURITY_DESCRIPTOR(120, this)
            return this.__SecurityDescriptor
        }
    }

    /**
     * @type {Pointer}
     */
    DeviceLock {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    SectorSize {
        get => NumGet(this, 136, "ushort")
        set => NumPut("ushort", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    Spare1 {
        get => NumGet(this, 138, "ushort")
        set => NumPut("ushort", value, this, 138)
    }

    /**
     * @type {Pointer<DEVOBJ_EXTENSION>}
     */
    DeviceObjectExtension {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
