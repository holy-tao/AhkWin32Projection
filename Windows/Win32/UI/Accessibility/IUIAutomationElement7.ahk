#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import ".\IUIAutomationCacheRequest.ahk" { IUIAutomationCacheRequest }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }
#Import ".\IUIAutomationElement6.ahk" { IUIAutomationElement6 }
#Import ".\TreeTraversalOptions.ahk" { TreeTraversalOptions }
#Import ".\TreeScope.ahk" { TreeScope }
#Import ".\UIA_METADATA_ID.ahk" { UIA_METADATA_ID }

/**
 * Extends the IUIAutomationElement6 interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement7
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement7 extends IUIAutomationElement6 {
    /**
     * The interface identifier for IUIAutomationElement7
     * @type {Guid}
     */
    static IID := Guid("{204e8572-cfc3-4c11-b0c8-7da7420750b7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement7 interfaces
    */
    struct Vtbl extends IUIAutomationElement6.Vtbl {
        FindFirstWithOptions           : IntPtr
        FindAllWithOptions             : IntPtr
        FindFirstWithOptionsBuildCache : IntPtr
        FindAllWithOptionsBuildCache   : IntPtr
        GetCurrentMetadataValue        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Finds the first matching element in the specified order.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCondition} condition A pointer to a condition that represents the criteria to match.
     * @param {TreeTraversalOptions} traversalOptions 
     * @param {IUIAutomationElement} root A pointer to the element with which to begin the search.
     * @returns {IUIAutomationElement} Receives a pointer to the element. <b>NULL</b> is returned if no matching element is found.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findfirstwithoptions
     */
    FindFirstWithOptions(scope, condition, traversalOptions, root) {
        result := ComCall(110, this, TreeScope, scope, "ptr", condition, TreeTraversalOptions, traversalOptions, "ptr", root, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * Find all matching elements in the specified order.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCondition} condition A pointer to a condition that represents the criteria to match.
     * @param {TreeTraversalOptions} traversalOptions 
     * @param {IUIAutomationElement} root A pointer to the element with which to begin the search.
     * @returns {IUIAutomationElementArray} Receives a pointer to an array of matching elements. Returns an empty array if no matching element is found.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findallwithoptions
     */
    FindAllWithOptions(scope, condition, traversalOptions, root) {
        result := ComCall(111, this, TreeScope, scope, "ptr", condition, TreeTraversalOptions, traversalOptions, "ptr", root, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * Finds the first matching element in the specified order, but also caches its properties and pattern.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCondition} condition A pointer to a condition that represents the criteria to match.
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @param {TreeTraversalOptions} traversalOptions 
     * @param {IUIAutomationElement} root A pointer to the element with which to begin the search.
     * @returns {IUIAutomationElement} Receives a pointer to the element. <b>NULL</b> is returned if no matching element is found.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findfirstwithoptionsbuildcache
     */
    FindFirstWithOptionsBuildCache(scope, condition, cacheRequest, traversalOptions, root) {
        result := ComCall(112, this, TreeScope, scope, "ptr", condition, "ptr", cacheRequest, TreeTraversalOptions, traversalOptions, "ptr", root, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * Finds all matching elements in the specified order, but also caches their properties and patterns.
     * @param {TreeScope} scope Type: <b>[TreeScope](ne-uiautomationclient-treescope.md)</b>
     * 
     * The scope of the request.
     * 
     * When an element is retrieved, caching can be performed for only the element itself (the default behavior), or for the element and its children or descendants. This property describes the scope of the request.
     * @param {IUIAutomationCondition} condition Type: <b>[IUIAutomationCondition](nn-uiautomationclient-iuiautomationcondition.md)</b>
     * 
     * The primary interface for conditions used in filtering when searching for elements in the UI Automation tree.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b>[IUIAutomationCacheRequest](nn-uiautomationclient-iuiautomationcacherequest.md)</b>
     * 
     * A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @param {TreeTraversalOptions} traversalOptions Type: <b>[TreeTraversalOptions](ne-uiautomationclient-treetraversaloptions.md)</b>
     * 
     * The tree navigation order.
     * @param {IUIAutomationElement} root Type: <b>[IUIAutomationElement](nn-uiautomationclient-iuiautomationelement.md)</b>
     * 
     * A pointer to the element with which to begin the search.
     * @returns {IUIAutomationElementArray} Receives a pointer to an array of matching elements. Returns an empty array if no matching element is found.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findallwithoptionsbuildcache
     */
    FindAllWithOptionsBuildCache(scope, condition, cacheRequest, traversalOptions, root) {
        result := ComCall(113, this, TreeScope, scope, "ptr", condition, "ptr", cacheRequest, TreeTraversalOptions, traversalOptions, "ptr", root, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * Gets metadata from the UI Automation element that indicates how the information should be interpreted. (IUIAutomationElement7.GetCurrentMetadataValue)
     * @param {Integer} targetId The ID of the property to retrieve.
     * @param {UIA_METADATA_ID} metadataId Specifies the type of metadata to retrieve.
     * @returns {VARIANT} The metadata.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-getcurrentmetadatavalue
     */
    GetCurrentMetadataValue(targetId, metadataId) {
        returnVal := VARIANT()
        result := ComCall(114, this, "int", targetId, UIA_METADATA_ID, metadataId, VARIANT.Ptr, returnVal, "HRESULT")
        return returnVal
    }

    Query(iid) {
        if (IUIAutomationElement7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindFirstWithOptions := CallbackCreate(GetMethod(implObj, "FindFirstWithOptions"), flags, 6)
        this.vtbl.FindAllWithOptions := CallbackCreate(GetMethod(implObj, "FindAllWithOptions"), flags, 6)
        this.vtbl.FindFirstWithOptionsBuildCache := CallbackCreate(GetMethod(implObj, "FindFirstWithOptionsBuildCache"), flags, 7)
        this.vtbl.FindAllWithOptionsBuildCache := CallbackCreate(GetMethod(implObj, "FindAllWithOptionsBuildCache"), flags, 7)
        this.vtbl.GetCurrentMetadataValue := CallbackCreate(GetMethod(implObj, "GetCurrentMetadataValue"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindFirstWithOptions)
        CallbackFree(this.vtbl.FindAllWithOptions)
        CallbackFree(this.vtbl.FindFirstWithOptionsBuildCache)
        CallbackFree(this.vtbl.FindAllWithOptionsBuildCache)
        CallbackFree(this.vtbl.GetCurrentMetadataValue)
    }
}
