#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An unordered set of IOpcSignaturePartReference interface pointers that represent references to parts to be signed.
 * @remarks
 * 
  * Only parts that can be represented by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface can be referenced by an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer. Relationships parts are referenced for signing  by a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface. To create an <b>IOpcSignatureRelationshipReference</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">IOpcSignatureRelationshipReferenceSet::Create</a> method.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
  * 
  * To create an <b>IOpcSignaturePartReferenceSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignaturepartreferenceset">IOpcSigningOptions::GetSignaturePartReferenceSet</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturepartreferenceset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignaturePartReferenceSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignaturePartReferenceSet
     * @type {Guid}
     */
    static IID => Guid("{6c9fe28c-ecd9-4b22-9d36-7fdde670fec0}")

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
     * 
     * @param {IOpcPartUri} partUri 
     * @param {PWSTR} digestMethod 
     * @param {Integer} transformMethod 
     * @param {Pointer<IOpcSignaturePartReference>} partReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceset-create
     */
    Create(partUri, digestMethod, transformMethod, partReference) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(3, this, "ptr", partUri, "ptr", digestMethod, "int", transformMethod, "ptr*", partReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcSignaturePartReference} partReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceset-delete
     */
    Delete(partReference) {
        result := ComCall(4, this, "ptr", partReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignaturePartReferenceEnumerator>} partReferenceEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceset-getenumerator
     */
    GetEnumerator(partReferenceEnumerator) {
        result := ComCall(5, this, "ptr*", partReferenceEnumerator, "HRESULT")
        return result
    }
}
