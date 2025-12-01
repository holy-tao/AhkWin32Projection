#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A debug message in the Information Queue. (D3D10_MESSAGE)
 * @remarks
 * This structure is returned from <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getmessage">ID3D10InfoQueue::GetMessage</a> as part of the Information Queue feature (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nn-d3d10sdklayers-id3d10infoqueue">ID3D10InfoQueue Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_message
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_MESSAGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a></b>
     * 
     * The category of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a>.
     * @type {Integer}
     */
    Category {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a></b>
     * 
     * The severity of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a>.
     * @type {Integer}
     */
    Severity {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a></b>
     * 
     * The ID of the message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a>.
     * @type {Integer}
     */
    ID {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>const char*</b>
     * 
     * The message string.
     * @type {Pointer<Integer>}
     */
    pDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The length of pDescription in bytes.
     * @type {Pointer}
     */
    DescriptionByteLength {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
