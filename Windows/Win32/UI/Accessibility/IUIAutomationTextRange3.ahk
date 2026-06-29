#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCacheRequest.ahk" { IUIAutomationCacheRequest }
#Import ".\IUIAutomationTextRange2.ahk" { IUIAutomationTextRange2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIA_TEXTATTRIBUTE_ID.ahk" { UIA_TEXTATTRIBUTE_ID }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Extends the IUIAutomationTextRange2 interface to support faster access to the underlying rich text data on a text range.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange3
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTextRange3 extends IUIAutomationTextRange2 {
    /**
     * The interface identifier for IUIAutomationTextRange3
     * @type {Guid}
     */
    static IID := Guid("{6a315d69-5512-4c2e-85f0-53fce6dd4bc2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTextRange3 interfaces
    */
    struct Vtbl extends IUIAutomationTextRange2.Vtbl {
        GetEnclosingElementBuildCache : IntPtr
        GetChildrenBuildCache         : IntPtr
        GetAttributeValues            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTextRange3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getenclosingelementbuildcache
     */
    GetEnclosingElementBuildCache(cacheRequest) {
        result := ComCall(22, this, "ptr", cacheRequest, "ptr*", &enclosingElement := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getchildrenbuildcache
     */
    GetChildrenBuildCache(cacheRequest) {
        result := ComCall(23, this, "ptr", cacheRequest, "ptr*", &children := 0, "HRESULT")
        return IUIAutomationElementArray(children)
    }

    /**
     * Returns all of the requested text attribute values for a text range in a single cross-process call. This is equivalent to calling GetAttributeValue, except it can retrieve multiple values instead of just one.
     * @remarks
     * <b>GetAttributeValues</b> only gets the text attributes that are supplied in the call.
     * @param {Pointer<UIA_TEXTATTRIBUTE_ID>} attributeIds A list of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">text attribute identifiers</a>.
     * @param {Integer} attributeIdCount The number of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">text attribute identifiers</a> in the <i>attributeIds</i> list.
     * @returns {Pointer<SAFEARRAY>} A <b>SAFEARRAY</b> of <b>VARIANT</b> containing values to corresponding text attributes for a text range.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange3-getattributevalues
     */
    GetAttributeValues(attributeIds, attributeIdCount) {
        attributeIdsMarshal := attributeIds is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, attributeIdsMarshal, attributeIds, "int", attributeIdCount, "ptr*", &attributeValues := 0, "HRESULT")
        return attributeValues
    }

    Query(iid) {
        if (IUIAutomationTextRange3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEnclosingElementBuildCache := CallbackCreate(GetMethod(implObj, "GetEnclosingElementBuildCache"), flags, 3)
        this.vtbl.GetChildrenBuildCache := CallbackCreate(GetMethod(implObj, "GetChildrenBuildCache"), flags, 3)
        this.vtbl.GetAttributeValues := CallbackCreate(GetMethod(implObj, "GetAttributeValues"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEnclosingElementBuildCache)
        CallbackFree(this.vtbl.GetChildrenBuildCache)
        CallbackFree(this.vtbl.GetAttributeValues)
    }
}
