#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_EMULATOR_CALLBACKS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<WHV_EMULATOR_IO_PORT_CALLBACK>}
     */
    WHvEmulatorIoPortCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<WHV_EMULATOR_MEMORY_CALLBACK>}
     */
    WHvEmulatorMemoryCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK>}
     */
    WHvEmulatorGetVirtualProcessorRegisters {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK>}
     */
    WHvEmulatorSetVirtualProcessorRegisters {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK>}
     */
    WHvEmulatorTranslateGvaPage {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
