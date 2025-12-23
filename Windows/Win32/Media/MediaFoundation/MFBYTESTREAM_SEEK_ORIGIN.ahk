#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the origin for a seek request.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfbytestream_seek_origin
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFBYTESTREAM_SEEK_ORIGIN extends Win32Enum{

    /**
     * The seek position is specified relative to the start of the stream.
     * @type {Integer (Int32)}
     */
    static msoBegin => 0

    /**
     * The seek position is specified relative to the current read/write position in the stream.
     * @type {Integer (Int32)}
     */
    static msoCurrent => 1
}
