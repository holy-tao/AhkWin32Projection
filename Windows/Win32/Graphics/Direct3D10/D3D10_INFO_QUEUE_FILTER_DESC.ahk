#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_MESSAGE_CATEGORY.ahk" { D3D10_MESSAGE_CATEGORY }
#Import ".\D3D10_MESSAGE_ID.ahk" { D3D10_MESSAGE_ID }
#Import ".\D3D10_MESSAGE_SEVERITY.ahk" { D3D10_MESSAGE_SEVERITY }

/**
 * Allow or deny certain types of messages to pass through a filter. (D3D10_INFO_QUEUE_FILTER_DESC)
 * @remarks
 * <b>D3D10_INFO_QUEUE_FILTER_DESC</b> is used to define the allow list and deny list in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_INFO_QUEUE_FILTER_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of message categories to allow or deny.
     */
    NumCategories : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a>*</b>
     * 
     * Array of message categories to allow or deny. Array must have at least NumCategories members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a>).
     */
    pCategoryList : D3D10_MESSAGE_CATEGORY.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of message severity levels to allow or deny.
     */
    NumSeverities : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a>*</b>
     * 
     * Array of message severity levels to allow or deny. Array must have at least NumSeverities members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a>).
     */
    pSeverityList : D3D10_MESSAGE_SEVERITY.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of message IDs to allow or deny.
     */
    NumIDs : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a>*</b>
     * 
     * Array of message IDs to allow or deny. Array must have at least NumIDs members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a>).
     */
    pIDList : D3D10_MESSAGE_ID.Ptr

}
