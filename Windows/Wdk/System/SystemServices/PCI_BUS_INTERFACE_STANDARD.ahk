#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PINTERFACE_DEREFERENCE.ahk
#Include .\PINTERFACE_REFERENCE.ahk
#Include .\PPCI_EXPRESS_WAKE_CONTROL.ahk
#Include .\PPCI_LINE_TO_PIN.ahk
#Include .\PPCI_PIN_TO_LINE.ahk
#Include .\PPCI_PREPARE_MULTISTAGE_RESUME.ahk
#Include .\PPCI_READ_WRITE_CONFIG.ahk
#Include .\PPCI_ROOT_BUS_CAPABILITY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_BUS_INTERFACE_STANDARD extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PINTERFACE_REFERENCE>}
     */
    InterfaceReference {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PINTERFACE_DEREFERENCE>}
     */
    InterfaceDereference {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PPCI_READ_WRITE_CONFIG>}
     */
    ReadConfig {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PPCI_READ_WRITE_CONFIG>}
     */
    WriteConfig {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PPCI_PIN_TO_LINE>}
     */
    PinToLine {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PPCI_LINE_TO_PIN>}
     */
    LineToPin {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PPCI_ROOT_BUS_CAPABILITY>}
     */
    RootBusCapability {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PPCI_EXPRESS_WAKE_CONTROL>}
     */
    ExpressWakeControl {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PPCI_PREPARE_MULTISTAGE_RESUME>}
     */
    PrepareMultistageResume {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
