#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags for the IMF2DBuffer2::Lock2DSize method.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf2dbuffer_lockflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF2DBuffer_LockFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
