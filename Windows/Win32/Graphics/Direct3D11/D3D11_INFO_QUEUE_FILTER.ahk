#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_MESSAGE_SEVERITY.ahk" { D3D11_MESSAGE_SEVERITY }
#Import ".\D3D11_MESSAGE_CATEGORY.ahk" { D3D11_MESSAGE_CATEGORY }
#Import ".\D3D11_MESSAGE_ID.ahk" { D3D11_MESSAGE_ID }
#Import ".\D3D11_INFO_QUEUE_FILTER_DESC.ahk" { D3D11_INFO_QUEUE_FILTER_DESC }

/**
 * Debug message filter; contains a lists of message types to allow or deny. (D3D11_INFO_QUEUE_FILTER)
 * @remarks
 * For use with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11infoqueue">ID3D11InfoQueue Interface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_INFO_QUEUE_FILTER {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter_desc">D3D11_INFO_QUEUE_FILTER_DESC</a></b>
     * 
     * Types of messages that you want to allow. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter_desc">D3D11_INFO_QUEUE_FILTER_DESC</a>.
     */
    AllowList : D3D11_INFO_QUEUE_FILTER_DESC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter_desc">D3D11_INFO_QUEUE_FILTER_DESC</a></b>
     * 
     * Types of messages that you want to deny.
     */
    DenyList : D3D11_INFO_QUEUE_FILTER_DESC

}
