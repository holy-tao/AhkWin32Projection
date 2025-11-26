#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcUri.ahk
#Include .\IOpcRelationshipSelectorEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a reference to a Relationships part that contains relationships that have been or will be signed.
 * @remarks
 * 
 *  To create an  <b>IOpcSignatureRelationshipReference</b> interface pointer that represents a reference to a Relationships part, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">Create</a> method. This reference will indicate whether  all or a subset of the  relationships in the Relationships part will be signed when the signature is generated.
 * 
 * To access an <b>IOpcSignatureRelationshipReference</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceenumerator-getcurrent">IOpcSignatureRelationshipReferenceEnumerator::GetCurrent</a> method.
 * 
 *  Relationships that are not selected for signing can be removed, modified or added to  the package without invalidating the signature. If a subset of relationships has been selected for signing and the subset is altered, the signature will be invalidated.<div class="alert"><b>Important</b>  A selected subset could be altered if the relationship type of a relationship that is added to or modified in a referenced Relationships part matches a relationship type that was used to select one or more relationships in the subset.</div>
 * <div> </div>
 * 
 * 
 * The interface provides methods to access information about the referenced Relationships part, the selected relationships that have been or will be signed,  and the reference itself. When a signature is generated, this reference information is serialized in the XML markup of the signature (signature markup).  In signature markup, the information is represented by a  <b>Reference</b> element that has a <b>URI</b> attribute value that identifies a Relationships part.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturerelationshipreference
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureRelationshipReference extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignatureRelationshipReference
     * @type {Guid}
     */
    static IID => Guid("{57babac6-9d4a-4e50-8b86-e5d4051eae7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSourceUri", "GetDigestMethod", "GetDigestValue", "GetTransformMethod", "GetRelationshipSigningOption", "GetRelationshipSelectorEnumerator"]

    /**
     * Gets the source URI of the relationships that are stored in the referenced�Relationships part.
     * @returns {IOpcUri} A pointer to the source URI of the relationships that are stored in the referenced Relationships part.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturerelationshipreference-getsourceuri
     */
    GetSourceUri() {
        result := ComCall(3, this, "ptr*", &sourceUri := 0, "HRESULT")
        return IOpcUri(sourceUri)
    }

    /**
     * Gets the digest method to use on relationship markup of the selected relationships.
     * @returns {PWSTR} The digest method to use on relationship markup of the selected relationships when they  are signed.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturerelationshipreference-getdigestmethod
     */
    GetDigestMethod() {
        result := ComCall(4, this, "ptr*", &digestMethod := 0, "HRESULT")
        return digestMethod
    }

    /**
     * Gets the digest value calculated for the selected relationships when they are signed.
     * @param {Pointer<Pointer<Integer>>} digestValue A pointer to a buffer that contains the digest value calculated using the specified digest method; the method is applied to the relationship markup of the selected relationships when they are signed.
     * @param {Pointer<Integer>} count The size of the <i>digestValue</i> buffer.
     * 
     * If the selected relationships have not been signed yet, <i>count</i> is 0.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     *  At least one of the <i>digestValue</i>, and <i>count</i> parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturerelationshipreference-getdigestvalue
     */
    GetDigestValue(digestValue, count) {
        digestValueMarshal := digestValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, digestValueMarshal, digestValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Gets the canonicalization method to use on the relationship markup of the selected relationships when they are signed.
     * @returns {Integer} The canonicalization method to use on the relationship markup of the selected  relationships when they  are signed.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturerelationshipreference-gettransformmethod
     */
    GetTransformMethod() {
        result := ComCall(6, this, "int*", &transformMethod := 0, "HRESULT")
        return transformMethod
    }

    /**
     * Gets a value that describes whether all or a subset of relationships that are stored in the referenced�Relationships part are selected.
     * @returns {Integer} A value that describes whether all or a subset of relationships are selected.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturerelationshipreference-getrelationshipsigningoption
     */
    GetRelationshipSigningOption() {
        result := ComCall(7, this, "int*", &relationshipSigningOption := 0, "HRESULT")
        return relationshipSigningOption
    }

    /**
     * Gets an enumerator of IOpcRelationshipSelector interface pointers that represent the techniques used to select the subset of relationships in the referenced�Relationships part.
     * @returns {IOpcRelationshipSelectorEnumerator} A pointer to an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturerelationshipreference-getrelationshipselectorenumerator
     */
    GetRelationshipSelectorEnumerator() {
        result := ComCall(8, this, "ptr*", &selectorEnumerator := 0, "HRESULT")
        return IOpcRelationshipSelectorEnumerator(selectorEnumerator)
    }
}
