#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGI_INFO_QUEUE_MESSAGE_SEVERITY.ahk" { DXGI_INFO_QUEUE_MESSAGE_SEVERITY }
#Import ".\DXGI_INFO_QUEUE_MESSAGE_CATEGORY.ahk" { DXGI_INFO_QUEUE_MESSAGE_CATEGORY }
#Import "..\..\..\..\Guid.ahk" { Guid }

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
export default struct DXGI_INFO_QUEUE_MESSAGE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that produced the message.
     */
    Producer : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a>-typed value that specifies the category of the message.
     */
    Category : DXGI_INFO_QUEUE_MESSAGE_CATEGORY

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     */
    Severity : DXGI_INFO_QUEUE_MESSAGE_SEVERITY

    /**
     * An integer that uniquely identifies the message.
     */
    ID : Int32

    /**
     * The message string.
     */
    pDescription : IntPtr

    /**
     * The length of the message string at <b>pDescription</b>, in bytes.
     */
    DescriptionByteLength : IntPtr

}
