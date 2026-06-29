#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the data type for a key/value pair.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_attribute_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_ATTRIBUTE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Unsigned 32-bit integer.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_UINT32 => 19

    /**
     * Unsigned 64-bit integer.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_UINT64 => 21

    /**
     * Floating-point number.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_DOUBLE => 5

    /**
     * <b>GUID</b> value.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_GUID => 72

    /**
     * NULL-terminated wide-character string.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_STRING => 31

    /**
     * Byte array.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_BLOB => 4113

    /**
     * <b>IUnknown</b> pointer.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_IUNKNOWN => 13
}
