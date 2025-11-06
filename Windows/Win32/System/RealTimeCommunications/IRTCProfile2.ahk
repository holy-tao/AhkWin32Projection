#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCProfile.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCProfile2 extends IRTCProfile{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCProfile2
     * @type {Guid}
     */
    static IID => Guid("{4b81f84e-bdc7-4184-9154-3cb2dd7917fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Realm", "put_Realm", "get_AllowedAuth", "put_AllowedAuth"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Realm() {
        pbstrRealm := BSTR()
        result := ComCall(21, this, "ptr", pbstrRealm, "HRESULT")
        return pbstrRealm
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @returns {HRESULT} 
     */
    put_Realm(bstrRealm) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm

        result := ComCall(22, this, "ptr", bstrRealm, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedAuth() {
        result := ComCall(23, this, "int*", &plAllowedAuth := 0, "HRESULT")
        return plAllowedAuth
    }

    /**
     * 
     * @param {Integer} lAllowedAuth 
     * @returns {HRESULT} 
     */
    put_AllowedAuth(lAllowedAuth) {
        result := ComCall(24, this, "int", lAllowedAuth, "HRESULT")
        return result
    }
}
