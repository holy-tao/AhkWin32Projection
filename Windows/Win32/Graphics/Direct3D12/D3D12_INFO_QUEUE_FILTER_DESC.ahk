#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_MESSAGE_CATEGORY.ahk" { D3D12_MESSAGE_CATEGORY }
#Import ".\D3D12_MESSAGE_SEVERITY.ahk" { D3D12_MESSAGE_SEVERITY }
#Import ".\D3D12_MESSAGE_ID.ahk" { D3D12_MESSAGE_ID }

/**
 * Allow or deny certain types of messages to pass through a filter. (D3D12_INFO_QUEUE_FILTER_DESC)
 * @remarks
 * For use with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a> Interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_INFO_QUEUE_FILTER_DESC {
    #StructPack 8

    /**
     * Number of message categories to allow or deny.
     */
    NumCategories : UInt32

    /**
     * Array of message categories to allow or deny. Array must have at least <i>NumCategories</i> members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category">D3D12_MESSAGE_CATEGORY</a>).
     */
    pCategoryList : D3D12_MESSAGE_CATEGORY.Ptr

    /**
     * Number of message severity levels to allow or deny.
     */
    NumSeverities : UInt32

    /**
     * Array of message severity levels to allow or deny. Array must have at least <i>NumSeverities</i> members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity">D3D12_MESSAGE_SEVERITY</a>).
     */
    pSeverityList : D3D12_MESSAGE_SEVERITY.Ptr

    /**
     * Number of message IDs to allow or deny.
     */
    NumIDs : UInt32

    /**
     * Array of message IDs to allow or deny. Array must have at least <i>NumIDs</i> members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_id">D3D12_MESSAGE_ID</a>).
     */
    pIDList : D3D12_MESSAGE_ID.Ptr

}
