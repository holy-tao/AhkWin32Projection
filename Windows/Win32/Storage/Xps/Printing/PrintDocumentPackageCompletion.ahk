#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PrintDocumentPackageCompletion enumeration specifies the status of the print operation.
 * @see https://learn.microsoft.com/windows/win32/api/documenttarget/ne-documenttarget-printdocumentpackagecompletion
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
export default struct PrintDocumentPackageCompletion {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The print job is running.
     * @type {Integer (Int32)}
     */
    static PrintDocumentPackageCompletion_InProgress => 0

    /**
     * The print operation completed without error.
     * @type {Integer (Int32)}
     */
    static PrintDocumentPackageCompletion_Completed => 1

    /**
     * The print operation was canceled.
     * @type {Integer (Int32)}
     */
    static PrintDocumentPackageCompletion_Canceled => 2

    /**
     * The print operation failed.
     * @type {Integer (Int32)}
     */
    static PrintDocumentPackageCompletion_Failed => 3
}
