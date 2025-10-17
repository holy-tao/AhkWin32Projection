#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class CRITICAL_SECTION_DEBUG extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CreatorBackTraceIndex {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Pointer<CRITICAL_SECTION>}
     */
    CriticalSection {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {LIST_ENTRY}
     */
    ProcessLocksList{
        get {
            if(!this.HasProp("__ProcessLocksList"))
                this.__ProcessLocksList := LIST_ENTRY(16, this)
            return this.__ProcessLocksList
        }
    }

    /**
     * @type {Integer}
     */
    EntryCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ContentionCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CreatorBackTraceIndexHigh {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    Identifier {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }
}
