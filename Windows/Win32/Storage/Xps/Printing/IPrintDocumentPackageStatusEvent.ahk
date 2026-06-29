#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\PrintDocumentPackageStatus.ahk" { PrintDocumentPackageStatus }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents the progress of the print job.
 * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nn-documenttarget-iprintdocumentpackagestatusevent
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
export default struct IPrintDocumentPackageStatusEvent extends IDispatch {
    /**
     * The interface identifier for IPrintDocumentPackageStatusEvent
     * @type {Guid}
     */
    static IID := Guid("{ed90c8ad-5c34-4d05-a1ec-0e8a9b3ad7af}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintDocumentPackageStatusEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        PackageStatusUpdated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintDocumentPackageStatusEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Updates the status of the package when the print job in progress raises an event, or the job completes.
     * @param {Pointer<PrintDocumentPackageStatus>} packageStatus The status update.
     * @returns {HRESULT} If the <b>PackageStatusUpdated</b> method completes successfully, it returns an S_OK. Otherwise it returns an appropriate HRESULT  error code.
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagestatusevent-packagestatusupdated
     */
    PackageStatusUpdated(packageStatus) {
        result := ComCall(7, this, PrintDocumentPackageStatus.Ptr, packageStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintDocumentPackageStatusEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PackageStatusUpdated := CallbackCreate(GetMethod(implObj, "PackageStatusUpdated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PackageStatusUpdated)
    }
}
