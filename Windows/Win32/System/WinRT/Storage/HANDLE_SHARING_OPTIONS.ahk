#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the requested sharing mode of the file handle.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/ne-windowsstoragecom-handle_sharing_options
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct HANDLE_SHARING_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Prevents other processes from opening a file if they request delete, read, or write access.
     * @type {Integer (Int32)}
     */
    static HSO_SHARE_NONE => 0

    /**
     * Enables subsequent open operations on a file to request read access.
     * Otherwise, other processes cannot open the file if they request read access.
     * @type {Integer (Int32)}
     */
    static HSO_SHARE_READ => 1

    /**
     * Enables subsequent open operations on a file to request write access.
     * Otherwise, other processes cannot open the file if they request write access.
     * @type {Integer (Int32)}
     */
    static HSO_SHARE_WRITE => 2

    /**
     * Enables subsequent open operations on a file to request delete access.
     * Otherwise, other processes cannot open the file if they request delete access.
     * @type {Integer (Int32)}
     */
    static HSO_SHARE_DELETE => 4
}
