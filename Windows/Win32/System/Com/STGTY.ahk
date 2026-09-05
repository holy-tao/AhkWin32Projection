#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The STGTY enumeration values are used in the type member of the STATSTG structure to indicate the type of the storage element. A storage element is a storage object, a stream object, or a byte-array object (LOCKBYTES).
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-stgty
 * @namespace Windows.Win32.System.Com
 */
class STGTY extends Win32Enum {

    /**
     * Indicates that the storage element is a storage object.
     * Native name: STGTY_STORAGE
     * @type {Integer (Int32)}
     */
    static STORAGE => 1

    /**
     * Indicates that the storage element is a stream object.
     * Native name: STGTY_STREAM
     * @type {Integer (Int32)}
     */
    static STREAM => 2

    /**
     * Indicates that the storage element is a byte-array object.
     * Native name: STGTY_LOCKBYTES
     * @type {Integer (Int32)}
     */
    static LOCKBYTES => 3

    /**
     * Indicates that the storage element is a property storage object.
     * Native name: STGTY_PROPERTY
     * @type {Integer (Int32)}
     */
    static PROPERTY => 4
}
