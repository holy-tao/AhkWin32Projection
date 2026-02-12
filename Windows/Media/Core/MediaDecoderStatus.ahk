#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a media decoder when decoding a media item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediadecoderstatus
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaDecoderStatus extends Win32Enum{

    /**
     * The encoding of the media item is fully supported by the decoder.
     * @type {Integer (Int32)}
     */
    static FullySupported => 0

    /**
     * The encoding subtype of the media item is not supported by the decoder.
     * @type {Integer (Int32)}
     */
    static UnsupportedSubtype => 1

    /**
     * The media item uses encoding properties that are not supported by the decoder.
     * @type {Integer (Int32)}
     */
    static UnsupportedEncoderProperties => 2

    /**
     * The media item can be decoded by the decoder, but with a degradation from the encoding.
     * @type {Integer (Int32)}
     */
    static Degraded => 3
}
