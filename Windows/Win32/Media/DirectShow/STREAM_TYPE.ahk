#Requires AutoHotkey v2.0.0 64-bit

/**
 * Note  This API is deprecated. New applications should not use it. Defines the direction of data flow for the stream.
 * @remarks
 * 
  * Transform streams are read/write where the sample is updated in place.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmstream/ne-mmstream-stream_type
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class STREAM_TYPE{

    /**
     * Application can read the stream.
     * @type {Integer (Int32)}
     */
    static STREAMTYPE_READ => 0

    /**
     * Application can write to the stream.
     * @type {Integer (Int32)}
     */
    static STREAMTYPE_WRITE => 1

    /**
     * Application reads and writes to the stream.
     * @type {Integer (Int32)}
     */
    static STREAMTYPE_TRANSFORM => 2
}
