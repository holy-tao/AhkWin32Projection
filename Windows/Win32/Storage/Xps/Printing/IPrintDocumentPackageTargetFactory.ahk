#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintDocumentPackageTarget.ahk" { IPrintDocumentPackageTarget }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used with IPrintDocumentPackageTarget for starting a print job.
 * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nn-documenttarget-iprintdocumentpackagetargetfactory
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
export default struct IPrintDocumentPackageTargetFactory extends IUnknown {
    /**
     * The interface identifier for IPrintDocumentPackageTargetFactory
     * @type {Guid}
     */
    static IID := Guid("{d2959bf7-b31b-4a3d-9600-712eb1335ba4}")

    /**
     * The class identifier for PrintDocumentPackageTargetFactory
     * @type {Guid}
     */
    static CLSID := Guid("{348ef17d-6c81-4982-92b4-ee188a43867a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintDocumentPackageTargetFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDocumentPackageTargetForPrintJob : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintDocumentPackageTargetFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Acts as the entry point for creating an IPrintDocumentPackageTarget object.
     * @param {PWSTR} printerName The name of the target printer.
     * @param {PWSTR} jobName The name to apply to the job.
     * 
     * <div class="alert"><b>Note</b>  Job name strings longer than 63 characters will be truncated to 63 characters and a terminating <b>NULL</b>.</div>
     * <div> </div>
     * @param {IStream} jobOutputStream The job content. The application must set the seek pointer to the beginning before specifying the job output stream.
     * @param {IStream} jobPrintTicketStream A pointer to the <b>IStream</b> interface that is used by the caller to write the job-level print ticket that will be associated with this job.
     * @returns {IPrintDocumentPackageTarget} The target output.
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagetargetfactory-createdocumentpackagetargetforprintjob
     */
    CreateDocumentPackageTargetForPrintJob(printerName, jobName, jobOutputStream, jobPrintTicketStream) {
        printerName := printerName is String ? StrPtr(printerName) : printerName
        jobName := jobName is String ? StrPtr(jobName) : jobName

        result := ComCall(3, this, "ptr", printerName, "ptr", jobName, "ptr", jobOutputStream, "ptr", jobPrintTicketStream, "ptr*", &docPackageTarget := 0, "HRESULT")
        return IPrintDocumentPackageTarget(docPackageTarget)
    }

    Query(iid) {
        if (IPrintDocumentPackageTargetFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDocumentPackageTargetForPrintJob := CallbackCreate(GetMethod(implObj, "CreateDocumentPackageTargetForPrintJob"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDocumentPackageTargetForPrintJob)
    }
}
