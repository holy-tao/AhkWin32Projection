#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PrintJobStatus.ahk" { PrintJobStatus }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintJob extends IUnknown {
    /**
     * The interface identifier for IPrintJob
     * @type {Guid}
     */
    static IID := Guid("{b771dab8-1282-41b7-858c-f206e4d20577}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintJob interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Name           : IntPtr
        get_Id             : IntPtr
        get_PrintedPages   : IntPtr
        get_TotalPages     : IntPtr
        get_Status         : IntPtr
        get_SubmissionTime : IntPtr
        RequestCancel      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintJob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    PrintedPages {
        get => this.get_PrintedPages()
    }

    /**
     * @type {Integer} 
     */
    TotalPages {
        get => this.get_TotalPages()
    }

    /**
     * @type {PrintJobStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Float} 
     */
    SubmissionTime {
        get => this.get_SubmissionTime()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(4, this, "uint*", &pulID := 0, "HRESULT")
        return pulID
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrintedPages() {
        result := ComCall(5, this, "uint*", &pulPages := 0, "HRESULT")
        return pulPages
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalPages() {
        result := ComCall(6, this, "uint*", &pulPages := 0, "HRESULT")
        return pulPages
    }

    /**
     * 
     * @returns {PrintJobStatus} 
     */
    get_Status() {
        result := ComCall(7, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SubmissionTime() {
        result := ComCall(8, this, "double*", &pSubmissionTime := 0, "HRESULT")
        return pSubmissionTime
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestCancel() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintJob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_PrintedPages := CallbackCreate(GetMethod(implObj, "get_PrintedPages"), flags, 2)
        this.vtbl.get_TotalPages := CallbackCreate(GetMethod(implObj, "get_TotalPages"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_SubmissionTime := CallbackCreate(GetMethod(implObj, "get_SubmissionTime"), flags, 2)
        this.vtbl.RequestCancel := CallbackCreate(GetMethod(implObj, "RequestCancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_PrintedPages)
        CallbackFree(this.vtbl.get_TotalPages)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_SubmissionTime)
        CallbackFree(this.vtbl.RequestCancel)
    }
}
