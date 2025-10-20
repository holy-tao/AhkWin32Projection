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
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Integer} traversalOptions 
     * @param {Pointer<IUIAutomationElement>} root 
     * @param {Pointer<IUIAutomationElement>} found 
     * @returns {HRESULT} 
     */
    FindFirstWithOptions(scope, condition, traversalOptions, root, found) {
        result := ComCall(110, this, "int", scope, "ptr", condition, "int", traversalOptions, "ptr", root, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Integer} traversalOptions 
     * @param {Pointer<IUIAutomationElement>} root 
     * @param {Pointer<IUIAutomationElementArray>} found 
     * @returns {HRESULT} 
     */
    FindAllWithOptions(scope, condition, traversalOptions, root, found) {
        result := ComCall(111, this, "int", scope, "ptr", condition, "int", traversalOptions, "ptr", root, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Integer} traversalOptions 
     * @param {Pointer<IUIAutomationElement>} root 
     * @param {Pointer<IUIAutomationElement>} found 
     * @returns {HRESULT} 
     */
    FindFirstWithOptionsBuildCache(scope, condition, cacheRequest, traversalOptions, root, found) {
        result := ComCall(112, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "int", traversalOptions, "ptr", root, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Integer} traversalOptions 
     * @param {Pointer<IUIAutomationElement>} root 
     * @param {Pointer<IUIAutomationElementArray>} found 
     * @returns {HRESULT} 
     */
    FindAllWithOptionsBuildCache(scope, condition, cacheRequest, traversalOptions, root, found) {
        result := ComCall(113, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "int", traversalOptions, "ptr", root, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} targetId 
     * @param {Integer} metadataId 
     * @param {Pointer<VARIANT>} returnVal 
     * @returns {HRESULT} 
     */
    GetCurrentMetadataValue(targetId, metadataId, returnVal) {
        result := ComCall(114, this, "int", targetId, "int", metadataId, "ptr", returnVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
