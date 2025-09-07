#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Allow or deny certain types of messages to pass through a filter. (D3D12_INFO_QUEUE_FILTER_DESC)
 * @remarks
 * For use with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a> Interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INFO_QUEUE_FILTER_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Number of message categories to allow or deny.
     * @type {Integer}
     */
    NumCategories {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of message categories to allow or deny. Array must have at least <i>NumCategories</i> members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category">D3D12_MESSAGE_CATEGORY</a>).
     * @type {Pointer<Int32>}
     */
    pCategoryList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Number of message severity levels to allow or deny.
     * @type {Integer}
     */
    NumSeverities {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of message severity levels to allow or deny. Array must have at least <i>NumSeverities</i> members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity">D3D12_MESSAGE_SEVERITY</a>).
     * @type {Pointer<Int32>}
     */
    pSeverityList {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Number of message IDs to allow or deny.
     * @type {Integer}
     */
    NumIDs {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Array of message IDs to allow or deny. Array must have at least <i>NumIDs</i> members (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_id">D3D12_MESSAGE_ID</a>).
     * @type {Pointer<Int32>}
     */
    pIDList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
