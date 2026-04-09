#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SharedVirtualDiskSupportType.ahk
#Include .\SharedVirtualDiskHandleState.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SHARED_VIRTUAL_DISK_SUPPORT extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {SharedVirtualDiskSupportType}
     */
    SharedVirtualDiskSupport {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SharedVirtualDiskHandleState}
     */
    HandleState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
