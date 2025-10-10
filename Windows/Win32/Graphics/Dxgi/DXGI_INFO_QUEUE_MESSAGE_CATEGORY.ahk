#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that specify categories of debug messages.
 * @remarks
 * 
  * Use this enumeration when you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessage">IDXGIInfoQueue::GetMessage</a> to retrieve a message and when you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addmessage">IDXGIInfoQueue::AddMessage</a> to add a message. When you create an info queue filter, you can use these values to allow or deny any categories of messages to pass through the storage and retrieval filters.
  * 
  * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_INFO_QUEUE_MESSAGE_CATEGORY{

    /**
     * Unknown category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_UNKNOWN => 0

    /**
     * Miscellaneous category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_MISCELLANEOUS => 1

    /**
     * Initialization category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_INITIALIZATION => 2

    /**
     * Cleanup category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_CLEANUP => 3

    /**
     * Compilation category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_COMPILATION => 4

    /**
     * State creation category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_CREATION => 5

    /**
     * State setting category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_SETTING => 6

    /**
     * State getting category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_GETTING => 7

    /**
     * Resource manipulation category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_RESOURCE_MANIPULATION => 8

    /**
     * Execution category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_EXECUTION => 9

    /**
     * Shader category.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_CATEGORY_SHADER => 10
}
