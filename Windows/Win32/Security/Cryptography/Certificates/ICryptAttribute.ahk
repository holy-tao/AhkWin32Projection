#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICryptAttribute interface represents a cryptographic attribute in a certificate request. A collection of these attributes is contained in the CertificateRequestInfo structure of a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icryptattribute
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICryptAttribute extends IDispatch{
    /**
     * The interface identifier for ICryptAttribute
     * @type {Guid}
     */
    static IID => Guid("{728ab32c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IObjectId>} pObjectId 
     * @returns {HRESULT} 
     */
    InitializeFromObjectId(pObjectId) {
        result := ComCall(7, this, "ptr", pObjectId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509Attributes>} pAttributes 
     * @returns {HRESULT} 
     */
    InitializeFromValues(pAttributes) {
        result := ComCall(8, this, "ptr", pAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    get_ObjectId(ppValue) {
        result := ComCall(9, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509Attributes>} ppValue 
     * @returns {HRESULT} 
     */
    get_Values(ppValue) {
        result := ComCall(10, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
