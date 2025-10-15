#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_BASIC_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {NTSTATUS}
     */
    ExitStatus{
        get {
            if(!this.HasProp("__ExitStatus"))
                this.__ExitStatus := NTSTATUS(this.ptr + 0)
            return this.__ExitStatus
        }
    }

    /**
     * @type {Pointer<PEB>}
     */
    PebBaseAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    AffinityMask {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BasePriority {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    UniqueProcessId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    InheritedFromUniqueProcessId {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
