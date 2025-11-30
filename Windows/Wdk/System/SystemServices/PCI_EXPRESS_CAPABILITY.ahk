#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_CAPABILITY extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * @type {Pointer<PCI_CAPABILITIES_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CAPABILITIES_REGISTER>}
     */
    ExpressCapabilities {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DEVICE_CAPABILITIES_REGISTER>}
     */
    DeviceCapabilities {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DEVICE_CONTROL_REGISTER>}
     */
    DeviceControl {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DEVICE_STATUS_REGISTER>}
     */
    DeviceStatus {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_LINK_CAPABILITIES_REGISTER>}
     */
    LinkCapabilities {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_LINK_CONTROL_REGISTER>}
     */
    LinkControl {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_LINK_STATUS_REGISTER>}
     */
    LinkStatus {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_SLOT_CAPABILITIES_REGISTER>}
     */
    SlotCapabilities {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_SLOT_CONTROL_REGISTER>}
     */
    SlotControl {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_SLOT_STATUS_REGISTER>}
     */
    SlotStatus {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_ROOT_CONTROL_REGISTER>}
     */
    RootControl {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_ROOT_CAPABILITIES_REGISTER>}
     */
    RootCapabilities {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_ROOT_STATUS_REGISTER>}
     */
    RootStatus {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DEVICE_CAPABILITIES_2_REGISTER>}
     */
    DeviceCapabilities2 {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DEVICE_CONTROL_2_REGISTER>}
     */
    DeviceControl2 {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DEVICE_STATUS_2_REGISTER>}
     */
    DeviceStatus2 {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_LINK_CAPABILITIES_2_REGISTER>}
     */
    LinkCapabilities2 {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_LINK_CONTROL_2_REGISTER>}
     */
    LinkControl2 {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_LINK_STATUS_2_REGISTER>}
     */
    LinkStatus2 {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
