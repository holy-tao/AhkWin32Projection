#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_INFO_QUEUE_FILTER_DESC.ahk" { D3D12_INFO_QUEUE_FILTER_DESC }
#Import ".\D3D12_MESSAGE_CATEGORY.ahk" { D3D12_MESSAGE_CATEGORY }
#Import ".\D3D12_MESSAGE_SEVERITY.ahk" { D3D12_MESSAGE_SEVERITY }
#Import ".\D3D12_MESSAGE_ID.ahk" { D3D12_MESSAGE_ID }

/**
 * Debug message filter; contains a lists of message types to allow or deny. (D3D12_INFO_QUEUE_FILTER)
 * @remarks
 * For use with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a> Interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_INFO_QUEUE_FILTER {
    #StructPack 8

    /**
     * Specifies types of messages that you want to allow. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter_desc">D3D12_INFO_QUEUE_FILTER_DESC</a>.
     */
    AllowList : D3D12_INFO_QUEUE_FILTER_DESC

    /**
     * Specifies types of messages that you want to deny.
     */
    DenyList : D3D12_INFO_QUEUE_FILTER_DESC

}
