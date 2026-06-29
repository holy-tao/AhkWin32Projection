#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\OPC_RELATIONSHIPS_SIGNING_OPTION.ahk" { OPC_RELATIONSHIPS_SIGNING_OPTION }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OPC_CANONICALIZATION_METHOD.ahk" { OPC_CANONICALIZATION_METHOD }
#Import ".\IOpcSignatureRelationshipReferenceEnumerator.ahk" { IOpcSignatureRelationshipReferenceEnumerator }
#Import ".\IOpcRelationshipSelectorSet.ahk" { IOpcRelationshipSelectorSet }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IOpcSignatureRelationshipReference.ahk" { IOpcSignatureRelationshipReference }
#Import ".\IOpcUri.ahk" { IOpcUri }

/**
 * An unordered set of IOpcSignatureRelationshipReference interface pointers that represent references to Relationships parts that contain relationships to be signed.
 * @remarks
 * To create an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer that represents a reference to a Relationships part, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">Create</a> method. This reference will indicate whether  all or a subset of the  relationships in the Relationships part will be signed when the signature is generated.
 * 
 * To access an <b>IOpcSignatureRelationshipReferenceSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignaturerelationshipreferenceset">IOpcSigningOptions::GetSignatureRelationshipReferenceSet</a> method.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcsignaturerelationshipreferenceset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcSignatureRelationshipReferenceSet extends IUnknown {
    /**
     * The interface identifier for IOpcSignatureRelationshipReferenceSet
     * @type {Guid}
     */
    static IID := Guid("{9f863ca5-3631-404c-828d-807e0715069b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcSignatureRelationshipReferenceSet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create                        : IntPtr
        CreateRelationshipSelectorSet : IntPtr
        Delete                        : IntPtr
        GetEnumerator                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcSignatureRelationshipReferenceSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IOpcSignatureRelationshipReference interface pointer that represents a reference to a Relationships part, and adds the new interface pointer to the set.
     * @remarks
     * This method creates a reference to a Relationships part. All or a subset of the  relationships that are stored in a referenced Relationships part can be signed when the signature is generated.
     * 
     * To sign all of the relationships in a Relationships part, call this method with the <i>relationshipSigningOption</i> parameter value set to <b>OPC_RELATIONSHIP_SIGN_PART</b> and the <i>selectorSet</i> parameter value set to <b>NULL</b>.
     * 
     * To sign a subset of the relationships in a Relationships part, call this method with the <i>relationshipSigningOption</i> parameter value set to <b>OPC_RELATIONSHIP_SIGN_USING_SELECTORS</b> and the <i>selectorSet</i> parameter value set to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselectorset">IOpcRelationshipSelectorSet</a> interface pointer. To create an <b>IOpcRelationshipSelectorSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-createrelationshipselectorset">CreateRelationshipSelectorSet</a> method.
     * 
     * The following table summarizes the parameter values required by this method to create a reference that indicates whether all of the relationships or a subset of the relationships (which are stored in the Relationships part to be referenced) are to be signed.<table>
     * <tr>
     * <th>Description</th>
     * <th><i>relationshipSigningOption</i> Value</th>
     * <th><i>selectorSet</i> Value</th>
     * </tr>
     * <tr>
     * <td>Sign all of the relationships in the Relationships part</td>
     * <td><b>OPC_RELATIONSHIP_SIGN_PART</b></td>
     * <td><b>NULL</b></td>
     * </tr>
     * <tr>
     * <td>Sign a subset of the relationships in the Relationships part</td>
     * <td><b>OPC_RELATIONSHIP_SIGN_USING_SELECTORS</b></td>
     * <td>An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselectorset">IOpcRelationshipSelectorSet</a> interface pointer</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * If a subset of relationships are to be signed, the specified transform method is ignored.  Instead, when the signature is generated, the first transform applied is the Relationships Transform, and the second is the  <b>OPC_CANONICALIZATION_C14N</b> canonicalization method.
     * 
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
     * 
     *  Relationships that will not be signed can be removed, modified or added to  the package without invalidating the signature. If a subset of relationships has been selected for signing and the subset is altered, the signature will be invalidated.
     * 
     * <div class="alert"><b>Important</b>  A selected subset could be altered if the relationship type of a relationship that is added to or modified in a referenced Relationships part matches a relationship type that was used to select one or more relationships in the subset.</div>
     * <div> </div>
     * @param {IOpcUri} sourceUri An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a>  interface pointer that represents the source URI of the relationships to be selected for signing.
     * @param {PWSTR} digestMethod The digest method to be used for the relationships to be selected. To use the default digest method, pass <b>NULL</b> in this parameter.
     * 
     * 
     * <div class="alert"><b>Important</b>  The default digest method must be set by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">IOpcSigningOptions::SetDefaultDigestMethod</a> method before <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> is called.</div>
     * <div> </div>
     * @param {OPC_RELATIONSHIPS_SIGNING_OPTION} relationshipSigningOption A value that indicates whether the relationships selected for signing include    all or a subset of the relationships in the Relationships part to be referenced.
     * 
     * For information about the effect of <i>relationshipSigningOption</i> values on other parameters, see Remarks.
     * @param {IOpcRelationshipSelectorSet} selectorSet An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselectorset">IOpcRelationshipSelectorSet</a> interface pointer that can be used to identify a subset of relationships in the Relationships part to be selected for signing.
     * 
     * If <i>relationshipSigningOption</i> is  set to <b>OPC_RELATIONSHIP_SIGN_PART</b>, <i>selectorSet</i> is  <b>NULL</b>.
     * 
     * For information about <i>selectorSet</i> values, see Remarks.
     * @param {OPC_CANONICALIZATION_METHOD} transformMethod A value that describes the canonicalization method to be applied to the relationship markup of the selected relationships.
     * 
     * If <i>relationshipSigningOption</i> is set <b>OPC_RELATIONSHIP_SIGN_USING_SELECTORS</b>, the value of <i>transformMethod</i> is ignored.
     * 
     * For more information about the transform methods to be applied when  <i>relationshipSigningOption</i>  is set to <b>OPC_RELATIONSHIP_SIGN_USING_SELECTORS</b>, see Remarks.
     * @returns {IOpcSignatureRelationshipReference} A new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer that represents the referenced Relationships part.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create
     */
    Create(sourceUri, digestMethod, relationshipSigningOption, selectorSet, transformMethod) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(3, this, "ptr", sourceUri, "ptr", digestMethod, OPC_RELATIONSHIPS_SIGNING_OPTION, relationshipSigningOption, "ptr", selectorSet, OPC_CANONICALIZATION_METHOD, transformMethod, "ptr*", &relationshipReference := 0, "HRESULT")
        return IOpcSignatureRelationshipReference(relationshipReference)
    }

    /**
     * Creates an IOpcRelationshipSelectorSet interface pointer that is used as the selectorSet parameter value of the Create method.
     * @remarks
     * To select a subset of the relationships (which are stored in the Relationships part to be referenced) to be signed when the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">Create</a> method with the <i>relationshipSigningOption</i> parameter value set to <b>OPC_RELATIONSHIP_SIGN_USING_SELECTORS</b> and the <i>selectorSet</i> parameter value set to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselectorset">IOpcRelationshipSelectorSet</a> interface pointer created by this method.
     * @returns {IOpcRelationshipSelectorSet} A new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselectorset">IOpcRelationshipSelectorSet</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-createrelationshipselectorset
     */
    CreateRelationshipSelectorSet() {
        result := ComCall(4, this, "ptr*", &selectorSet := 0, "HRESULT")
        return IOpcRelationshipSelectorSet(selectorSet)
    }

    /**
     * Deletes a specified IOpcSignatureRelationshipReference interface pointer from the set.
     * @remarks
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
     * @param {IOpcSignatureRelationshipReference} relationshipReference An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a>  interface pointer to be deleted.
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
     * The <i>relationshipReference</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-delete
     */
    Delete(relationshipReference) {
        result := ComCall(5, this, "ptr", relationshipReference, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of IOpcSignatureRelationshipReference interface pointers in the set.
     * @returns {IOpcSignatureRelationshipReferenceEnumerator} A pointer to an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointers in the set.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(6, this, "ptr*", &relationshipReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureRelationshipReferenceEnumerator(relationshipReferenceEnumerator)
    }

    Query(iid) {
        if (IOpcSignatureRelationshipReferenceSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 7)
        this.vtbl.CreateRelationshipSelectorSet := CallbackCreate(GetMethod(implObj, "CreateRelationshipSelectorSet"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 2)
        this.vtbl.GetEnumerator := CallbackCreate(GetMethod(implObj, "GetEnumerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
        CallbackFree(this.vtbl.CreateRelationshipSelectorSet)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.GetEnumerator)
    }
}
