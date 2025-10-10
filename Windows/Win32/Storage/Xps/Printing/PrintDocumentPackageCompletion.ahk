#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PrintDocumentPackageCompletion enumeration specifies the status of the print operation.
 * @see https://docs.microsoft.com/windows/win32/api//documenttarget/ne-documenttarget-printdocumentpackagecompletion
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class PrintDocumentPackageCompletion{

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
