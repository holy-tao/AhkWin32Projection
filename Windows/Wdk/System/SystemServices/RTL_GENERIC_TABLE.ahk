#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class RTL_GENERIC_TABLE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<RTL_SPLAY_LINKS>}
     */
    TableRoot {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {LIST_ENTRY}
     */
    InsertOrderList{
        get {
            if(!this.HasProp("__InsertOrderList"))
                this.__InsertOrderList := LIST_ENTRY(8, this)
            return this.__InsertOrderList
        }
    }

    /**
     * @type {Pointer<LIST_ENTRY>}
     */
    OrderedPointer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    WhichOrderedElement {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    NumberGenericTableElements {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<PRTL_GENERIC_COMPARE_ROUTINE>}
     */
    CompareRoutine {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PRTL_GENERIC_ALLOCATE_ROUTINE>}
     */
    AllocateRoutine {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PRTL_GENERIC_FREE_ROUTINE>}
     */
    FreeRoutine {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    TableContext {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
