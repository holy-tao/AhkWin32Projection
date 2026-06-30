#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXGI_INFO_QUEUE_MESSAGE_SEVERITY.ahk
#Include .\DXGI_INFO_QUEUE_MESSAGE_CATEGORY.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a debug message in the information queue.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessage">IDXGIInfoQueue::GetMessage</a> returns a pointer to this structure.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_message
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_INFO_QUEUE_MESSAGE extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that produced the message.
     * @type {Guid}
     */
    Producer {
        get {
            if(!this.HasProp("__Producer"))
                this.__Producer := Guid(0, this)
            return this.__Producer
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a>-typed value that specifies the category of the message.
     * @type {DXGI_INFO_QUEUE_MESSAGE_CATEGORY}
     */
    Category {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @type {DXGI_INFO_QUEUE_MESSAGE_SEVERITY}
     */
    Severity {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * An integer that uniquely identifies the message.
     * @type {Integer}
     */
    ID {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The message string.
     * @type {Pointer<Integer>}
     */
    pDescription {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The length of the message string at <b>pDescription</b>, in bytes.
     * @type {Pointer}
     */
    DescriptionByteLength {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
