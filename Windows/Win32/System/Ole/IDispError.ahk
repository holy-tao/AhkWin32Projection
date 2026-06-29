#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct IDispError extends IUnknown {
    /**
     * The interface identifier for IDispError
     * @type {Guid}
     */
    static IID := Guid("{a6ef9861-c720-11d0-9337-00a0c90dcaa9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDispError interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryErrorInfo : IntPtr
        GetNext        : IntPtr
        GetHresult     : IntPtr
        GetSource      : IntPtr
        GetHelpInfo    : IntPtr
        GetDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDispError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Guid} guidErrorType 
     * @returns {IDispError} 
     */
    QueryErrorInfo(guidErrorType) {
        result := ComCall(3, this, Guid, guidErrorType, "ptr*", &ppde := 0, "HRESULT")
        return IDispError(ppde)
    }

    /**
     * 
     * @returns {IDispError} 
     */
    GetNext() {
        result := ComCall(4, this, "ptr*", &ppde := 0, "HRESULT")
        return IDispError(ppde)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetHresult() {
        result := ComCall(5, this, "int*", &phr := 0, "HRESULT")
        return phr
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSource() {
        pbstrSource := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pbstrSource, "HRESULT")
        return pbstrSource
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFileName 
     * @param {Pointer<Integer>} pdwContext 
     * @returns {HRESULT} 
     */
    GetHelpInfo(pbstrFileName, pdwContext) {
        pdwContextMarshal := pdwContext is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, BSTR.Ptr, pbstrFileName, pdwContextMarshal, pdwContext, "HRESULT")
        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    Query(iid) {
        if (IDispError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryErrorInfo := CallbackCreate(GetMethod(implObj, "QueryErrorInfo"), flags, 3)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 2)
        this.vtbl.GetHresult := CallbackCreate(GetMethod(implObj, "GetHresult"), flags, 2)
        this.vtbl.GetSource := CallbackCreate(GetMethod(implObj, "GetSource"), flags, 2)
        this.vtbl.GetHelpInfo := CallbackCreate(GetMethod(implObj, "GetHelpInfo"), flags, 3)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryErrorInfo)
        CallbackFree(this.vtbl.GetNext)
        CallbackFree(this.vtbl.GetHresult)
        CallbackFree(this.vtbl.GetSource)
        CallbackFree(this.vtbl.GetHelpInfo)
        CallbackFree(this.vtbl.GetDescription)
    }
}
