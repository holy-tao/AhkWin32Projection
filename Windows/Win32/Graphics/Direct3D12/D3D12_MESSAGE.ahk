#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_MESSAGE_CATEGORY.ahk" { D3D12_MESSAGE_CATEGORY }
#Import ".\D3D12_MESSAGE_SEVERITY.ahk" { D3D12_MESSAGE_SEVERITY }
#Import ".\D3D12_MESSAGE_ID.ahk" { D3D12_MESSAGE_ID }

/**
 * A debug message in the Information Queue. (D3D12_MESSAGE)
 * @remarks
 * This structure is returned from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getmessage">ID3D12InfoQueue::GetMessage</a> as part of the Information Queue feature (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_message
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_MESSAGE {
    #StructPack 8

    /**
     * The category of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category">D3D12_MESSAGE_CATEGORY</a>.
     */
    Category : D3D12_MESSAGE_CATEGORY

    /**
     * The severity of the message. See  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity">D3D12_MESSAGE_SEVERITY</a>.
     */
    Severity : D3D12_MESSAGE_SEVERITY

    /**
     * The ID of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_id">D3D12_MESSAGE_ID</a>.
     */
    ID : D3D12_MESSAGE_ID

    /**
     * The message string.
     */
    pDescription : IntPtr

    /**
     * The length of <i>pDescription</i>, in bytes.
     */
    DescriptionByteLength : IntPtr

}
