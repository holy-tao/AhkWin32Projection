#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class HDV_PCI_DEVICE_INTERFACE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<HDV_PCI_DEVICE_INITIALIZE>}
     */
    Initialize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<HDV_PCI_DEVICE_TEARDOWN>}
     */
    Teardown {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<HDV_PCI_DEVICE_SET_CONFIGURATION>}
     */
    SetConfiguration {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<HDV_PCI_DEVICE_GET_DETAILS>}
     */
    GetDetails {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<HDV_PCI_DEVICE_START>}
     */
    Start {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<HDV_PCI_DEVICE_STOP>}
     */
    Stop {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<HDV_PCI_READ_CONFIG_SPACE>}
     */
    ReadConfigSpace {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<HDV_PCI_WRITE_CONFIG_SPACE>}
     */
    WriteConfigSpace {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<HDV_PCI_READ_INTERCEPTED_MEMORY>}
     */
    ReadInterceptedMemory {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<HDV_PCI_WRITE_INTERCEPTED_MEMORY>}
     */
    WriteInterceptedMemory {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
