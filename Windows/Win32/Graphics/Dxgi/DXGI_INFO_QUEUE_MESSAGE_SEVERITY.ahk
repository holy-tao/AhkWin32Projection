#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that specify debug message severity levels for an information queue.
 * @remarks
 * 
  * Use this enumeration when you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessage">IDXGIInfoQueue::GetMessage</a> to retrieve a message and when you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addmessage">IDXGIInfoQueue::AddMessage</a> to add a message. Also, use this enumeration with <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addapplicationmessage">IDXGIInfoQueue::AddApplicationMessage</a>.
  * 
  * 
  * 
  * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_INFO_QUEUE_MESSAGE_SEVERITY{

    /**
     * Defines some type of corruption that has occurred.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_SEVERITY_CORRUPTION => 0

    /**
     * Defines an error message.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_SEVERITY_ERROR => 1

    /**
     * Defines a warning message.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_SEVERITY_WARNING => 2

    /**
     * Defines an information message.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_SEVERITY_INFO => 3

    /**
     * Defines a message other than corruption, error, warning, or information.
     * @type {Integer (Int32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_SEVERITY_MESSAGE => 4
}
