#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCProfile.ahk
#Include .\IRTCEnumProfiles.ahk
#Include .\IRTCCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClientProvisioning extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCClientProvisioning
     * @type {Guid}
     */
    static IID => Guid("{b9f5cf06-65b9-4a80-a0e6-73cae3ef3822}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateProfile", "EnableProfile", "DisableProfile", "EnumerateProfiles", "get_Profiles", "GetProfile", "get_SessionCapabilities"]

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
     * @param {BSTR} bstrProfileXML 
     * @returns {IRTCProfile} 
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-createprofile
     */
    CreateProfile(bstrProfileXML) {
        bstrProfileXML := bstrProfileXML is String ? BSTR.Alloc(bstrProfileXML).Value : bstrProfileXML

        result := ComCall(3, this, "ptr", bstrProfileXML, "ptr*", &ppProfile := 0, "HRESULT")
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

        result := ComCall(8, this, "ptr", bstrUserAccount, "ptr", bstrUserPassword, "ptr", bstrUserURI, "ptr", bstrServer, "int", lTransport, "ptr", lCookie, "HRESULT")
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
}
