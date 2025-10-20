#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An unordered set of IOpcSignatureRelationshipReference interface pointers that represent references to Relationships parts that contain relationships to be signed.
 * @remarks
 * 
  *  To create an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer that represents a reference to a Relationships part, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">Create</a> method. This reference will indicate whether  all or a subset of the  relationships in the Relationships part will be signed when the signature is generated.
  * 
  * To access an <b>IOpcSignatureRelationshipReferenceSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignaturerelationshipreferenceset">IOpcSigningOptions::GetSignatureRelationshipReferenceSet</a> method.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturerelationshipreferenceset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureRelationshipReferenceSet extends IUnknown{
    /**
     * The interface identifier for IOpcSignatureRelationshipReferenceSet
     * @type {Guid}
     */
    static IID => Guid("{9f863ca5-3631-404c-828d-807e0715069b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOpcUri>} sourceUri 
     * @param {PWSTR} digestMethod 
     * @param {Integer} relationshipSigningOption 
     * @param {Pointer<IOpcRelationshipSelectorSet>} selectorSet 
     * @param {Integer} transformMethod 
     * @param {Pointer<IOpcSignatureRelationshipReference>} relationshipReference 
     * @returns {HRESULT} 
     */
    Create(sourceUri, digestMethod, relationshipSigningOption, selectorSet, transformMethod, relationshipReference) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(3, this, "ptr", sourceUri, "ptr", digestMethod, "int", relationshipSigningOption, "ptr", selectorSet, "int", transformMethod, "ptr", relationshipReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcRelationshipSelectorSet>} selectorSet 
     * @returns {HRESULT} 
     */
    CreateRelationshipSelectorSet(selectorSet) {
        result := ComCall(4, this, "ptr", selectorSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureRelationshipReference>} relationshipReference 
     * @returns {HRESULT} 
     */
    Delete(relationshipReference) {
        result := ComCall(5, this, "ptr", relationshipReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureRelationshipReferenceEnumerator>} relationshipReferenceEnumerator 
     * @returns {HRESULT} 
     */
    GetEnumerator(relationshipReferenceEnumerator) {
        result := ComCall(6, this, "ptr", relationshipReferenceEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
