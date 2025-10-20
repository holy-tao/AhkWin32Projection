#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An unordered set of IOpcSignatureReference interface pointers that represent references to XML elements to be signed.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceset-create">Create</a> method creates a reference to an application-specific <b>Object</b> element or a child of an application-specific <b>Object</b> that is signed when the signature is generated. <b>Create</b> does not create the reference to the package-specific <b>Object</b> element to be signed; that reference is created automatically when the signature is generated.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
  * 
  * To access an <b>IOpcSignatureReferenceSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcustomreferenceset">IOpcSigningOptions::GetCustomReferenceSet</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturereferenceset
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
     * 
     * @param {IUri} referenceUri 
     * @param {PWSTR} referenceId 
     * @param {PWSTR} type 
     * @param {PWSTR} digestMethod 
     * @param {Integer} transformMethod 
     * @param {Pointer<IOpcSignatureReference>} reference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceset-create
     */
    Create(referenceUri, referenceId, type, digestMethod, transformMethod, reference) {
        referenceId := referenceId is String ? StrPtr(referenceId) : referenceId
        type := type is String ? StrPtr(type) : type
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(3, this, "ptr", referenceUri, "ptr", referenceId, "ptr", type, "ptr", digestMethod, "int", transformMethod, "ptr*", reference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcSignatureReference} reference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceset-delete
     */
    Delete(reference) {
        result := ComCall(4, this, "ptr", reference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureReferenceEnumerator>} referenceEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceset-getenumerator
     */
    GetEnumerator(referenceEnumerator) {
        result := ComCall(5, this, "ptr*", referenceEnumerator, "HRESULT")
        return result
    }
}
