#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RTC_PRESENCE_PROPERTY.ahk" { RTC_PRESENCE_PROPERTY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_PRESENCE_STATUS.ahk" { RTC_PRESENCE_STATUS }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCPresenceDevice extends IUnknown {
    /**
     * The interface identifier for IRTCPresenceDevice
     * @type {Guid}
     */
    static IID := Guid("{bc6a90dd-ad9a-48da-9b0c-2515e38521ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCPresenceDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Status           : IntPtr
        get_Notes            : IntPtr
        get_PresenceProperty : IntPtr
        GetPresenceData      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCPresenceDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RTC_PRESENCE_STATUS} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {BSTR} 
     */
    Notes {
        get => this.get_Notes()
    }

    /**
     * 
     * @returns {RTC_PRESENCE_STATUS} 
     */
    get_Status() {
        result := ComCall(3, this, "int*", &penStatus := 0, "HRESULT")
        return penStatus
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Notes() {
        pbstrNotes := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrNotes, "HRESULT")
        return pbstrNotes
    }

    /**
     * 
     * @param {RTC_PRESENCE_PROPERTY} enProperty 
     * @returns {BSTR} 
     */
    get_PresenceProperty(enProperty) {
        pbstrProperty := BSTR.Owned()
        result := ComCall(5, this, RTC_PRESENCE_PROPERTY, enProperty, BSTR.Ptr, pbstrProperty, "HRESULT")
        return pbstrProperty
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNamespace 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetPresenceData(pbstrNamespace, pbstrData) {
        result := ComCall(6, this, BSTR.Ptr, pbstrNamespace, BSTR.Ptr, pbstrData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCPresenceDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_Notes := CallbackCreate(GetMethod(implObj, "get_Notes"), flags, 2)
        this.vtbl.get_PresenceProperty := CallbackCreate(GetMethod(implObj, "get_PresenceProperty"), flags, 3)
        this.vtbl.GetPresenceData := CallbackCreate(GetMethod(implObj, "GetPresenceData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_Notes)
        CallbackFree(this.vtbl.get_PresenceProperty)
        CallbackFree(this.vtbl.GetPresenceData)
    }
}
