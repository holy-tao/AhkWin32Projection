#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGI_INFO_QUEUE_MESSAGE_SEVERITY.ahk" { DXGI_INFO_QUEUE_MESSAGE_SEVERITY }
#Import ".\DXGI_INFO_QUEUE_MESSAGE_CATEGORY.ahk" { DXGI_INFO_QUEUE_MESSAGE_CATEGORY }
#Import ".\DXGI_INFO_QUEUE_FILTER_DESC.ahk" { DXGI_INFO_QUEUE_FILTER_DESC }

/**
 * Describes a debug message filter, which contains lists of message types to allow and deny.
 * @remarks
 * Use with an <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nn-dxgidebug-idxgiinfoqueue">IDXGIInfoQueue</a> interface.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_INFO_QUEUE_FILTER {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter_desc">DXGI_INFO_QUEUE_FILTER_DESC</a> structure that describes the types of messages to allow.
     */
    AllowList : DXGI_INFO_QUEUE_FILTER_DESC

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter_desc">DXGI_INFO_QUEUE_FILTER_DESC</a> structure that describes the types of messages to deny.
     */
    DenyList : DXGI_INFO_QUEUE_FILTER_DESC

}
