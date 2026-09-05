#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Debug message severity levels for an information queue. (D3D11_MESSAGE_SEVERITY)
 * @remarks
 * Use these values to allow or deny message categories to pass through the storage and retrieval filters for an information queue (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>). This API is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addapplicationmessage">ID3D11InfoQueue::AddApplicationMessage</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_MESSAGE_SEVERITY extends Win32Enum {

    /**
     * Defines some type of corruption which has occurred.
     * Native name: D3D11_MESSAGE_SEVERITY_CORRUPTION
     * @type {Integer (Int32)}
     */
    static CORRUPTION => 0

    /**
     * Defines an error message.
     * Native name: D3D11_MESSAGE_SEVERITY_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 1

    /**
     * Defines a warning message.
     * Native name: D3D11_MESSAGE_SEVERITY_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 2

    /**
     * Defines an information message.
     * Native name: D3D11_MESSAGE_SEVERITY_INFO
     * @type {Integer (Int32)}
     */
    static INFO => 3

    /**
     * Defines a message other than corruption, error, warning, or information.
     * 
     * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * Native name: D3D11_MESSAGE_SEVERITY_MESSAGE
     * @type {Integer (Int32)}
     */
    static MESSAGE => 4
}
