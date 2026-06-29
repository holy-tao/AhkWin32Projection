#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PrintDocumentPackageCompletion.ahk" { PrintDocumentPackageCompletion }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Defines a payload to be used by the PackageStatusUpdated method. This structure is a generic version of XPS_JOB_STATUS.
 * @see https://learn.microsoft.com/windows/win32/api/documenttarget/ns-documenttarget-printdocumentpackagestatus
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
export default struct PrintDocumentPackageStatus {
    #StructPack 4

    /**
     * The job ID.
     */
    JobId : UInt32

    /**
     * The zero-based index of the most recently processed document.
     */
    CurrentDocument : Int32

    /**
     * The zero-based index of the most recently processed page in the current document
     */
    CurrentPage : Int32

    /**
     * A running total of the number of pages that have been processed by the print job.
     */
    CurrentPageTotal : Int32

    /**
     * The completion status of the job.
     */
    Completion : PrintDocumentPackageCompletion

    /**
     * The error state of the job.
     */
    PackageStatus : HRESULT

}
