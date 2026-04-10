#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPLOCK_NOTIFY_REASON.ahk
#Include ..\..\Foundation\IRP.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class OPLOCK_NOTIFY_PARAMS extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {OPLOCK_NOTIFY_REASON}
     */
    NotifyReason {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    NotifyContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IRP>}
     */
    Irp {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
