#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines a payload to be used by the PackageStatusUpdated method. This structure is a generic version of XPS_JOB_STATUS.
 * @see https://learn.microsoft.com/windows/win32/api/documenttarget/ns-documenttarget-printdocumentpackagestatus
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class PrintDocumentPackageStatus extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The job ID.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The zero-based index of the most recently processed document.
     * @type {Integer}
     */
    CurrentDocument {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The zero-based index of the most recently processed page in the current document
     * @type {Integer}
     */
    CurrentPage {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A running total of the number of pages that have been processed by the print job.
     * @type {Integer}
     */
    CurrentPageTotal {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The completion status of the job.
     * @type {Integer}
     */
    Completion {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The error state of the job.
     * @type {HRESULT}
     */
    PackageStatus {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
