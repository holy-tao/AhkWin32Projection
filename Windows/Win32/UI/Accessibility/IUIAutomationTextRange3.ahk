#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
#Include .\IUIAutomationElementArray.ahk
#Include .\IUIAutomationTextRange2.ahk

/**
 * Extends the IUIAutomationTextRange2 interface to support faster access to the underlying rich text data on a text range.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange3
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
     * Gets the enclosing element and supplied properties and patterns for an element in a text range in a single cross-process call. This is equivalent to calling GetEnclosingElement, but adds the standard build cache pattern.
     * @remarks
     * Following the design of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getenclosingelement">GetEnclosingElement</a>:
     * 
     * <ul>
     * <li>Gets the all-inclusive, innermost enclosing element of a text range and the supplied properties of the element.</li>
     * </ul>
     * As a result of a successful call, UI Automation clients are able call "Cached" APIs of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> that are provided in the <i>cacheRequest</i>, for example, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalue">IUIAutomationElement::GetCachedPropertyValue</a>.
     * @param {IUIAutomationCacheRequest} cacheRequest An <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a> specifying the properties and control patterns to be cached.
     * @returns {IUIAutomationElement} Returns the enclosing element (and properties/patterns) of the text range if it meets the criteria of the supplied <i>cacheRequest</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getenclosingelementbuildcache
     */
    GetEnclosingElementBuildCache(cacheRequest) {
        result := ComCall(22, this, "ptr", cacheRequest, "ptr*", &enclosingElement := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAutomationElement(enclosingElement)
    }

    /**
     * Returns the children and supplied properties and patterns for elements in a text range in a single cross-process call. This is equivalent to calling GetChildren, but adds the standard build cache pattern.
     * @remarks
     * Following the design of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getchildren">GetChildren</a>:
     * 
     * <ul>
     * <li>Children that overlap with the text range, but are not entirely enclosed by it will also be included.</li>
     * <li>When no children exist, an empty collection is returned.</li>
     * </ul>
     * As a result of a successful call, UI Automation clients are able call "Cached" APIs of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> that are provided in the <i>cacheRequest</i>, for example, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalue">IUIAutomationElement::GetCachedPropertyValue</a>.
     * @param {IUIAutomationCacheRequest} cacheRequest An <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a> specifying the properties and control patterns to be cached.
     * @returns {IUIAutomationElementArray} Returns the children, and each child’s properties or patterns, of the text range that meet the criteria of the supplied <i>cacheRequest</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getchildrenbuildcache
     */
    GetChildrenBuildCache(cacheRequest) {
        result := ComCall(23, this, "ptr", cacheRequest, "ptr*", &children := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAutomationElementArray(children)
    }

    /**
     * Returns all of the requested text attribute values for a text range in a single cross-process call. This is equivalent to calling GetAttributeValue, except it can retrieve multiple values instead of just one.
     * @remarks
     * <b>GetAttributeValues</b> only gets the text attributes that are supplied in the call.
     * @param {Pointer<Integer>} attributeIds A list of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">text attribute identifiers</a>.
     * @param {Integer} attributeIdCount The number of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">text attribute identifiers</a> in the <i>attributeIds</i> list.
     * @returns {Pointer<SAFEARRAY>} A <b>SAFEARRAY</b> of <b>VARIANT</b> containing values to corresponding text attributes for a text range.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getattributevalues
     */
    GetAttributeValues(attributeIds, attributeIdCount) {
        attributeIdsMarshal := attributeIds is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, attributeIdsMarshal, attributeIds, "int", attributeIdCount, "ptr*", &attributeValues := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return attributeValues
    }
}
