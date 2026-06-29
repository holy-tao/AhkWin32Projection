#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMStatusMsgCollection.ahk" { IGPMStatusMsgCollection }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMResult interface contains methods to retrieve status message information while performing various types of GPO processing operations such as restore, import, copy and backup.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmresult
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMResult extends IDispatch {
    /**
     * The interface identifier for IGPMResult
     * @type {Guid}
     */
    static IID := Guid("{86dff7e9-f76f-42ab-9570-cebc6be8a52d}")

    /**
     * The class identifier for GPMResult
     * @type {Guid}
     */
    static CLSID := Guid("{92101ac0-9287-4206-a3b2-4bdb73d225f6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMResult interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Status    : IntPtr
        get_Result    : IntPtr
        OverallStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IGPMStatusMsgCollection} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {VARIANT} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * 
     * @returns {IGPMStatusMsgCollection} 
     */
    get_Status() {
        result := ComCall(7, this, "ptr*", &ppIGPMStatusMsgCollection := 0, "HRESULT")
        return IGPMStatusMsgCollection(ppIGPMStatusMsgCollection)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Result() {
        pvarResult := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, pvarResult, "HRESULT")
        return pvarResult
    }

    /**
     * Returns the overall status of a GPMC operation, such as a copy, restore, backup, or import. If no error occurred during the operation, the method returns a success code; otherwise the method returns a failure code.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmresult-overallstatus
     */
    OverallStatus() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_Result := CallbackCreate(GetMethod(implObj, "get_Result"), flags, 2)
        this.vtbl.OverallStatus := CallbackCreate(GetMethod(implObj, "OverallStatus"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_Result)
        CallbackFree(this.vtbl.OverallStatus)
    }
}
