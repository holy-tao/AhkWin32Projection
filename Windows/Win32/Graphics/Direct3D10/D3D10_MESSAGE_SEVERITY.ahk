#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Debug message severity levels for an information queue. (D3D10_MESSAGE_SEVERITY)
 * @remarks
 * Use these values to allow or deny message categories to pass through the storage and retrieval filters for an information queue (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>). This API is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addapplicationmessage">ID3D10InfoQueue::AddApplicationMessage</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_MESSAGE_SEVERITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Defines some type of corruption which has occurred.
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_SEVERITY_CORRUPTION => 0

    /**
     * Defines an error message.
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_SEVERITY_ERROR => 1

    /**
     * Defines a warning message.
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_SEVERITY_WARNING => 2

    /**
     * Defines an information message.
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_SEVERITY_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_SEVERITY_MESSAGE => 4
}
