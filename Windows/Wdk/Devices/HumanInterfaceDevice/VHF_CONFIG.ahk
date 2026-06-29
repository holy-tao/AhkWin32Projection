#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Devices.HumanInterfaceDevice
 */
class VHF_CONFIG extends Win32Struct {
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    VhfClientContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    OperationContextSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {HANDLE}
     */
    FileHandle {
        get {
            if(!this.HasProp("__FileHandle"))
                this.__FileHandle := HANDLE(24, this)
            return this.__FileHandle
        }
    }

    /**
     * @type {Integer}
     */
    VendorID {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ProductID {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    VersionNumber {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * @type {Guid}
     */
    ContainerID {
        get {
            if(!this.HasProp("__ContainerID"))
                this.__ContainerID := Guid(40, this)
            return this.__ContainerID
        }
    }

    /**
     * @type {Integer}
     */
    InstanceIDLength {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    InstanceID {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ReportDescriptorLength {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ReportDescriptor {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<EVT_VHF_READY_FOR_NEXT_READ_REPORT>}
     */
    EvtVhfReadyForNextReadReport {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<EVT_VHF_ASYNC_OPERATION>}
     */
    EvtVhfAsyncOperationGetFeature {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<EVT_VHF_ASYNC_OPERATION>}
     */
    EvtVhfAsyncOperationSetFeature {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<EVT_VHF_ASYNC_OPERATION>}
     */
    EvtVhfAsyncOperationWriteReport {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<EVT_VHF_ASYNC_OPERATION>}
     */
    EvtVhfAsyncOperationGetInputReport {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<EVT_VHF_CLEANUP>}
     */
    EvtVhfCleanup {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    HardwareIDsLength {
        get => NumGet(this, 136, "ushort")
        set => NumPut("ushort", value, this, 136)
    }

    /**
     * @type {PWSTR}
     */
    HardwareIDs {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
