#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PCI_HARDWARE_INTERFACE.ahk
#Include .\PCI_BUS_WIDTH.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_ROOT_BUS_HARDWARE_CAPABILITY extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PCI_HARDWARE_INTERFACE}
     */
    SecondaryInterface {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    BusCapabilitiesFound {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CurrentSpeedAndMode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SupportedSpeedsAndModes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    DeviceIDMessagingCapable {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {PCI_BUS_WIDTH}
     */
    SecondaryBusWidth {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Pointer}
     */
    OscFeatureSupport {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    OscControlRequest {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    OscControlGranted {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
