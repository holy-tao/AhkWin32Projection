#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the encoder discards partial groups of pictures (GOPs) at the end of the stream. This enumeration is used with the AVEncCommonStreamEndHandling codec property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavenccommonstreamendhandling
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncCommonStreamEndHandling {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * If there is a partial GOP at the end of the stream, the encoder will discard it.
     * @type {Integer (Int32)}
     */
    static eAVEncCommonStreamEndHandling_DiscardPartial => 0

    /**
     * If there is a partial GOP at the end of the stream, the encoder will adjust the GOP and encode all of the stream data.
     * @type {Integer (Int32)}
     */
    static eAVEncCommonStreamEndHandling_EnsureComplete => 1
}
