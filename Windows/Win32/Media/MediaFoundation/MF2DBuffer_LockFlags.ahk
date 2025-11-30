#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags for the IMF2DBuffer2::Lock2DSize method.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mf2dbuffer_lockflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF2DBuffer_LockFlags extends Win32Enum{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MF2DBuffer_LockFlags_LockTypeMask => 3

    /**
     * Lock the buffer for reading.
     * @type {Integer (Int32)}
     */
    static MF2DBuffer_LockFlags_Read => 1

    /**
     * Lock the buffer for writing.
     * @type {Integer (Int32)}
     */
    static MF2DBuffer_LockFlags_Write => 2

    /**
     * Lock the buffer for both reading and writing.
     * @type {Integer (Int32)}
     */
    static MF2DBuffer_LockFlags_ReadWrite => 3

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static MF2DBuffer_LockFlags_ForceDWORD => 2147483647
}
