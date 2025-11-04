#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents an application-specific Object element that has been or will be signed.
 * @remarks
 * 
  * An <b>IOpcSignatureCustomObject</b> interface pointer provides access to the XML markup of the <b>Object</b> element it represents. To access the XML markup of the  <b>Object</b> element, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobject-getxml">IOpcSignatureCustomObject::GetXml</a> method.
  * 
  * Serialized application-specific <b>Object</b> elements in signature markup can be added, removed, or modified by replacing the signature markup.
  * 
  * To replace signature markup, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-replacesignaturexml">IOpcDigitalSignatureManager::ReplaceSignatureXml</a> method. The caller must ensure that addition, deletion, or modification of application-specific <b>Object</b> elements does not break the signature.
  * 
  * To sign an application-specific  <b>Object</b> element or a child of the element, create a reference to the element to be signed. Create the reference by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceset-create">IOpcSignatureReferenceSet::Create</a> method with the <i>referenceUri</i> parameter value set to "#" followed by the <b>Id</b> attribute value  of the referenced element. For example, if the <b>Id</b> attribute of the referenced element is "Application",  set <i>referenceUri</i> to "#Application".
  * 
  * To create an <b>IOpcSignatureCustomObject</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectset-create">IOpcSignatureCustomObjectSet::Create</a> method.
  * 
  * To access  an <b>IOpcSignatureCustomObject</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-getcurrent">IOpcSignatureCustomObjectEnumerator::GetCurrent</a> method.
  * 
  * When a signature is generated, the markup of application-specific <b>Object</b> element is included in the signature markup.
  * 
  * Application-specific <b>Object</b> elements are not required for package signatures.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturecustomobject
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureCustomObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignatureCustomObject
     * @type {Guid}
     */
    static IID => Guid("{5d77a19e-62c1-44e7-becd-45da5ae51a56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXml"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} xmlMarkup 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobject-getxml
     */
    GetXml(xmlMarkup, count) {
        xmlMarkupMarshal := xmlMarkup is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, xmlMarkupMarshal, xmlMarkup, countMarshal, count, "HRESULT")
        return result
    }
}
