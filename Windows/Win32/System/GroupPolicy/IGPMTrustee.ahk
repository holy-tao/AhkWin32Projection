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
     * 
     * @param {Pointer<BSTR>} bstrVal 
     * @returns {HRESULT} 
     */
    get_TrusteeSid(bstrVal) {
        result := ComCall(7, this, "ptr", bstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrVal 
     * @returns {HRESULT} 
     */
    get_TrusteeName(bstrVal) {
        result := ComCall(8, this, "ptr", bstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrVal 
     * @returns {HRESULT} 
     */
    get_TrusteeDomain(bstrVal) {
        result := ComCall(9, this, "ptr", bstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TrusteeDSPath(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lVal 
     * @returns {HRESULT} 
     */
    get_TrusteeType(lVal) {
        result := ComCall(11, this, "int*", lVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
