#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
#Include .\IUIAutomationElementArray.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IUIAutomationElement6.ahk

/**
 * Extends the IUIAutomationElement6 interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement7
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement7 extends IUIAutomationElement6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement7
     * @type {Guid}
     */
    static IID => Guid("{204e8572-cfc3-4c11-b0c8-7da7420750b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 110

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirstWithOptions", "FindAllWithOptions", "FindFirstWithOptionsBuildCache", "FindAllWithOptionsBuildCache", "GetCurrentMetadataValue"]

    /**
     * Finds the first matching element in the specified order.
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition A pointer to a condition that represents the criteria to match.
     * @param {Integer} traversalOptions 
     * @param {IUIAutomationElement} root A pointer to the element with which to begin the search.
     * @returns {IUIAutomationElement} Receives a pointer to the element. <b>NULL</b> is returned if no matching element is found.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findfirstwithoptions
     */
    FindFirstWithOptions(scope, condition, traversalOptions, root) {
        result := ComCall(110, this, "int", scope, "ptr", condition, "int", traversalOptions, "ptr", root, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * Find all matching elements in the specified order.
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition A pointer to a condition that represents the criteria to match.
     * @param {Integer} traversalOptions 
     * @param {IUIAutomationElement} root A pointer to the element with which to begin the search.
     * @returns {IUIAutomationElementArray} Receives a pointer to an array of matching elements. Returns an empty array if no matching element is found.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findallwithoptions
     */
    FindAllWithOptions(scope, condition, traversalOptions, root) {
        result := ComCall(111, this, "int", scope, "ptr", condition, "int", traversalOptions, "ptr", root, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * Finds the first matching element in the specified order, but also caches its properties and pattern.
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition A pointer to a condition that represents the criteria to match.
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @param {Integer} traversalOptions 
     * @param {IUIAutomationElement} root A pointer to the element with which to begin the search.
     * @returns {IUIAutomationElement} Receives a pointer to the element. <b>NULL</b> is returned if no matching element is found.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findfirstwithoptionsbuildcache
     */
    FindFirstWithOptionsBuildCache(scope, condition, cacheRequest, traversalOptions, root) {
        result := ComCall(112, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "int", traversalOptions, "ptr", root, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * Finds all matching elements in the specified order, but also caches their properties and patterns.
     * @param {Integer} scope Type: <b>[TreeScope](ne-uiautomationclient-treescope.md)</b>
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
     * @param {Integer} traversalOptions Type: <b>[TreeTraversalOptions](ne-uiautomationclient-treetraversaloptions.md)</b>
     * 
     * The tree navigation order.
     * @param {IUIAutomationElement} root Type: <b>[IUIAutomationElement](nn-uiautomationclient-iuiautomationelement.md)</b>
     * 
     * A pointer to the element with which to begin the search.
     * @returns {IUIAutomationElementArray} Receives a pointer to an array of matching elements. Returns an empty array if no matching element is found.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findallwithoptionsbuildcache
     */
    FindAllWithOptionsBuildCache(scope, condition, cacheRequest, traversalOptions, root) {
        result := ComCall(113, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "int", traversalOptions, "ptr", root, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * Gets metadata from the UI Automation element that indicates how the information should be interpreted.
     * @param {Integer} targetId The ID of the property to retrieve.
     * @param {Integer} metadataId Specifies the type of metadata to retrieve.
     * @returns {VARIANT} The metadata.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement7-getcurrentmetadatavalue
     */
    GetCurrentMetadataValue(targetId, metadataId) {
        returnVal := VARIANT()
        result := ComCall(114, this, "int", targetId, "int", metadataId, "ptr", returnVal, "HRESULT")
        return returnVal
    }
}
