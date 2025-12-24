#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsSignature.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Accesses the components of a signature request.
 * @remarks
 * 
 * The <b>IXpsSignatureRequest</b> interface corresponds to a single <b>SignatureDefinition</b> element in the markup of the SignatureDefinitons part.
 * 
 * This <b>SignatureDefinition</b> element markup is described in section 10.2.2 of the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>. 
 * 
 * All signature requests are 
 * stored in a request collection of a signature block. They cannot exist independently from the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> interface from which they were instantiated.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturerequest
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignatureRequest extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSignatureRequest
     * @type {Guid}
     */
    static IID => Guid("{ac58950b-7208-4b2d-b2c4-951083d3b8eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIntent", "SetIntent", "GetRequestedSigner", "SetRequestedSigner", "GetRequestSignByDate", "SetRequestSignByDate", "GetSigningLocale", "SetSigningLocale", "GetSpotLocation", "SetSpotLocation", "GetRequestId", "GetSignature"]

    /**
     * Sets the string that describes the intent or meaning of the signature.
     * @returns {PWSTR} The signature intention agreement against which the signer is signing.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getintent
     */
    GetIntent() {
        result := ComCall(3, this, "ptr*", &intent := 0, "HRESULT")
        return intent
    }

    /**
     * Sets the string that describes the intent or meaning of the signature.
     * @param {PWSTR} intent The string that describes the intent or meaning of the signature.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>intent</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setintent
     */
    SetIntent(intent) {
        intent := intent is String ? StrPtr(intent) : intent

        result := ComCall(4, this, "ptr", intent, "HRESULT")
        return result
    }

    /**
     * Gets the identity of the person who has signed or is requesting to sign the package.
     * @returns {PWSTR} The identity of the person who has signed or is requesting to sign the package.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getrequestedsigner
     */
    GetRequestedSigner() {
        result := ComCall(5, this, "ptr*", &signerName := 0, "HRESULT")
        return signerName
    }

    /**
     * Sets the identity of the person who signed or is requested to sign the package.
     * @param {PWSTR} signerName The identity of the person who signed or is requesting to sign the package.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>signerName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setrequestedsigner
     */
    SetRequestedSigner(signerName) {
        signerName := signerName is String ? StrPtr(signerName) : signerName

        result := ComCall(6, this, "ptr", signerName, "HRESULT")
        return result
    }

    /**
     * Gets the date and time before which the requested signer must sign the specified parts of the document.
     * @returns {PWSTR} A string that contains the date and time before which the requested signer must sign the specified parts of the document.
     * 
     * The string is formatted as either <c>YYYY-MM-DDThh:mmZ</code>,  which includes the UTC time zone offset, or <code>YYYY-MM-DDThh:mm</code>, which does not include the UTC time zone offset. For example, without the time zone offset, 7:30:29 P.M. on July 4, 2008 would be represented  as <code>2008-07-04T19:30:29</c>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getrequestsignbydate
     */
    GetRequestSignByDate() {
        result := ComCall(7, this, "ptr*", &dateString := 0, "HRESULT")
        return dateString
    }

    /**
     * Sets the date and time before which the requested signer must sign the specified parts of the document.
     * @param {PWSTR} dateString A string that contains the date and time before which the requested signer must sign the specified parts of the document.
     * 
     * The string must be formatted as <c>YYYY-MM-DDThh:mmZ</code> with the UTC time zone offset. For example, 7:30:29 A.M. Pacific Standard Time on July 4, 2008 would be represented as the UTC time of <code>2008-07-04T15:30:29Z</c>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dateString</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setrequestsignbydate
     */
    SetRequestSignByDate(dateString) {
        dateString := dateString is String ? StrPtr(dateString) : dateString

        result := ComCall(8, this, "ptr", dateString, "HRESULT")
        return result
    }

    /**
     * Gets the legal jurisdiction of the package signing location.
     * @returns {PWSTR} The legal jurisdiction of the package signing location
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getsigninglocale
     */
    GetSigningLocale() {
        result := ComCall(9, this, "ptr*", &place := 0, "HRESULT")
        return place
    }

    /**
     * Sets the legal jurisdiction of the package signing location.
     * @param {PWSTR} place The legal jurisdiction of the package signing location.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>place</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setsigninglocale
     */
    SetSigningLocale(place) {
        place := place is String ? StrPtr(place) : place

        result := ComCall(10, this, "ptr", place, "HRESULT")
        return result
    }

    /**
     * Gets the page and the location on the page where the visible digital signature or the digital signature request will be displayed.
     * @param {Pointer<Integer>} pageIndex The index value of the FixedPage part that contains the signature or the digital signature request. If a spot location is not specified for the signature request, –1 is returned.
     * @param {Pointer<IOpcPartUri>} pagePartName A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part that contains the FixedPage on which the digital signature is to be displayed.
     * @param {Pointer<Float>} x The x-coordinate value of the signing spot on the page.
     * @param {Pointer<Float>} y The y-coordinate value of the signing spot on the page.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pageIndex</i>, <i>pagePartName</i>, <i>x</i>, or <i>y</i>  is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getspotlocation
     */
    GetSpotLocation(pageIndex, pagePartName, x, y) {
        pageIndexMarshal := pageIndex is VarRef ? "int*" : "ptr"
        xMarshal := x is VarRef ? "float*" : "ptr"
        yMarshal := y is VarRef ? "float*" : "ptr"

        result := ComCall(11, this, pageIndexMarshal, pageIndex, "ptr*", pagePartName, xMarshal, x, yMarshal, y, "HRESULT")
        return result
    }

    /**
     * Specifies the page and the location on the page where the visible digital signature or the digital signature request will be displayed.
     * @param {Integer} pageIndex The index value of the FixedPage part in the XPS document  that contains the visible digital signature or the digital signature request.
     * 
     * If the value of this parameter is –1, a <b>SpotLocation</b> element will not be written to the SignatureDefinitions markup.
     * 
     * If the value of this parameter is not –1, it must be a page number that exists in the FixedDocument part to which the signature block that contains this request is attached.
     * @param {Float} x The x-coordinate value of the signing spot on the page.
     * @param {Float} y The y-coordinate value of the signing spot on the page.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setspotlocation
     */
    SetSpotLocation(pageIndex, x, y) {
        result := ComCall(12, this, "int", pageIndex, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * Gets the unique identifier of the signature request.
     * @returns {PWSTR} The unique identifier of  the signature request.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getrequestid
     */
    GetRequestId() {
        result := ComCall(13, this, "ptr*", &requestId := 0, "HRESULT")
        return requestId
    }

    /**
     * Gets a pointer to an IXpsSignature interface that contains the XPS digital signature with the same unique identifier as the signature request.
     * @returns {IXpsSignature} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignature">IXpsSignature</a> interface that contains the XPS digital signature with the same unique identifier as the signature request. If no matching signature is found, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getsignature
     */
    GetSignature() {
        result := ComCall(14, this, "ptr*", &signature := 0, "HRESULT")
        return IXpsSignature(signature)
    }
}
