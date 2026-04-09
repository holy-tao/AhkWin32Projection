#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKsInterfaceHandler.ahk
#Include .\IKsDataTypeHandler.ahk
#Include .\KSIOOPERATION.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSSTREAM_SEGMENT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {IKsInterfaceHandler}
     */
    KsInterfaceHandler {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {IKsDataTypeHandler}
     */
    KsDataTypeHandler {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {KSIOOPERATION}
     */
    IoOperation {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {HANDLE}
     */
    CompletionEvent {
        get {
            if(!this.HasProp("__CompletionEvent"))
                this.__CompletionEvent := HANDLE(24, this)
            return this.__CompletionEvent
        }
    }
}
