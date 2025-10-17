#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class CRITICAL_SECTION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<CRITICAL_SECTION_DEBUG>}
     */
    DebugInfo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LockCount {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RecursionCount {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {HANDLE}
     */
    OwningThread{
        get {
            if(!this.HasProp("__OwningThread"))
                this.__OwningThread := HANDLE(16, this)
            return this.__OwningThread
        }
    }

    /**
     * @type {HANDLE}
     */
    LockSemaphore{
        get {
            if(!this.HasProp("__LockSemaphore"))
                this.__LockSemaphore := HANDLE(24, this)
            return this.__LockSemaphore
        }
    }

    /**
     * @type {Pointer}
     */
    SpinCount {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
