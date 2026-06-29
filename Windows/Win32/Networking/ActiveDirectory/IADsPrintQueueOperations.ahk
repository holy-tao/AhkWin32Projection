#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADsCollection.ahk" { IADsCollection }
#Import ".\IADs.ahk" { IADs }

/**
 * Used to control a printer from across a network.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsprintqueueoperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPrintQueueOperations extends IADs {
    /**
     * The interface identifier for IADsPrintQueueOperations
     * @type {Guid}
     */
    static IID := Guid("{124be5c0-156e-11cf-a986-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPrintQueueOperations interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_Status : IntPtr
        PrintJobs  : IntPtr
        Pause      : IntPtr
        Resume     : IntPtr
        Purge      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPrintQueueOperations.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(20, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * The IADsPrintQueueOperations::PrintJobs method gets an IADsCollection interface pointer on the collection of the print jobs processed in this print queue.
     * @returns {IADsCollection} Pointer to a pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscollection">IADsCollection</a> interface on the collection of objects added to this print queue. Objects in the collection implement the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsprintjob">IADsPrintJob</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintqueueoperations-printjobs
     */
    PrintJobs() {
        result := ComCall(21, this, "ptr*", &pObject := 0, "HRESULT")
        return IADsCollection(pObject)
    }

    /**
     * The IADsPrintQueueOperations::Pause method suspends the processing of print jobs within a print queue service.
     * @returns {HRESULT} This method supports the standard return values. For more information about other return values, see the  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintqueueoperations-pause
     */
    Pause() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The IADsPrintQueueOperations::Resume method resumes processing of suspended print jobs in the print queue.
     * @returns {HRESULT} This method supports the standard return values. For more information about other return values, see the  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintqueueoperations-resume
     */
    Resume() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * The IADsPrintQueueOperations::Purge method clears the print queue of all print jobs without processing them.
     * @returns {HRESULT} This method supports the standard return values. For more information about other return values, see the  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintqueueoperations-purge
     */
    Purge() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsPrintQueueOperations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.PrintJobs := CallbackCreate(GetMethod(implObj, "PrintJobs"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.Purge := CallbackCreate(GetMethod(implObj, "Purge"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.PrintJobs)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.Purge)
    }
}
