#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMTrustee interface contains methods to retrieve information about a given trustee when using the Group Policy Management Console (GPMC).
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmtrustee
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMTrustee extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMTrustee
     * @type {Guid}
     */
    static IID => Guid("{3b466da8-c1a4-4b2a-999a-befcdd56cefb}")

    /**
     * The class identifier for GPMTrustee
     * @type {Guid}
     */
    static CLSID => Guid("{c54a700d-19b6-4211-bcb0-e8e2475e471e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TrusteeSid", "get_TrusteeName", "get_TrusteeDomain", "get_TrusteeDSPath", "get_TrusteeType"]

    /**
     * 
     * @param {Pointer<BSTR>} bstrVal 
     * @returns {HRESULT} 
     */
    get_TrusteeSid(bstrVal) {
        result := ComCall(7, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrVal 
     * @returns {HRESULT} 
     */
    get_TrusteeName(bstrVal) {
        result := ComCall(8, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrVal 
     * @returns {HRESULT} 
     */
    get_TrusteeDomain(bstrVal) {
        result := ComCall(9, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TrusteeDSPath(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lVal 
     * @returns {HRESULT} 
     */
    get_TrusteeType(lVal) {
        lValMarshal := lVal is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, lValMarshal, lVal, "HRESULT")
        return result
    }
}
