#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the types of messages to allow or deny to pass through a filter.
 * @remarks
 * 
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure.
 * 
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/ns-dxgidebug-dxgi_info_queue_filter_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_INFO_QUEUE_FILTER_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The number of message categories to allow or deny.
     * @type {Integer}
     */
    NumCategories {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a> enumeration values that describe the message categories to allow or deny. The array must have at least <b>NumCategories</b> number of elements.
     * @type {Pointer<Integer>}
     */
    pCategoryList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of message severity levels to allow or deny.
     * @type {Integer}
     */
    NumSeverities {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a> enumeration values that describe the message severity levels to allow or deny. The array must have at least <b>NumSeverities</b> number of elements.
     * @type {Pointer<Integer>}
     */
    pSeverityList {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The number of message IDs to allow or deny.
     * @type {Integer}
     */
    NumIDs {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of integers that represent the message IDs to allow or deny. The array must have at least <b>NumIDs</b> number of elements.
     * @type {Pointer<Integer>}
     */
    pIDList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
