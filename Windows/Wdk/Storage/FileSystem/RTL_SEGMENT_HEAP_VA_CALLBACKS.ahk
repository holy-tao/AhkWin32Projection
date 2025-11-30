#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class RTL_SEGMENT_HEAP_VA_CALLBACKS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    CallbackContext{
        get {
            if(!this.HasProp("__CallbackContext"))
                this.__CallbackContext := HANDLE(0, this)
            return this.__CallbackContext
        }
    }

    /**
     * @type {Pointer<PALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK>}
     */
    AllocateVirtualMemory {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PFREE_VIRTUAL_MEMORY_EX_CALLBACK>}
     */
    FreeVirtualMemory {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PQUERY_VIRTUAL_MEMORY_CALLBACK>}
     */
    QueryVirtualMemory {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
