#Requires AutoHotkey v2.0.0 64-bit

/**
 * The STGTY enumeration values are used in the type member of the STATSTG structure to indicate the type of the storage element. A storage element is a storage object, a stream object, or a byte-array object (LOCKBYTES).
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-stgty
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class STGTY{

    /**
     * Indicates that the storage element is a storage object.
     * @type {Integer (Int32)}
     */
    static STGTY_STORAGE => 1

    /**
     * Indicates that the storage element is a stream object.
     * @type {Integer (Int32)}
     */
    static STGTY_STREAM => 2

    /**
     * Indicates that the storage element is a byte-array object.
     * @type {Integer (Int32)}
     */
    static STGTY_LOCKBYTES => 3

    /**
     * Indicates that the storage element is a property storage object.
     * @type {Integer (Int32)}
     */
    static STGTY_PROPERTY => 4
}
