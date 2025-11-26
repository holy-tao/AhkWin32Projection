#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUri.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a reference to XML markup that has been or will be signed.
 * @remarks
 * 
 * To create 
 * 				an <b>IOpcSignatureReference</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceset-create">IOpcSignatureReferenceSet::Create</a> method. <b>IOpcSignatureReferenceSet::Create</b> does not create the reference to the package-specific <b>Object</b> element; that reference is created automatically when the signature is generated.
 * 
 * To access an <b>IOpcSignatureReference</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-getcurrent">IOpcSignatureReferenceEnumerator::GetCurrent</a> method. <b>IOpcSignatureReferenceEnumerator::GetCurrent</b> does not access the reference to the package-specific <b>Object</b> element; call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getpackageobjectreference">IOpcDigitalSignature::GetPackageObjectReference</a> method to access that  reference.
 * 
 * The interface provides methods to access information about the reference itself, and referenced XML element. The referenced element can be the package-specific <b>Object</b> element, an application-specific  <b>Object</b> element, or a child element of an application-specific  <b>Object</b>. 
 * 
 *  When a signature is generated, this reference information is serialized in the XML markup of the signature (signature markup).  In signature markup, the information is represented by a  <b>Reference</b> element that has its <b>URI</b> attribute value set to "#" followed by the <b>Id</b> attribute value  of the referenced element. For example, if the <b>Id</b> attribute of the referenced element is "Application" the <b>URI</b> attribute of the <b>Reference</b> element is set to "#Application" as shown in the following markup.
 * 
 * The following signature markup shows a serialized reference to a signed, application-specific <b>Object</b> element.
 * 
 * 
 * ```xml
 * <Signature Id="SignatureId" xmlns="http://www.w3.org/2000/09/xmldsig#">
 *     <SignedInfo>
 *         [...]
 *         <Reference URI="#idPackageObject" ...>
 *             [...]
 *         </Reference>
 *         <!-- This reference indicates that the application-specific
 *         Object element was signed when the signature was generated.-->
 *         <Reference URI="#Application" ...>
 *             [...]
 *         </Reference>
 *     </SignedInfo>
 *     [...]
 *     <Object Id="idPackageObject" ...>
 *         [...]
 *     </Object>
 *     <!-- This application-specific <Object> element was signed when the
 *     signature was generated. -->
 *     <Object Id="Application">
 *         [...]
 *     </Object>
 * </Signature>
 * ```
 * 
 * 
 * The following signature markup shows a serialized reference to a signed, child element of an application-specific <b>Object</b> element.<div class="alert"><b>Note</b>  More than one child element of an application-specific <b>Object</b> can be referenced for signing.</div>
 * <div> </div>
 * 
 * 
 * 
 * ```xml
 * <Signature Id="SignatureId" xmlns="http://www.w3.org/2000/09/xmldsig#">
 *     <SignedInfo>
 *         [...]
 *         <Reference URI="#idPackageObject" ...>
 *             [...]
 *         </Reference>
 *         <!-- This reference indicates that MyElement in the application
 *         -specific Object element was signed when the signature was
 *         generated. -->
 *         <Reference URI="#MyElementId" ...>
 *             [...]
 *         </Reference>
 *     </SignedInfo>
 *     [...]
 *     <Object Id="idPackageObject" ...>
 *         [...]
 *     </Object>
 *     <Object Id="Application">
 *         [...]
 *             <!-- This element is signed. -->
 *             <MyElement Id="MyElementId">
 *                 [...]
 *             </MyElement>
 *         [...]
 *     </Object>
 * </Signature>
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturereference
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureReference extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignatureReference
     * @type {Guid}
     */
    static IID => Guid("{1b47005e-3011-4edc-be6f-0f65e5ab0342}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetUri", "GetType", "GetTransformMethod", "GetDigestMethod", "GetDigestValue"]

    /**
     * Gets the identifier for the reference.
     * @returns {PWSTR} An identifier for the reference.
     * 
     * If the identifier is not set, <i>referenceId</i> will be the empty string, "".
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturereference-getid
     */
    GetId() {
        result := ComCall(3, this, "ptr*", &referenceId := 0, "HRESULT")
        return referenceId
    }

    /**
     * Gets the URI of the referenced XML element.
     * @returns {IUri} A pointer to the  URI of the referenced element.
     * 
     * This URI represented by a string is  "#" followed by  the <b>Id</b> attribute value of the referenced element: "#<i>&lt;elementIdValue&gt;</i>".
     * 
     * For examples, see the Remarks section.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturereference-geturi
     */
    GetUri() {
        result := ComCall(4, this, "ptr*", &referenceUri := 0, "HRESULT")
        return IUri(referenceUri)
    }

    /**
     * Gets a string that indicates the type of the referenced XML element.
     * @returns {PWSTR} A string that indicates the type of the referenced XML  element.
     * 
     * If the type  is not set, the <i>type</i> parameter will be the empty string "".
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturereference-gettype
     */
    GetType() {
        result := ComCall(5, this, "ptr*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Gets the canonicalization method to use on the referenced XML element, when the element is signed.
     * @returns {Integer} The canonicalization method to use on the referenced XML element, when the element is signed.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturereference-gettransformmethod
     */
    GetTransformMethod() {
        result := ComCall(6, this, "int*", &transformMethod := 0, "HRESULT")
        return transformMethod
    }

    /**
     * Gets the digest method to use on the referenced XML element, when the element is signed.
     * @returns {PWSTR} The digest method to use on the referenced XML element.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturereference-getdigestmethod
     */
    GetDigestMethod() {
        result := ComCall(7, this, "ptr*", &digestMethod := 0, "HRESULT")
        return digestMethod
    }

    /**
     * Gets the digest value that is calculated for the referenced XML element when the element is signed.
     * @param {Pointer<Pointer<Integer>>} digestValue A pointer to a buffer that contains the digest value calculated using the specified digest method when the referenced XML element is signed.
     * @param {Pointer<Integer>} count The size of the <i>digestValue</i> buffer.
     * 
     * If the referenced XML element has not been signed yet, <i>count</i> is 0.
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
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcsignaturereference-getdigestvalue
     */
    GetDigestValue(digestValue, count) {
        digestValueMarshal := digestValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, digestValueMarshal, digestValue, countMarshal, count, "HRESULT")
        return result
    }
}
