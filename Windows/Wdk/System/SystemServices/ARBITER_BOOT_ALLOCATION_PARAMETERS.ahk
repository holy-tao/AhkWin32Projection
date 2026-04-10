#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class ARBITER_BOOT_ALLOCATION_PARAMETERS extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<LIST_ENTRY>}
     */
    ArbitrationList {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
