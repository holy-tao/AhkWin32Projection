#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Can be used to define an extension for a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extension
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Extension extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509Extension
     * @type {Guid}
     */
    static IID => Guid("{728ab30d-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_ObjectId", "get_RawData", "get_Critical", "put_Critical"]

    /**
     * @type {IObjectId} 
     */
    ObjectId {
        get => this.get_ObjectId()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Critical {
        get => this.get_Critical()
        set => this.put_Critical(value)
    }

    /**
     * Initializes an IX509Extension object by using an object identifier (OID) and a byte array that contains the Distinguished Encoding Rules (DER) encoded extension.
     * @param {IObjectId} pObjectId Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that contains the extension OID.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded extension value.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CERTSRV_E_PROPERTY_EMPTY</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The OID could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509extension-initialize
     */
    Initialize(pObjectId, Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(7, this, "ptr", pObjectId, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves the object identifier (OID) for the extension.
     * @remarks
     * 
     * You can specify the OID when you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-initialize">Initialize</a> method to create an extension value.
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509extension-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves a byte array that contains the extension value.
     * @remarks
     * 
     * A certificate extension is defined by an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure, and the extension is encoded into a byte array by using DER. The byte array is returned in a string to simplify use in languages other than C++. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration to specify the type of Unicode encoding to apply to the string. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-initialize">Initialize</a> method to specify the extension.
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509extension-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR()
        result := ComCall(9, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that identifies whether the certificate extension is critical.
     * @remarks
     * 
     * A certificate extension consists of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID), a Boolean value that identifies whether the extension is critical, and a byte array that contains the extension value. The criticality indicates whether an application that uses a certificate can ignore the extension type and value. If an extension is identified as critical but the application does not recognize the extension type, the application should reject the certificate.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509extension-get_critical
     */
    get_Critical() {
        result := ComCall(10, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that identifies whether the certificate extension is critical.
     * @remarks
     * 
     * A certificate extension consists of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID), a Boolean value that identifies whether the extension is critical, and a byte array that contains the extension value. The criticality indicates whether an application that uses a certificate can ignore the extension type and value. If an extension is identified as critical but the application does not recognize the extension type, the application should reject the certificate.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509extension-put_critical
     */
    put_Critical(Value) {
        result := ComCall(11, this, "short", Value, "HRESULT")
        return result
    }
}
