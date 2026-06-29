#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\RTC_PRESENCE_PROPERTY.ahk" { RTC_PRESENCE_PROPERTY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCPresencePropertyEvent extends IDispatch {
    /**
     * The interface identifier for IRTCPresencePropertyEvent
     * @type {Guid}
     */
    static IID := Guid("{f777f570-a820-49d5-86bd-e099493f1518}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCPresencePropertyEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StatusCode       : IntPtr
        get_StatusText       : IntPtr
        get_PresenceProperty : IntPtr
        get_Value            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCPresencePropertyEvent.Vtbl()
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
     * @type {RTC_PRESENCE_PROPERTY} 
     */
    PresenceProperty {
        get => this.get_PresenceProperty()
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
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
     * @returns {RTC_PRESENCE_PROPERTY} 
     */
    get_PresenceProperty() {
        result := ComCall(9, this, "int*", &penPresProp := 0, "HRESULT")
        return penPresProp
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Value() {
        pbstrValue := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrValue, "HRESULT")
        return pbstrValue
    }

    Query(iid) {
        if (IRTCPresencePropertyEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
        this.vtbl.get_StatusText := CallbackCreate(GetMethod(implObj, "get_StatusText"), flags, 2)
        this.vtbl.get_PresenceProperty := CallbackCreate(GetMethod(implObj, "get_PresenceProperty"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StatusCode)
        CallbackFree(this.vtbl.get_StatusText)
        CallbackFree(this.vtbl.get_PresenceProperty)
        CallbackFree(this.vtbl.get_Value)
    }
}
