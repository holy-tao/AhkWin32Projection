#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGI_INFO_QUEUE_MESSAGE_SEVERITY.ahk" { DXGI_INFO_QUEUE_MESSAGE_SEVERITY }
#Import ".\DXGI_INFO_QUEUE_MESSAGE_CATEGORY.ahk" { DXGI_INFO_QUEUE_MESSAGE_CATEGORY }

/**
 * Describes the types of messages to allow or deny to pass through a filter.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure.
 * 
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_INFO_QUEUE_FILTER_DESC {
    #StructPack 8

    /**
     * The number of message categories to allow or deny.
     */
    NumCategories : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a> enumeration values that describe the message categories to allow or deny. The array must have at least <b>NumCategories</b> number of elements.
     */
    pCategoryList : DXGI_INFO_QUEUE_MESSAGE_CATEGORY.Ptr

    /**
     * The number of message severity levels to allow or deny.
     */
    NumSeverities : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a> enumeration values that describe the message severity levels to allow or deny. The array must have at least <b>NumSeverities</b> number of elements.
     */
    pSeverityList : DXGI_INFO_QUEUE_MESSAGE_SEVERITY.Ptr

    /**
     * The number of message IDs to allow or deny.
     */
    NumIDs : UInt32

    /**
     * An array of integers that represent the message IDs to allow or deny. The array must have at least <b>NumIDs</b> number of elements.
     */
    pIDList : IntPtr

}
