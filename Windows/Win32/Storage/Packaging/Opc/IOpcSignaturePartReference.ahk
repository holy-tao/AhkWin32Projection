#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OPC_CANONICALIZATION_METHOD.ahk" { OPC_CANONICALIZATION_METHOD }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a reference to a part that has been or will be signed.
 * @remarks
 * Only parts that can be represented by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface can be referenced by an <b>IOpcSignaturePartReference</b> interface pointer. Relationships parts are referenced for signing  by a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface. To create an <b>IOpcSignatureRelationshipReference</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">IOpcSignatureRelationshipReferenceSet::Create</a> method.
 * 
 * To create 
 * 				an <b>IOpcSignaturePartReference</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturepartreferenceset-create">IOpcSignaturePartReferenceSet::Create</a> method.
 * 
 * To access an <b>IOpcSignaturePartReference</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturepartreferenceenumerator-getcurrent">IOpcSignaturePartReferenceEnumerator::GetCurrent</a> method.
 * 
 * The interface provides methods to access information about the referenced part and the reference itself. When a signature is generated, this reference information is serialized in the XML markup of the signature (signature markup).  In signature markup, the information is represented by a  <b>Reference</b> element that has its <b>URI</b> attribute value set to the part name of the referenced part.
 * 
 * The following markup shows that these <b>Reference</b> elements are children of the <b>Manifest</b> element in signature markup.
 * 
 * 
 * ```xml
 * // Signature XML markup
 * <Signature>
 * 	[...]
 * 	// Package-specific <Object>
 * 	<Object Id="idPackageObject">
 * 		// This <Manifest> element contains only one signed part. 
 * 		<Manifest>
 * 			// A reference to a signed part.
 * 			<Reference URI="aPartName">
 * 				[...]
 * 			</Reference>
 * 		</Manifest>
 * 		[...]
 * 	</Object>
 * 	[...]
 * </Signature>
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcsignaturepartreference
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcSignaturePartReference extends IUnknown {
    /**
     * The interface identifier for IOpcSignaturePartReference
     * @type {Guid}
     */
    static IID := Guid("{e24231ca-59f4-484e-b64b-36eeda36072c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcSignaturePartReference interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPartName        : IntPtr
        GetContentType     : IntPtr
        GetDigestMethod    : IntPtr
        GetDigestValue     : IntPtr
        GetTransformMethod : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcSignaturePartReference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the part name of the referenced part.
     * @returns {IOpcPartUri} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that represents the part name.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-getpartname
     */
    GetPartName() {
        result := ComCall(3, this, "ptr*", &partName := 0, "HRESULT")
        return IOpcPartUri(partName)
    }

    /**
     * Gets the content type of the referenced part.
     * @remarks
     * This method allocates memory used by the string returned in <i>contentType</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * @returns {PWSTR} The content type of the referenced part.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-getcontenttype
     */
    GetContentType() {
        result := ComCall(4, this, PWSTR.Ptr, &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * Gets the digest method to use on part content of the referenced part when the part is signed.
     * @remarks
     * This method allocates memory used by the string returned in <i>digestMethod</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * @returns {PWSTR} The digest method to use on part content of the referenced part when the part is signed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-getdigestmethod
     */
    GetDigestMethod() {
        result := ComCall(5, this, PWSTR.Ptr, &digestMethod := 0, "HRESULT")
        return digestMethod
    }

    /**
     * Gets the digest value that is calculated for part content of the referenced part when the part is signed.
     * @remarks
     * This method allocates memory used by the buffer returned in <i>digestValue</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * @param {Pointer<Pointer<Integer>>} digestValue A pointer to a buffer that contains the digest value that is calculated using the specified digest method; the method is  applied to part content of the referenced part when the part is signed.
     * @param {Pointer<Integer>} count The size of the <i>digestValue</i> buffer.
     * 
     * If the referenced part has not been signed yet, <i>count</i> is 0.
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
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-getdigestvalue
     */
    GetDigestValue(digestValue, count) {
        digestValueMarshal := digestValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, digestValueMarshal, digestValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Gets the canonicalization method to use on part content of a referenced part when the part is signed.
     * @returns {OPC_CANONICALIZATION_METHOD} The canonicalization method to use on part content of a referenced part when the part is signed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-gettransformmethod
     */
    GetTransformMethod() {
        result := ComCall(7, this, "int*", &transformMethod := 0, "HRESULT")
        return transformMethod
    }

    Query(iid) {
        if (IOpcSignaturePartReference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPartName := CallbackCreate(GetMethod(implObj, "GetPartName"), flags, 2)
        this.vtbl.GetContentType := CallbackCreate(GetMethod(implObj, "GetContentType"), flags, 2)
        this.vtbl.GetDigestMethod := CallbackCreate(GetMethod(implObj, "GetDigestMethod"), flags, 2)
        this.vtbl.GetDigestValue := CallbackCreate(GetMethod(implObj, "GetDigestValue"), flags, 3)
        this.vtbl.GetTransformMethod := CallbackCreate(GetMethod(implObj, "GetTransformMethod"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPartName)
        CallbackFree(this.vtbl.GetContentType)
        CallbackFree(this.vtbl.GetDigestMethod)
        CallbackFree(this.vtbl.GetDigestValue)
        CallbackFree(this.vtbl.GetTransformMethod)
    }
}
