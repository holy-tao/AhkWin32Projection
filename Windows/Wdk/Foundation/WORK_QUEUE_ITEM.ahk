#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class WORK_QUEUE_ITEM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    List{
        get {
            if(!this.HasProp("__List"))
                this.__List := LIST_ENTRY(0, this)
            return this.__List
        }
    }

    /**
     * @type {Pointer<PWORKER_THREAD_ROUTINE>}
     */
    WorkerRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    Parameter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
