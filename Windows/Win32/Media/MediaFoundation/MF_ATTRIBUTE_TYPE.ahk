#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the data type for a key/value pair.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_attribute_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_ATTRIBUTE_TYPE extends Win32Enum {

    /**
     * Unsigned 32-bit integer.
     * Native name: MF_ATTRIBUTE_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 19

    /**
     * Unsigned 64-bit integer.
     * Native name: MF_ATTRIBUTE_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 21

    /**
     * Floating-point number.
     * Native name: MF_ATTRIBUTE_DOUBLE
     * @type {Integer (Int32)}
     */
    static DOUBLE => 5

    /**
     * <b>GUID</b> value.
     * Native name: MF_ATTRIBUTE_GUID
     * @type {Integer (Int32)}
     */
    static GUID => 72

    /**
     * NULL-terminated wide-character string.
     * Native name: MF_ATTRIBUTE_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 31

    /**
     * Byte array.
     * Native name: MF_ATTRIBUTE_BLOB
     * @type {Integer (Int32)}
     */
    static BLOB => 4113

    /**
     * <b>IUnknown</b> pointer.
     * Native name: MF_ATTRIBUTE_IUNKNOWN
     * @type {Integer (Int32)}
     */
    static IUNKNOWN => 13
}
