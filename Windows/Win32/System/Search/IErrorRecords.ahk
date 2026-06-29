#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IErrorInfo.ahk" { IErrorInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ERRORINFO.ahk" { ERRORINFO }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\DISPPARAMS.ahk" { DISPPARAMS }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IErrorRecords extends IUnknown {
    /**
     * The interface identifier for IErrorRecords
     * @type {Guid}
     */
    static IID := Guid("{0c733a67-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IErrorRecords interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddErrorRecord       : IntPtr
        GetBasicErrorInfo    : IntPtr
        GetCustomErrorObject : IntPtr
        GetErrorInfo         : IntPtr
        GetErrorParameters   : IntPtr
        GetRecordCount       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IErrorRecords.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<ERRORINFO>} pErrorInfo 
     * @param {Integer} dwLookupID 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @param {IUnknown} punkCustomError 
     * @param {Integer} dwDynamicErrorID 
     * @returns {HRESULT} 
     */
    AddErrorRecord(pErrorInfo, dwLookupID, pdispparams, punkCustomError, dwDynamicErrorID) {
        result := ComCall(3, this, ERRORINFO.Ptr, pErrorInfo, "uint", dwLookupID, DISPPARAMS.Ptr, pdispparams, "ptr", punkCustomError, "uint", dwDynamicErrorID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @returns {ERRORINFO} 
     */
    GetBasicErrorInfo(ulRecordNum) {
        pErrorInfo := ERRORINFO()
        result := ComCall(4, this, "uint", ulRecordNum, ERRORINFO.Ptr, pErrorInfo, "HRESULT")
        return pErrorInfo
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetCustomErrorObject(ulRecordNum, riid) {
        result := ComCall(5, this, "uint", ulRecordNum, Guid.Ptr, riid, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @remarks
     * This function returns a pointer to the most recently set <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a> pointer in the current logical thread. It transfers ownership of the error object to the caller, and clears the error state for the thread.
     * 
     * Making a COM call that goes through a proxy-stub will clear any existing error object for the calling thread. A called object should not make any such calls after calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a> and before returning. The caller should not make any such calls after the call returns and before calling <b>GetErrorInfo</b>. As a rule of thumb, an interface method should return as soon as possible after calling <b>SetErrorInfo</b>, and the caller should call <b>GetErrorInfo</b> as soon as possible after the call returns.
     * @param {Integer} ulRecordNum 
     * @param {Integer} lcid 
     * @returns {IErrorInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo(ulRecordNum, lcid) {
        result := ComCall(6, this, "uint", ulRecordNum, "uint", lcid, "ptr*", &ppErrorInfo := 0, "HRESULT")
        return IErrorInfo(ppErrorInfo)
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @returns {DISPPARAMS} 
     */
    GetErrorParameters(ulRecordNum) {
        pdispparams := DISPPARAMS()
        result := ComCall(7, this, "uint", ulRecordNum, DISPPARAMS.Ptr, pdispparams, "HRESULT")
        return pdispparams
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRecordCount() {
        result := ComCall(8, this, "uint*", &pcRecords := 0, "HRESULT")
        return pcRecords
    }

    Query(iid) {
        if (IErrorRecords.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddErrorRecord := CallbackCreate(GetMethod(implObj, "AddErrorRecord"), flags, 6)
        this.vtbl.GetBasicErrorInfo := CallbackCreate(GetMethod(implObj, "GetBasicErrorInfo"), flags, 3)
        this.vtbl.GetCustomErrorObject := CallbackCreate(GetMethod(implObj, "GetCustomErrorObject"), flags, 4)
        this.vtbl.GetErrorInfo := CallbackCreate(GetMethod(implObj, "GetErrorInfo"), flags, 4)
        this.vtbl.GetErrorParameters := CallbackCreate(GetMethod(implObj, "GetErrorParameters"), flags, 3)
        this.vtbl.GetRecordCount := CallbackCreate(GetMethod(implObj, "GetRecordCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddErrorRecord)
        CallbackFree(this.vtbl.GetBasicErrorInfo)
        CallbackFree(this.vtbl.GetCustomErrorObject)
        CallbackFree(this.vtbl.GetErrorInfo)
        CallbackFree(this.vtbl.GetErrorParameters)
        CallbackFree(this.vtbl.GetRecordCount)
    }
}
