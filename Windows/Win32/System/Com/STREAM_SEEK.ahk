#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The STREAM_SEEK enumeration values specify the origin from which to calculate the new seek-pointer location.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-stream_seek
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class STREAM_SEEK extends Win32Enum{

    /**
     * The new seek pointer is an offset relative to the beginning of the stream. In this case, the <i>dlibMove</i> parameter is the new seek position relative to the beginning of the stream.
     * @type {Integer (UInt32)}
     */
    static STREAM_SEEK_SET => 0

    /**
     * The new seek pointer is an offset relative to the current seek pointer location. In this case, the <i>dlibMove</i> parameter is the signed displacement from the current seek position.
     * @type {Integer (UInt32)}
     */
    static STREAM_SEEK_CUR => 1

    /**
     * The new seek pointer is an offset relative to the end of the stream. In this case, the <i>dlibMove</i> parameter is the new seek position relative to the end of the stream.
     * @type {Integer (UInt32)}
     */
    static STREAM_SEEK_END => 2
}
