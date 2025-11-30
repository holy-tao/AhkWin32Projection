#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Debug message severity levels for an information queue.
 * @remarks
 * 
 * Use these values to allow or deny message categories to pass through the storage and retrieval filters for an information queue (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter">D3D12_INFO_QUEUE_FILTER</a>). This API is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-addapplicationmessage">AddApplicationMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-addmessage">AddMessage</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MESSAGE_SEVERITY extends Win32Enum{

    /**
     * Indicates a corruption error.
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_SEVERITY_CORRUPTION => 0

    /**
     * Indicates an error.
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_SEVERITY_ERROR => 1

    /**
     * Indicates a warning.
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_SEVERITY_WARNING => 2

    /**
     * Indicates an information message.
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_SEVERITY_INFO => 3

    /**
     * Indicates a message other than corruption, error, warning or information.
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_SEVERITY_MESSAGE => 4
}
