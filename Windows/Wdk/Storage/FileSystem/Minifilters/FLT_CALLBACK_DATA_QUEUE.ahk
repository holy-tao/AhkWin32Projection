#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_CALLBACK_DATA_QUEUE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<IO_CSQ>}
     */
    Csq {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {PFLT_INSTANCE}
     */
    Instance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PFLT_CALLBACK_DATA_QUEUE_INSERT_IO>}
     */
    InsertIo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PFLT_CALLBACK_DATA_QUEUE_REMOVE_IO>}
     */
    RemoveIo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PFLT_CALLBACK_DATA_QUEUE_PEEK_NEXT_IO>}
     */
    PeekNextIo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PFLT_CALLBACK_DATA_QUEUE_ACQUIRE>}
     */
    Acquire {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PFLT_CALLBACK_DATA_QUEUE_RELEASE>}
     */
    Release {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PFLT_CALLBACK_DATA_QUEUE_COMPLETE_CANCELED_IO>}
     */
    CompleteCanceledIo {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
