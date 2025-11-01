#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An unordered set of IOpcSignatureCustomObject interface pointers that contain the XML markup of application-specific Object elements.
 * @remarks
 * 
  * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer provides access to the XML markup of the <b>Object</b> element it represents. To access the XML markup of the  <b>Object</b> element, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobject-getxml">IOpcSignatureCustomObject::GetXml</a> method.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer is created and added to the set, the <b>Object</b>  it represents is saved when the package is saved.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer is deleted from the set, the <b>Object</b> it represents is not saved when the package is saved.
  * 
  * To create an <b>IOpcSignatureCustomObjectSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcustomobjectset">IOpcSigningOptions::GetCustomObjectSet</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturecustomobjectset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureCustomObjectSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignatureCustomObjectSet
     * @type {Guid}
     */
    static IID => Guid("{8f792ac5-7947-4e11-bc3d-2659ff046ae1}")

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
     * @param {Pointer<Integer>} xmlMarkup 
     * @param {Integer} count 
     * @param {Pointer<IOpcSignatureCustomObject>} customObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectset-create
     */
    Create(xmlMarkup, count, customObject) {
        xmlMarkupMarshal := xmlMarkup is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, xmlMarkupMarshal, xmlMarkup, "uint", count, "ptr*", customObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcSignatureCustomObject} customObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectset-delete
     */
    Delete(customObject) {
        result := ComCall(4, this, "ptr", customObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureCustomObjectEnumerator>} customObjectEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectset-getenumerator
     */
    GetEnumerator(customObjectEnumerator) {
        result := ComCall(5, this, "ptr*", customObjectEnumerator, "HRESULT")
        return result
    }
}
