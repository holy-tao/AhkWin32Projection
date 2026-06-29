#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the file system item that was found using the IFileSystemImage::Exists method.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/ne-imapi2fs-fsiitemtype
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct FsiItemType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
