#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * HCS_PROCESS_INFORMATION
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_PROCESS_INFORMATION
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_PROCESS_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Identifier of the created process.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If created, standard input handle of the process.
     * @type {Pointer<Ptr>}
     */
    StdInput {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * If created, standard output handle of the process.
     * @type {Pointer<Ptr>}
     */
    StdOutput {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * If created, standard error handle of the process.
     * @type {Pointer<Ptr>}
     */
    StdError {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
