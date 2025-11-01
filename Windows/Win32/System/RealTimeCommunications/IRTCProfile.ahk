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
     * @param {Pointer<BSTR>} pbstrKey 
     * @returns {HRESULT} 
     */
    get_Key(pbstrKey) {
        result := ComCall(3, this, "ptr", pbstrKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(4, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrXML 
     * @returns {HRESULT} 
     */
    get_XML(pbstrXML) {
        result := ComCall(5, this, "ptr", pbstrXML, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_ProviderName(pbstrName) {
        result := ComCall(6, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enURI 
     * @param {Pointer<BSTR>} pbstrURI 
     * @returns {HRESULT} 
     */
    get_ProviderURI(enURI, pbstrURI) {
        result := ComCall(7, this, "int", enURI, "ptr", pbstrURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    get_ProviderData(pbstrData) {
        result := ComCall(8, this, "ptr", pbstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_ClientName(pbstrName) {
        result := ComCall(9, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfBanner 
     * @returns {HRESULT} 
     */
    get_ClientBanner(pfBanner) {
        result := ComCall(10, this, "ptr", pfBanner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMinVer 
     * @returns {HRESULT} 
     */
    get_ClientMinVer(pbstrMinVer) {
        result := ComCall(11, this, "ptr", pbstrMinVer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCurVer 
     * @returns {HRESULT} 
     */
    get_ClientCurVer(pbstrCurVer) {
        result := ComCall(12, this, "ptr", pbstrCurVer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUpdateURI 
     * @returns {HRESULT} 
     */
    get_ClientUpdateURI(pbstrUpdateURI) {
        result := ComCall(13, this, "ptr", pbstrUpdateURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    get_ClientData(pbstrData) {
        result := ComCall(14, this, "ptr", pbstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserURI 
     * @returns {HRESULT} 
     */
    get_UserURI(pbstrUserURI) {
        result := ComCall(15, this, "ptr", pbstrUserURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserName 
     * @returns {HRESULT} 
     */
    get_UserName(pbstrUserName) {
        result := ComCall(16, this, "ptr", pbstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserAccount 
     * @returns {HRESULT} 
     */
    get_UserAccount(pbstrUserAccount) {
        result := ComCall(17, this, "ptr", pbstrUserAccount, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plSupportedSessions 
     * @returns {HRESULT} 
     */
    get_SessionCapabilities(plSupportedSessions) {
        plSupportedSessionsMarshal := plSupportedSessions is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, plSupportedSessionsMarshal, plSupportedSessions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penState 
     * @returns {HRESULT} 
     */
    get_State(penState) {
        penStateMarshal := penState is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, penStateMarshal, penState, "HRESULT")
        return result
    }
}
