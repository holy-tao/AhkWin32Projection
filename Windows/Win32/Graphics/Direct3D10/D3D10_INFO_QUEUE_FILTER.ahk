#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_MESSAGE_CATEGORY.ahk" { D3D10_MESSAGE_CATEGORY }
#Import ".\D3D10_MESSAGE_ID.ahk" { D3D10_MESSAGE_ID }
#Import ".\D3D10_INFO_QUEUE_FILTER_DESC.ahk" { D3D10_INFO_QUEUE_FILTER_DESC }
#Import ".\D3D10_MESSAGE_SEVERITY.ahk" { D3D10_MESSAGE_SEVERITY }

/**
 * Debug message filter; contains a lists of message types to allow or deny. (D3D10_INFO_QUEUE_FILTER)
 * @remarks
 * For use with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nn-d3d10sdklayers-id3d10infoqueue">ID3D10InfoQueue Interface</a>.
 * 
 * Providing an allow list with non-zero values causes only the specified combination of categories, severities and message IDs to be allowed.  
 *       Messages that do not match the specified combination will be rejected.
 * 
 * Providing a deny list with non-zero values causes the specified combination of categories, severities and message IDs to be rejected.
 *       Messages that do not match the specified combination will be allowed.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_INFO_QUEUE_FILTER {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc">D3D10_INFO_QUEUE_FILTER_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc">D3D10_INFO_QUEUE_FILTER_DESC</a> structure describing the types of messages the info queue should allow.
     */
    AllowList : D3D10_INFO_QUEUE_FILTER_DESC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc">D3D10_INFO_QUEUE_FILTER_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc">D3D10_INFO_QUEUE_FILTER_DESC</a> structure describing the types of messages the info queue should reject.
     */
    DenyList : D3D10_INFO_QUEUE_FILTER_DESC

}
