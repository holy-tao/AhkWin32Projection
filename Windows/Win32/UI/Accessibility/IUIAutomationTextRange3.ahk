#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange2.ahk

/**
 * Extends the IUIAutomationTextRange2 interface to support faster access to the underlying rich text data on a text range.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextrange3
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextRange3 extends IUIAutomationTextRange2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTextRange3
     * @type {Guid}
     */
    static IID => Guid("{6a315d69-5512-4c2e-85f0-53fce6dd4bc2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnclosingElementBuildCache", "GetChildrenBuildCache", "GetAttributeValues"]

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} enclosingElement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getenclosingelementbuildcache
     */
    GetEnclosingElementBuildCache(cacheRequest, enclosingElement) {
        result := ComCall(22, this, "ptr", cacheRequest, "ptr*", enclosingElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElementArray>} children 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getchildrenbuildcache
     */
    GetChildrenBuildCache(cacheRequest, children) {
        result := ComCall(23, this, "ptr", cacheRequest, "ptr*", children, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} attributeIds 
     * @param {Integer} attributeIdCount 
     * @param {Pointer<Pointer<SAFEARRAY>>} attributeValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getattributevalues
     */
    GetAttributeValues(attributeIds, attributeIdCount, attributeValues) {
        attributeIdsMarshal := attributeIds is VarRef ? "int*" : "ptr"
        attributeValuesMarshal := attributeValues is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, attributeIdsMarshal, attributeIds, "int", attributeIdCount, attributeValuesMarshal, attributeValues, "HRESULT")
        return result
    }
}
