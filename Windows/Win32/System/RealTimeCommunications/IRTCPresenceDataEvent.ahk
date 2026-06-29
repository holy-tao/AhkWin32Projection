#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCPresenceDataEvent extends IDispatch {
    /**
     * The interface identifier for IRTCPresenceDataEvent
     * @type {Guid}
     */
    static IID := Guid("{38f0e78c-8b87-4c04-a82d-aedd83c909bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCPresenceDataEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StatusCode  : IntPtr
        get_StatusText  : IntPtr
        GetPresenceData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCPresenceDataEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * @type {BSTR} 
     */
    StatusText {
        get => this.get_StatusText()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(7, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        pbstrStatusText := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNamespace 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetPresenceData(pbstrNamespace, pbstrData) {
        result := ComCall(9, this, BSTR.Ptr, pbstrNamespace, BSTR.Ptr, pbstrData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCPresenceDataEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
        this.vtbl.get_StatusText := CallbackCreate(GetMethod(implObj, "get_StatusText"), flags, 2)
        this.vtbl.GetPresenceData := CallbackCreate(GetMethod(implObj, "GetPresenceData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StatusCode)
        CallbackFree(this.vtbl.get_StatusText)
        CallbackFree(this.vtbl.GetPresenceData)
    }
}
