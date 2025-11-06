#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IObjectId.ahk
#Include .\IX509Attributes.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICryptAttribute interface represents a cryptographic attribute in a certificate request. A collection of these attributes is contained in the CertificateRequestInfo structure of a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icryptattribute
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICryptAttribute extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromObjectId", "InitializeFromValues", "get_ObjectId", "get_Values"]

    /**
     * 
     * @param {IObjectId} pObjectId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattribute-initializefromobjectid
     */
    InitializeFromObjectId(pObjectId) {
        result := ComCall(7, this, "ptr", pObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX509Attributes} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattribute-initializefromvalues
     */
    InitializeFromValues(pAttributes) {
        result := ComCall(8, this, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattribute-get_objectid
     */
    get_ObjectId() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @returns {IX509Attributes} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattribute-get_values
     */
    get_Values() {
        result := ComCall(10, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Attributes(ppValue)
    }
}
