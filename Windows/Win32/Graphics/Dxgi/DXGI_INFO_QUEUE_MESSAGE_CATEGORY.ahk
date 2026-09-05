#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that specify categories of debug messages.
 * @remarks
 * Use this enumeration when you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessage">IDXGIInfoQueue::GetMessage</a> to retrieve a message and when you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addmessage">IDXGIInfoQueue::AddMessage</a> to add a message. When you create an info queue filter, you can use these values to allow or deny any categories of messages to pass through the storage and retrieval filters.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_INFO_QUEUE_MESSAGE_CATEGORY extends Win32Enum {

    /**
     * Unknown category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Miscellaneous category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_MISCELLANEOUS
     * @type {Integer (Int32)}
     */
    static MISCELLANEOUS => 1

    /**
     * Initialization category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_INITIALIZATION
     * @type {Integer (Int32)}
     */
    static INITIALIZATION => 2

    /**
     * Cleanup category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_CLEANUP
     * @type {Integer (Int32)}
     */
    static CLEANUP => 3

    /**
     * Compilation category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_COMPILATION
     * @type {Integer (Int32)}
     */
    static COMPILATION => 4

    /**
     * State creation category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_CREATION
     * @type {Integer (Int32)}
     */
    static STATE_CREATION => 5

    /**
     * State setting category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_SETTING
     * @type {Integer (Int32)}
     */
    static STATE_SETTING => 6

    /**
     * State getting category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_GETTING
     * @type {Integer (Int32)}
     */
    static STATE_GETTING => 7

    /**
     * Resource manipulation category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_RESOURCE_MANIPULATION
     * @type {Integer (Int32)}
     */
    static RESOURCE_MANIPULATION => 8

    /**
     * Execution category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_EXECUTION
     * @type {Integer (Int32)}
     */
    static EXECUTION => 9

    /**
     * Shader category.
     * Native name: DXGI_INFO_QUEUE_MESSAGE_CATEGORY_SHADER
     * @type {Integer (Int32)}
     */
    static SHADER => 10
}
