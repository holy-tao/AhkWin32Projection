#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The PrintDocumentPackageCompletion enumeration specifies the status of the print operation.
 * @see https://learn.microsoft.com/windows/win32/api/documenttarget/ne-documenttarget-printdocumentpackagecompletion
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
class PrintDocumentPackageCompletion extends Win32Enum {

    /**
     * The print job is running.
     * Native name: PrintDocumentPackageCompletion_InProgress
     * @type {Integer (Int32)}
     */
    static InProgress => 0

    /**
     * The print operation completed without error.
     * Native name: PrintDocumentPackageCompletion_Completed
     * @type {Integer (Int32)}
     */
    static Completed => 1

    /**
     * The print operation was canceled.
     * Native name: PrintDocumentPackageCompletion_Canceled
     * @type {Integer (Int32)}
     */
    static Canceled => 2

    /**
     * The print operation failed.
     * Native name: PrintDocumentPackageCompletion_Failed
     * @type {Integer (Int32)}
     */
    static Failed => 3
}
