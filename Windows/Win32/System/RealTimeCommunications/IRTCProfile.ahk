#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCProfile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCProfile
     * @type {Guid}
     */
    static IID => Guid("{d07eca9e-4062-4dd4-9e7d-722a49ba7303}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Key", "get_Name", "get_XML", "get_ProviderName", "get_ProviderURI", "get_ProviderData", "get_ClientName", "get_ClientBanner", "get_ClientMinVer", "get_ClientCurVer", "get_ClientUpdateURI", "get_ClientData", "get_UserURI", "get_UserName", "get_UserAccount", "SetCredentials", "get_SessionCapabilities", "get_State"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Key() {
        pbstrKey := BSTR()
        result := ComCall(3, this, "ptr", pbstrKey, "HRESULT")
        return pbstrKey
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(4, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_XML() {
        pbstrXML := BSTR()
        result := ComCall(5, this, "ptr", pbstrXML, "HRESULT")
        return pbstrXML
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProviderName() {
        pbstrName := BSTR()
        result := ComCall(6, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {Integer} enURI 
     * @returns {BSTR} 
     */
    get_ProviderURI(enURI) {
        pbstrURI := BSTR()
        result := ComCall(7, this, "int", enURI, "ptr", pbstrURI, "HRESULT")
        return pbstrURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProviderData() {
        pbstrData := BSTR()
        result := ComCall(8, this, "ptr", pbstrData, "HRESULT")
        return pbstrData
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientName() {
        pbstrName := BSTR()
        result := ComCall(9, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ClientBanner() {
        result := ComCall(10, this, "short*", &pfBanner := 0, "HRESULT")
        return pfBanner
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientMinVer() {
        pbstrMinVer := BSTR()
        result := ComCall(11, this, "ptr", pbstrMinVer, "HRESULT")
        return pbstrMinVer
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientCurVer() {
        pbstrCurVer := BSTR()
        result := ComCall(12, this, "ptr", pbstrCurVer, "HRESULT")
        return pbstrCurVer
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientUpdateURI() {
        pbstrUpdateURI := BSTR()
        result := ComCall(13, this, "ptr", pbstrUpdateURI, "HRESULT")
        return pbstrUpdateURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientData() {
        pbstrData := BSTR()
        result := ComCall(14, this, "ptr", pbstrData, "HRESULT")
        return pbstrData
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserURI() {
        pbstrUserURI := BSTR()
        result := ComCall(15, this, "ptr", pbstrUserURI, "HRESULT")
        return pbstrUserURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserName() {
        pbstrUserName := BSTR()
        result := ComCall(16, this, "ptr", pbstrUserName, "HRESULT")
        return pbstrUserName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserAccount() {
        pbstrUserAccount := BSTR()
        result := ComCall(17, this, "ptr", pbstrUserAccount, "HRESULT")
        return pbstrUserAccount
    }

    /**
     * 
     * @param {BSTR} bstrUserURI 
     * @param {BSTR} bstrUserAccount 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     */
    SetCredentials(bstrUserURI, bstrUserAccount, bstrPassword) {
        bstrUserURI := bstrUserURI is String ? BSTR.Alloc(bstrUserURI).Value : bstrUserURI
        bstrUserAccount := bstrUserAccount is String ? BSTR.Alloc(bstrUserAccount).Value : bstrUserAccount
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(18, this, "ptr", bstrUserURI, "ptr", bstrUserAccount, "ptr", bstrPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionCapabilities() {
        result := ComCall(19, this, "int*", &plSupportedSessions := 0, "HRESULT")
        return plSupportedSessions
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(20, this, "int*", &penState := 0, "HRESULT")
        return penState
    }
}
