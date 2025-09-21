#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class WINDBG_OLDKD_EXTENSION_APIS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    nSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PWINDBG_OUTPUT_ROUTINE>}
     */
    lpOutputRoutine {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PWINDBG_GET_EXPRESSION32>}
     */
    lpGetExpressionRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PWINDBG_GET_SYMBOL32>}
     */
    lpGetSymbolRoutine {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PWINDBG_DISASM32>}
     */
    lpDisasmRoutine {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWINDBG_CHECK_CONTROL_C>}
     */
    lpCheckControlCRoutine {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PWINDBG_READ_PROCESS_MEMORY_ROUTINE32>}
     */
    lpReadVirtualMemRoutine {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE32>}
     */
    lpWriteVirtualMemRoutine {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PWINDBG_OLDKD_READ_PHYSICAL_MEMORY>}
     */
    lpReadPhysicalMemRoutine {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PWINDBG_OLDKD_WRITE_PHYSICAL_MEMORY>}
     */
    lpWritePhysicalMemRoutine {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
