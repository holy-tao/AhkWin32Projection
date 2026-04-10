#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IO_RESOURCE_DESCRIPTOR.ahk
#Include ..\..\Foundation\DEVICE_OBJECT.ahk
#Include .\ARBITER_REQUEST_SOURCE.ahk
#Include .\INTERFACE_TYPE.ahk
#Include .\CM_PARTIAL_RESOURCE_DESCRIPTOR.ahk
#Include .\ARBITER_RESULT.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class ARBITER_LIST_ENTRY extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    ListEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AlternativeCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<IO_RESOURCE_DESCRIPTOR>}
     */
    Alternatives {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    PhysicalDeviceObject {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {ARBITER_REQUEST_SOURCE}
     */
    RequestSource {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer}
     */
    WorkSpace {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {INTERFACE_TYPE}
     */
    InterfaceType {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    SlotNumber {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    BusNumber {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>}
     */
    Assignment {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IO_RESOURCE_DESCRIPTOR>}
     */
    SelectedAlternative {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {ARBITER_RESULT}
     */
    Result {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}
