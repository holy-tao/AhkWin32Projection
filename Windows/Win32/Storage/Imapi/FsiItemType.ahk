#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the file system item that was found using the IFileSystemImage::Exists method.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/ne-imapi2fs-fsiitemtype
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class FsiItemType extends Win32Enum{

    /**
     * The specified item was not found.
     * @type {Integer (Int32)}
     */
    static FsiItemNotFound => 0

    /**
     * The specified item is a directory.
     * @type {Integer (Int32)}
     */
    static FsiItemDirectory => 1

    /**
     * The specified item is a file.
     * @type {Integer (Int32)}
     */
    static FsiItemFile => 2
}
