#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Used with IPrintDocumentPackageTarget for starting a print job.
 * @see https://docs.microsoft.com/windows/win32/api//documenttarget/nn-documenttarget-iprintdocumentpackagetargetfactory
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class IPrintDocumentPackageTargetFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintDocumentPackageTargetFactory
     * @type {Guid}
     */
    static IID => Guid("{d2959bf7-b31b-4a3d-9600-712eb1335ba4}")

    /**
     * The class identifier for PrintDocumentPackageTargetFactory
     * @type {Guid}
     */
    static CLSID => Guid("{348ef17d-6c81-4982-92b4-ee188a43867a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDocumentPackageTargetForPrintJob"]

    /**
     * 
     * @param {PWSTR} printerName 
     * @param {PWSTR} jobName 
     * @param {IStream} jobOutputStream 
     * @param {IStream} jobPrintTicketStream 
     * @param {Pointer<IPrintDocumentPackageTarget>} docPackageTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagetargetfactory-createdocumentpackagetargetforprintjob
     */
    CreateDocumentPackageTargetForPrintJob(printerName, jobName, jobOutputStream, jobPrintTicketStream, docPackageTarget) {
        printerName := printerName is String ? StrPtr(printerName) : printerName
        jobName := jobName is String ? StrPtr(jobName) : jobName

        result := ComCall(3, this, "ptr", printerName, "ptr", jobName, "ptr", jobOutputStream, "ptr", jobPrintTicketStream, "ptr*", docPackageTarget, "HRESULT")
        return result
    }
}
