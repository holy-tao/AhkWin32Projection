#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
     * @type {HANDLE}
     */
    StdInput{
        get {
            if(!this.HasProp("__StdInput"))
                this.__StdInput := HANDLE(this.ptr + 8)
            return this.__StdInput
        }
    }

    /**
     * If created, standard output handle of the process.
     * @type {HANDLE}
     */
    StdOutput{
        get {
            if(!this.HasProp("__StdOutput"))
                this.__StdOutput := HANDLE(this.ptr + 16)
            return this.__StdOutput
        }
    }

    /**
     * If created, standard error handle of the process.
     * @type {HANDLE}
     */
    StdError{
        get {
            if(!this.HasProp("__StdError"))
                this.__StdError := HANDLE(this.ptr + 24)
            return this.__StdError
        }
    }
}
