#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a set of certificates for which an Online Certificate Status Protocol (OCSP) service has been configured to provide certificate status responses.
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-iocspcaconfigurationcollection
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IOCSPCAConfigurationCollection extends IDispatch{
    /**
     * The interface identifier for IOCSPCAConfigurationCollection
     * @type {Guid}
     */
    static IID => Guid("{2bebea0b-5ece-4f28-a91c-86b4bb20f0d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_Item(Index, pVal) {
        result := ComCall(8, this, "int", Index, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(9, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrIdentifier 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_ItemByName(bstrIdentifier, pVal) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(10, this, "ptr", bstrIdentifier, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrIdentifier 
     * @param {VARIANT} varCACert 
     * @param {Pointer<IOCSPCAConfiguration>} ppVal 
     * @returns {HRESULT} 
     */
    CreateCAConfiguration(bstrIdentifier, varCACert, ppVal) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(11, this, "ptr", bstrIdentifier, "ptr", varCACert, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrIdentifier 
     * @returns {HRESULT} 
     */
    DeleteCAConfiguration(bstrIdentifier) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(12, this, "ptr", bstrIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
