#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CM_PARTIAL_RESOURCE_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class ARBITER_RETEST_ALLOCATION_PARAMETERS extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<LIST_ENTRY>}
     */
    ArbitrationList {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AllocateFromCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>}
     */
    AllocateFrom {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
