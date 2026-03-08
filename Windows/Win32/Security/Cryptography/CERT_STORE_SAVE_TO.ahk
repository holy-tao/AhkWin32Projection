#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The function saves the certificate store to a file. The <i>pvSaveToPara</i> parameter contains a handle to a file previously obtained by using the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function. The file must be opened with write permission. After a successful save operation, the file pointer is positioned after the last write operation.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nf-wincrypt-certsavestore
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_STORE_SAVE_TO extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME_A => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME_W => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_MEMORY => 2
}
