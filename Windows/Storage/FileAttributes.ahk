#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes the attributes of a file or folder.
 * @remarks
 * The FileAttributes enumeration is used with the [StorageFile.Attributes](storagefile_attributes.md) and [StorageFolder.Attributes](storagefolder_attributes.md) properties.
 * 
 * 
 * 
 * 
 * 
 * The enumeration values match the Win32 file type attributes. Therefore the enumeration values correspond to the Win32 values, which are flags in base 2.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileattributes
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class FileAttributes extends Win32BitflagEnum{

    /**
     * The item is normal. That is, the item doesn't have any of the other values in the enumeration.
     * @type {Integer (UInt32)}
     */
    static Normal => 0

    /**
     * The item is read-only.
     * @type {Integer (UInt32)}
     */
    static ReadOnly => 1

    /**
     * The item is a directory.
     * @type {Integer (UInt32)}
     */
    static Directory => 16

    /**
     * The item is archived.
     * @type {Integer (UInt32)}
     */
    static Archive => 32

    /**
     * The item is a temporary file.
     * @type {Integer (UInt32)}
     */
    static Temporary => 256

    /**
     * The item is locally incomplete. Windows only.
     * @type {Integer (UInt32)}
     */
    static LocallyIncomplete => 512
}
