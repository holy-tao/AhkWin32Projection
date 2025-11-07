#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcSignatureRelationshipReference.ahk
#Include .\IOpcRelationshipSelectorSet.ahk
#Include .\IOpcSignatureRelationshipReferenceEnumerator.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateRelationshipSelectorSet", "Delete", "GetEnumerator"]

    /**
     * 
     * @param {IOpcUri} sourceUri 
     * @param {PWSTR} digestMethod 
     * @param {Integer} relationshipSigningOption 
     * @param {IOpcRelationshipSelectorSet} selectorSet 
     * @param {Integer} transformMethod 
     * @returns {IOpcSignatureRelationshipReference} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create
     */
    Create(sourceUri, digestMethod, relationshipSigningOption, selectorSet, transformMethod) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(3, this, "ptr", sourceUri, "ptr", digestMethod, "int", relationshipSigningOption, "ptr", selectorSet, "int", transformMethod, "ptr*", &relationshipReference := 0, "HRESULT")
        return IOpcSignatureRelationshipReference(relationshipReference)
    }

    /**
     * 
     * @returns {IOpcRelationshipSelectorSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-createrelationshipselectorset
     */
    CreateRelationshipSelectorSet() {
        result := ComCall(4, this, "ptr*", &selectorSet := 0, "HRESULT")
        return IOpcRelationshipSelectorSet(selectorSet)
    }

    /**
     * 
     * @param {IOpcSignatureRelationshipReference} relationshipReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-delete
     */
    Delete(relationshipReference) {
        result := ComCall(5, this, "ptr", relationshipReference, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOpcSignatureRelationshipReferenceEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(6, this, "ptr*", &relationshipReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureRelationshipReferenceEnumerator(relationshipReferenceEnumerator)
    }
}
