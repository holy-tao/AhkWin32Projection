#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the file system item that was found using the IFileSystemImage::Exists method.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/ne-imapi2fs-fsiitemtype
 * @namespace Windows.Win32.Storage.Imapi
 */
class FsiItemType extends Win32Enum {

    /**
     * The specified item was not found.
     * Native name: FsiItemNotFound
     * @type {Integer (Int32)}
     */
    static NotFound => 0

    /**
     * The specified item is a directory.
     * Native name: FsiItemDirectory
     * @type {Integer (Int32)}
     */
    static Directory => 1

    /**
     * The specified item is a file.
     * Native name: FsiItemFile
     * @type {Integer (Int32)}
     */
    static File => 2
}
