#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the encoder discards partial groups of pictures (GOPs) at the end of the stream. This enumeration is used with the AVEncCommonStreamEndHandling codec property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavenccommonstreamendhandling
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncCommonStreamEndHandling extends Win32Enum {

    /**
     * If there is a partial GOP at the end of the stream, the encoder will discard it.
     * Native name: eAVEncCommonStreamEndHandling_DiscardPartial
     * @type {Integer (Int32)}
     */
    static DiscardPartial => 0

    /**
     * If there is a partial GOP at the end of the stream, the encoder will adjust the GOP and encode all of the stream data.
     * Native name: eAVEncCommonStreamEndHandling_EnsureComplete
     * @type {Integer (Int32)}
     */
    static EnsureComplete => 1
}
