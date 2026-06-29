#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_MESSAGE_SEVERITY.ahk" { D3D11_MESSAGE_SEVERITY }
#Import ".\D3D11_MESSAGE_CATEGORY.ahk" { D3D11_MESSAGE_CATEGORY }
#Import ".\D3D11_MESSAGE_ID.ahk" { D3D11_MESSAGE_ID }

/**
 * A debug message in the Information Queue. (D3D11_MESSAGE)
 * @remarks
 * This structure is returned from <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getmessage">ID3D11InfoQueue::GetMessage</a> as part of the Information Queue feature (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11infoqueue">ID3D11InfoQueue Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_message
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_MESSAGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a></b>
     * 
     * The category of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a>.
     */
    Category : D3D11_MESSAGE_CATEGORY

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a></b>
     * 
     * The severity of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a>.
     */
    Severity : D3D11_MESSAGE_SEVERITY

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a></b>
     * 
     * The ID of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a>.
     */
    ID : D3D11_MESSAGE_ID

    /**
     * Type: <b>const char*</b>
     * 
     * The message string.
     */
    pDescription : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The length of pDescription in bytes.
     */
    DescriptionByteLength : IntPtr

}
