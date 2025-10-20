#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods for getting product information for an individual provider to interact with Windows Security Center.
 * @see https://docs.microsoft.com/windows/win32/api//iwscapi/nn-iwscapi-iwscproduct
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class IWscProduct extends IDispatch{
    /**
     * The interface identifier for IWscProduct
     * @type {Guid}
     */
    static IID => Guid("{8c38232e-3a45-4a27-92b0-1a16a975f669}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ProductName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ProductState(pVal) {
        result := ComCall(8, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_SignatureStatus(pVal) {
        result := ComCall(9, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_RemediationPath(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ProductStateTimestamp(pVal) {
        result := ComCall(11, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ProductGuid(pVal) {
        result := ComCall(12, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_ProductIsDefault(pVal) {
        result := ComCall(13, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
