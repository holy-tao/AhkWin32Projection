#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the encoder discards partial groups of pictures (GOPs) at the end of the stream. This enumeration is used with the AVEncCommonStreamEndHandling codec property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavenccommonstreamendhandling
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncCommonStreamEndHandling{

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
