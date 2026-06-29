#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_MESSAGE_SEVERITY.ahk" { D3D11_MESSAGE_SEVERITY }
#Import ".\D3D11_MESSAGE_CATEGORY.ahk" { D3D11_MESSAGE_CATEGORY }
#Import ".\D3D11_MESSAGE_ID.ahk" { D3D11_MESSAGE_ID }

/**
 * Allow or deny certain types of messages to pass through a filter. (D3D11_INFO_QUEUE_FILTER_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_INFO_QUEUE_FILTER_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of message categories to allow or deny.
     */
    NumCategories : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a>*</b>
     * 
     * Array of message categories to allow or deny. Array must have at least NumCategories members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a>).
     */
    pCategoryList : D3D11_MESSAGE_CATEGORY.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of message severity levels to allow or deny.
     */
    NumSeverities : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a>*</b>
     * 
     * Array of message severity levels to allow or deny. Array must have at least NumSeverities members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a>).
     */
    pSeverityList : D3D11_MESSAGE_SEVERITY.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of message IDs to allow or deny.
     */
    NumIDs : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a>*</b>
     * 
     * Array of message IDs to allow or deny. Array must have at least NumIDs members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a>).
     */
    pIDList : D3D11_MESSAGE_ID.Ptr

}
