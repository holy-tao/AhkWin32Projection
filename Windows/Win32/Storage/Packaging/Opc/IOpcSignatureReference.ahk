#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUri.ahk" { IUri }
#Import ".\OPC_CANONICALIZATION_METHOD.ahk" { OPC_CANONICALIZATION_METHOD }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a reference to XML markup that has been or will be signed.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcsignaturereference
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcSignatureReference extends IUnknown {
    /**
     * The interface identifier for IOpcSignatureReference
     * @type {Guid}
     */
    static IID := Guid("{1b47005e-3011-4edc-be6f-0f65e5ab0342}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcSignatureReference interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetId              : IntPtr
        GetUri             : IntPtr
        GetType            : IntPtr
        GetTransformMethod : IntPtr
        GetDigestMethod    : IntPtr
        GetDigestValue     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcSignatureReference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the identifier for the reference.
     * @remarks
     * This method allocates memory used by the string returned in <i>referenceId</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * Providing an identifier for a reference is optional. If used, the identifier is serialized as the optional <b>Id</b> attribute  of a <b>Reference</b> element in the signature markup.
     * @returns {PWSTR} An identifier for the reference.
     * 
     * If the identifier is not set, <i>referenceId</i> will be the empty string, "".
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereference-getid
     */
    GetId() {
        result := ComCall(3, this, PWSTR.Ptr, &referenceId := 0, "HRESULT")
        return referenceId
    }

    /**
     * Gets the URI of the referenced XML element.
     * @remarks
     * The URI of the referenced element is serialized in the signature markup as the <b>URI</b> attribute of a <b>Reference</b> element.
     * 
     * The following table shows two examples of the <i>referenceUri</i> parameter value represented as strings.<table>
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
     * @returns {IUri} A pointer to the  URI of the referenced element.
     * 
     * This URI represented by a string is  "#" followed by  the <b>Id</b> attribute value of the referenced element: "#<i>&lt;elementIdValue&gt;</i>".
     * 
     * For examples, see the Remarks section.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereference-geturi
     */
    GetUri() {
        result := ComCall(4, this, "ptr*", &referenceUri := 0, "HRESULT")
        return IUri(referenceUri)
    }

    /**
     * Gets a string that indicates the type of the referenced XML element.
     * @remarks
     * This method allocates memory used by the string returned in <i>type</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * Providing a type for the referenced XML  element is optional. If used, the type of the referenced element is serialized in the signature markup as the optional <b>Type</b> attribute  value of a <b>Reference</b> element. 
     * 
     * The caller can use the type of the referenced element to indicate whether the element  is an <b>Object</b>, <b>SignatureProperty</b>, or <b>Manifest</b> element. This identification can aid the caller in processing the reference.
     * @returns {PWSTR} A string that indicates the type of the referenced XML  element.
     * 
     * If the type  is not set, the <i>type</i> parameter will be the empty string "".
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereference-gettype
     */
    GetType() {
        result := ComCall(5, this, PWSTR.Ptr, &type := 0, "HRESULT")
        return type
    }

    /**
     * Gets the canonicalization method to use on the referenced XML element, when the element is signed.
     * @returns {OPC_CANONICALIZATION_METHOD} The canonicalization method to use on the referenced XML element, when the element is signed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereference-gettransformmethod
     */
    GetTransformMethod() {
        result := ComCall(6, this, "int*", &transformMethod := 0, "HRESULT")
        return transformMethod
    }

    /**
     * Gets the digest method to use on the referenced XML element, when the element is signed.
     * @remarks
     * This method allocates memory used by the string returned in <i>digestMethod</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * @returns {PWSTR} The digest method to use on the referenced XML element.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereference-getdigestmethod
     */
    GetDigestMethod() {
        result := ComCall(7, this, PWSTR.Ptr, &digestMethod := 0, "HRESULT")
        return digestMethod
    }

    /**
     * Gets the digest value that is calculated for the referenced XML element when the element is signed.
     * @remarks
     * This method allocates memory used by the buffer returned in <i>digestValue</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
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
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereference-getdigestvalue
     */
    GetDigestValue(digestValue, count) {
        digestValueMarshal := digestValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, digestValueMarshal, digestValue, countMarshal, count, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOpcSignatureReference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 2)
        this.vtbl.GetUri := CallbackCreate(GetMethod(implObj, "GetUri"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.GetTransformMethod := CallbackCreate(GetMethod(implObj, "GetTransformMethod"), flags, 2)
        this.vtbl.GetDigestMethod := CallbackCreate(GetMethod(implObj, "GetDigestMethod"), flags, 2)
        this.vtbl.GetDigestValue := CallbackCreate(GetMethod(implObj, "GetDigestValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetUri)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetTransformMethod)
        CallbackFree(this.vtbl.GetDigestMethod)
        CallbackFree(this.vtbl.GetDigestValue)
    }
}
