#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IRTCEnumProfiles.ahk" { IRTCEnumProfiles }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCCollection.ahk" { IRTCCollection }
#Import ".\IRTCProfile.ahk" { IRTCProfile }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCClientProvisioning extends IUnknown {
    /**
     * The interface identifier for IRTCClientProvisioning
     * @type {Guid}
     */
    static IID := Guid("{b9f5cf06-65b9-4a80-a0e6-73cae3ef3822}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCClientProvisioning interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateProfile           : IntPtr
        EnableProfile           : IntPtr
        DisableProfile          : IntPtr
        EnumerateProfiles       : IntPtr
        get_Profiles            : IntPtr
        GetProfile              : IntPtr
        get_SessionCapabilities : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCClientProvisioning.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCCollection} 
     */
    Profiles {
        get => this.get_Profiles()
    }

    /**
     * @type {Integer} 
     */
    SessionCapabilities {
        get => this.get_SessionCapabilities()
    }

    /**
     * Creates a new user profile.
     * @remarks
     * The caller must have administrator privileges to call this function.
     * @param {BSTR} bstrProfileXML 
     * @returns {IRTCProfile} 
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-createprofile
     */
    CreateProfile(bstrProfileXML) {
        bstrProfileXML := bstrProfileXML is String ? BSTR.Alloc(bstrProfileXML).Value : bstrProfileXML

        result := ComCall(3, this, BSTR, bstrProfileXML, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile(ppProfile)
    }

    /**
     * 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lRegisterFlags 
     * @returns {HRESULT} 
     */
    EnableProfile(pProfile, lRegisterFlags) {
        result := ComCall(4, this, "ptr", pProfile, "int", lRegisterFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRTCProfile} pProfile 
     * @returns {HRESULT} 
     */
    DisableProfile(pProfile) {
        result := ComCall(5, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCEnumProfiles} 
     */
    EnumerateProfiles() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumProfiles(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Profiles() {
        result := ComCall(7, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @param {BSTR} bstrUserAccount 
     * @param {BSTR} bstrUserPassword 
     * @param {BSTR} bstrUserURI 
     * @param {BSTR} bstrServer 
     * @param {Integer} lTransport 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    GetProfile(bstrUserAccount, bstrUserPassword, bstrUserURI, bstrServer, lTransport, lCookie) {
        bstrUserAccount := bstrUserAccount is String ? BSTR.Alloc(bstrUserAccount).Value : bstrUserAccount
        bstrUserPassword := bstrUserPassword is String ? BSTR.Alloc(bstrUserPassword).Value : bstrUserPassword
        bstrUserURI := bstrUserURI is String ? BSTR.Alloc(bstrUserURI).Value : bstrUserURI
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer

        result := ComCall(8, this, BSTR, bstrUserAccount, BSTR, bstrUserPassword, BSTR, bstrUserURI, BSTR, bstrServer, "int", lTransport, "ptr", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionCapabilities() {
        result := ComCall(9, this, "int*", &plSupportedSessions := 0, "HRESULT")
        return plSupportedSessions
    }

    Query(iid) {
        if (IRTCClientProvisioning.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateProfile := CallbackCreate(GetMethod(implObj, "CreateProfile"), flags, 3)
        this.vtbl.EnableProfile := CallbackCreate(GetMethod(implObj, "EnableProfile"), flags, 3)
        this.vtbl.DisableProfile := CallbackCreate(GetMethod(implObj, "DisableProfile"), flags, 2)
        this.vtbl.EnumerateProfiles := CallbackCreate(GetMethod(implObj, "EnumerateProfiles"), flags, 2)
        this.vtbl.get_Profiles := CallbackCreate(GetMethod(implObj, "get_Profiles"), flags, 2)
        this.vtbl.GetProfile := CallbackCreate(GetMethod(implObj, "GetProfile"), flags, 7)
        this.vtbl.get_SessionCapabilities := CallbackCreate(GetMethod(implObj, "get_SessionCapabilities"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateProfile)
        CallbackFree(this.vtbl.EnableProfile)
        CallbackFree(this.vtbl.DisableProfile)
        CallbackFree(this.vtbl.EnumerateProfiles)
        CallbackFree(this.vtbl.get_Profiles)
        CallbackFree(this.vtbl.GetProfile)
        CallbackFree(this.vtbl.get_SessionCapabilities)
    }
}
