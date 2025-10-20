#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {Integer} traversalOptions 
     * @param {IUIAutomationElement} root 
     * @param {Pointer<IUIAutomationElement>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findfirstwithoptions
     */
    FindFirstWithOptions(scope, condition, traversalOptions, root, found) {
        result := ComCall(110, this, "int", scope, "ptr", condition, "int", traversalOptions, "ptr", root, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {Integer} traversalOptions 
     * @param {IUIAutomationElement} root 
     * @param {Pointer<IUIAutomationElementArray>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findallwithoptions
     */
    FindAllWithOptions(scope, condition, traversalOptions, root, found) {
        result := ComCall(111, this, "int", scope, "ptr", condition, "int", traversalOptions, "ptr", root, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Integer} traversalOptions 
     * @param {IUIAutomationElement} root 
     * @param {Pointer<IUIAutomationElement>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findfirstwithoptionsbuildcache
     */
    FindFirstWithOptionsBuildCache(scope, condition, cacheRequest, traversalOptions, root, found) {
        result := ComCall(112, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "int", traversalOptions, "ptr", root, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Integer} traversalOptions 
     * @param {IUIAutomationElement} root 
     * @param {Pointer<IUIAutomationElementArray>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-findallwithoptionsbuildcache
     */
    FindAllWithOptionsBuildCache(scope, condition, cacheRequest, traversalOptions, root, found) {
        result := ComCall(113, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "int", traversalOptions, "ptr", root, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} targetId 
     * @param {Integer} metadataId 
     * @param {Pointer<VARIANT>} returnVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement7-getcurrentmetadatavalue
     */
    GetCurrentMetadataValue(targetId, metadataId, returnVal) {
        result := ComCall(114, this, "int", targetId, "int", metadataId, "ptr", returnVal, "HRESULT")
        return result
    }
}
