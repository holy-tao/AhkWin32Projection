#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags for the IMF2DBuffer2::Lock2DSize method.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf2dbuffer_lockflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF2DBuffer_LockFlags extends Win32Enum {

    /**
     * Reserved.
     * Native name: MF2DBuffer_LockFlags_LockTypeMask
     * @type {Integer (Int32)}
     */
    static LockTypeMask => 3

    /**
     * Lock the buffer for reading.
     * Native name: MF2DBuffer_LockFlags_Read
     * @type {Integer (Int32)}
     */
    static Read => 1

    /**
     * Lock the buffer for writing.
     * Native name: MF2DBuffer_LockFlags_Write
     * @type {Integer (Int32)}
     */
    static Write => 2

    /**
     * Lock the buffer for both reading and writing.
     * Native name: MF2DBuffer_LockFlags_ReadWrite
     * @type {Integer (Int32)}
     */
    static ReadWrite => 3

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * Native name: MF2DBuffer_LockFlags_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
