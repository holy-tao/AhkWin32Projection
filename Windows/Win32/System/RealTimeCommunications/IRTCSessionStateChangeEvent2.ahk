#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RTC_SECURITY_LEVEL.ahk" { RTC_SECURITY_LEVEL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IRTCSessionStateChangeEvent.ahk" { IRTCSessionStateChangeEvent }
#Import ".\RTC_SECURITY_TYPE.ahk" { RTC_SECURITY_TYPE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSessionStateChangeEvent2 extends IRTCSessionStateChangeEvent {
    /**
     * The interface identifier for IRTCSessionStateChangeEvent2
     * @type {Guid}
     */
    static IID := Guid("{4f933171-6f95-4880-80d9-2ec8d495d261}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSessionStateChangeEvent2 interfaces
    */
    struct Vtbl extends IRTCSessionStateChangeEvent.Vtbl {
        get_MediaTypes                   : IntPtr
        get_RemotePreferredSecurityLevel : IntPtr
        get_IsForked                     : IntPtr
        GetRemoteSessionDescription      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSessionStateChangeEvent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MediaTypes {
        get => this.get_MediaTypes()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsForked {
        get => this.get_IsForked()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaTypes() {
        result := ComCall(11, this, "int*", &pMediaTypes := 0, "HRESULT")
        return pMediaTypes
    }

    /**
     * 
     * @param {RTC_SECURITY_TYPE} enSecurityType 
     * @returns {RTC_SECURITY_LEVEL} 
     */
    get_RemotePreferredSecurityLevel(enSecurityType) {
        result := ComCall(12, this, RTC_SECURITY_TYPE, enSecurityType, "int*", &penSecurityLevel := 0, "HRESULT")
        return penSecurityLevel
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsForked() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &pfIsForked := 0, "HRESULT")
        return pfIsForked
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContentType 
     * @param {Pointer<BSTR>} pbstrSessionDescription 
     * @returns {HRESULT} 
     */
    GetRemoteSessionDescription(pbstrContentType, pbstrSessionDescription) {
        result := ComCall(14, this, BSTR.Ptr, pbstrContentType, BSTR.Ptr, pbstrSessionDescription, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCSessionStateChangeEvent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MediaTypes := CallbackCreate(GetMethod(implObj, "get_MediaTypes"), flags, 2)
        this.vtbl.get_RemotePreferredSecurityLevel := CallbackCreate(GetMethod(implObj, "get_RemotePreferredSecurityLevel"), flags, 3)
        this.vtbl.get_IsForked := CallbackCreate(GetMethod(implObj, "get_IsForked"), flags, 2)
        this.vtbl.GetRemoteSessionDescription := CallbackCreate(GetMethod(implObj, "GetRemoteSessionDescription"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MediaTypes)
        CallbackFree(this.vtbl.get_RemotePreferredSecurityLevel)
        CallbackFree(this.vtbl.get_IsForked)
        CallbackFree(this.vtbl.GetRemoteSessionDescription)
    }
}
