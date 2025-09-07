#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSSTREAM_SEGMENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<IKsInterfaceHandler>}
     */
    KsInterfaceHandler {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<IKsDataTypeHandler>}
     */
    KsDataTypeHandler {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    IoOperation {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {HANDLE}
     */
    CompletionEvent{
        get {
            if(!this.HasProp("__CompletionEvent"))
                this.__CompletionEvent := HANDLE(this.ptr + 24)
            return this.__CompletionEvent
        }
    }
}
