#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_PROCESS_INFORMATION
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_PROCESS_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ProcessId {
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
     * @type {HANDLE}
     */
    StdInput{
        get {
            if(!this.HasProp("__StdInput"))
                this.__StdInput := HANDLE(8, this)
            return this.__StdInput
        }
    }

    /**
     * @type {HANDLE}
     */
    StdOutput{
        get {
            if(!this.HasProp("__StdOutput"))
                this.__StdOutput := HANDLE(16, this)
            return this.__StdOutput
        }
    }

    /**
     * @type {HANDLE}
     */
    StdError{
        get {
            if(!this.HasProp("__StdError"))
                this.__StdError := HANDLE(24, this)
            return this.__StdError
        }
    }
}
