#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A debug message in the Information Queue. (D3D12_MESSAGE)
 * @remarks
 * This structure is returned from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getmessage">ID3D12InfoQueue::GetMessage</a> as part of the Information Queue feature (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_message
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MESSAGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The category of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category">D3D12_MESSAGE_CATEGORY</a>.
     * @type {Integer}
     */
    Category {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The severity of the message. See  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity">D3D12_MESSAGE_SEVERITY</a>.
     * @type {Integer}
     */
    Severity {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The ID of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_id">D3D12_MESSAGE_ID</a>.
     * @type {Integer}
     */
    ID {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The message string.
     * @type {Pointer<Byte>}
     */
    pDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The length of <i>pDescription</i>, in bytes.
     * @type {Pointer}
     */
    DescriptionByteLength {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
