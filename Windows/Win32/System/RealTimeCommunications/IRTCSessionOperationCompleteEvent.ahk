#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCSession.ahk" { IRTCSession }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSessionOperationCompleteEvent extends IDispatch {
    /**
     * The interface identifier for IRTCSessionOperationCompleteEvent
     * @type {Guid}
     */
    static IID := Guid("{a6bff4c0-f7c8-4d3c-9a41-3550f78a95b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSessionOperationCompleteEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Session    : IntPtr
        get_Cookie     : IntPtr
        get_StatusCode : IntPtr
        get_StatusText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSessionOperationCompleteEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {Pointer} 
     */
    Cookie {
        get => this.get_Cookie()
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
     * @returns {IRTCSession} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession(ppSession)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Cookie() {
        result := ComCall(8, this, "ptr*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(9, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        pbstrStatusText := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    Query(iid) {
        if (IRTCSessionOperationCompleteEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Session := CallbackCreate(GetMethod(implObj, "get_Session"), flags, 2)
        this.vtbl.get_Cookie := CallbackCreate(GetMethod(implObj, "get_Cookie"), flags, 2)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
        this.vtbl.get_StatusText := CallbackCreate(GetMethod(implObj, "get_StatusText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Session)
        CallbackFree(this.vtbl.get_Cookie)
        CallbackFree(this.vtbl.get_StatusCode)
        CallbackFree(this.vtbl.get_StatusText)
    }
}
