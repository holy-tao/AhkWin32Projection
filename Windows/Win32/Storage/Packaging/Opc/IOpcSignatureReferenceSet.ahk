#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcSignatureReference.ahk
#Include .\IOpcSignatureReferenceEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An unordered set of IOpcSignatureReference interface pointers that represent references to XML elements to be signed.
 * @remarks
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceset-create">Create</a> method creates a reference to an application-specific <b>Object</b> element or a child of an application-specific <b>Object</b> that is signed when the signature is generated. <b>Create</b> does not create the reference to the package-specific <b>Object</b> element to be signed; that reference is created automatically when the signature is generated.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
 * 
 * To access an <b>IOpcSignatureReferenceSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcustomreferenceset">IOpcSigningOptions::GetCustomReferenceSet</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/msopc/nn-msopc-iopcsignaturereferenceset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureReferenceSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignatureReferenceSet
     * @type {Guid}
     */
    static IID => Guid("{f3b02d31-ab12-42dd-9e2f-2b16761c3c1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "Delete", "GetEnumerator"]

    /**
     * Creates an IOpcSignatureReference interface pointer that represents a reference to an XML element to be signed.
     * @remarks
     * This method creates a reference to an XML element that is signed when the signature is generated. The referenced element can be either an application-specific <b>Object</b> element or a child of an application-specific <b>Object</b>.
     * 
     * To reference an XML element for signing, set the <i>referenceUri</i> parameter value to a URI that represents "#" followed by  the <b>Id</b> attribute value of the referenced element, as shown in the following table.<table>
     * <tr>
     * <th><i>referenceUri</i> Value as String</th>
     * <th>Referenced Element</th>
     * <th>Element Description</th>
     * </tr>
     * <tr>
     * <td>"#<i>idMyCustomObject</i>"</td>
     * <td>"&lt;Object Id="<i>idMyCustomObject</i>"&gt;<i>...</i>&lt;/Object&gt;"</td>
     * <td>
     * An application-specific <b>Object</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>"#<i>idMyElement</i>"</td>
     * <td>"&lt;Object&gt;&lt;<i>MyElement</i> Id="<i>idMyElement</i>"&gt;<i>...</i>&lt;/<i>MyElement</i>&gt;...&lt;/Object&gt;"</td>
     * <td>
     * A child element of an application-specific <b>Object</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * This method does not create the reference to the package-specific <b>Object</b> element to be signed; that reference is created automatically when the signature is generated.
     * 
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
     * @param {IUri} referenceUri The URI of  the referenced XML element.
     * 
     * Set the value of this parameter to a URI that represents "#" followed by  the <b>Id</b> attribute value of the referenced element: "#<i>&lt;elementIdValue&gt;</i>".
     * 
     * For examples, see the Remarks section.
     * @param {PWSTR} referenceId The <b>Id</b> attribute of the <b>Reference</b> element that represents the reference in signature  markup. To omit the  <b>Id</b> attribute, set this parameter value to  <b>NULL</b>.
     * @param {PWSTR} type The <b>Type</b> attribute of the <b>Reference</b> element that represents the reference in signature markup. To omit the <b>Type</b> attribute, set this parameter value to  <b>NULL</b>.
     * @param {PWSTR} digestMethod The digest method to be used for the XML markup to be referenced. To use the default digest method,  set this parameter value to  <b>NULL</b>.
     * 
     * <div class="alert"><b>Important</b>  The default digest method must be set by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">IOpcSigningOptions::SetDefaultDigestMethod</a> method before <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> is called.</div>
     * <div> </div>
     * @param {Integer} transformMethod The canonicalization method to be used for the XML markup to be referenced.
     * @returns {IOpcSignatureReference} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msopc/nf-msopc-iopcsignaturereferenceset-create
     */
    Create(referenceUri, referenceId, type, digestMethod, transformMethod) {
        referenceId := referenceId is String ? StrPtr(referenceId) : referenceId
        type := type is String ? StrPtr(type) : type
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(3, this, "ptr", referenceUri, "ptr", referenceId, "ptr", type, "ptr", digestMethod, "int", transformMethod, "ptr*", &reference_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOpcSignatureReference(reference_)
    }

    /**
     * Deletes a specified IOpcSignatureReference interface pointer from the set.
     * @remarks
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
     * @param {IOpcSignatureReference} reference_ An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer to be deleted.
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
     * The <i>reference</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/msopc/nf-msopc-iopcsignaturereferenceset-delete
     */
    Delete(reference_) {
        result := ComCall(4, this, "ptr", reference_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets an enumerator of IOpcSignatureReference interface pointers in the set.
     * @returns {IOpcSignatureReferenceEnumerator} A pointer to an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointers in the set.
     * @see https://learn.microsoft.com/windows/win32/api//content/msopc/nf-msopc-iopcsignaturereferenceset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(5, this, "ptr*", &referenceEnumerator := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOpcSignatureReferenceEnumerator(referenceEnumerator)
    }
}
