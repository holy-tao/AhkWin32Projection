#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the data type for a key/value pair.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mf_attribute_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_ATTRIBUTE_TYPE extends Win32Enum{

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
