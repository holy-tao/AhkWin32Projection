#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes properties and methods of a cache request. Client applications use this interface to specify the properties and control patterns to be cached when a Microsoft UI Automation element is obtained.
 * @remarks
 * 
  * Retrieving properties and control patterns through UI Automation requires cross-process calls that can slow down performance. By caching values of proprieties and control patterns in a batch operation, you can enhance the performance of your application.
  * 
  * Create a new cache request by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createcacherequest">CreateCacheRequest</a>, and configure the request by calling methods of <b>IUIAutomationCacheRequest</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationCacheRequest extends IUnknown{
    /**
     * The interface identifier for IUIAutomationCacheRequest
     * @type {Guid}
     */
    static IID => Guid("{b32a92b5-bc25-4078-9c08-d7ee95c48e03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} propertyId 
     * @returns {HRESULT} 
     */
    AddProperty(propertyId) {
        result := ComCall(3, this, "int", propertyId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @returns {HRESULT} 
     */
    AddPattern(patternId) {
        result := ComCall(4, this, "int", patternId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} clonedRequest 
     * @returns {HRESULT} 
     */
    Clone(clonedRequest) {
        result := ComCall(5, this, "ptr", clonedRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} scope 
     * @returns {HRESULT} 
     */
    get_TreeScope(scope) {
        result := ComCall(6, this, "int*", scope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     */
    put_TreeScope(scope) {
        result := ComCall(7, this, "int", scope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} filter 
     * @returns {HRESULT} 
     */
    get_TreeFilter(filter) {
        result := ComCall(8, this, "ptr", filter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} filter 
     * @returns {HRESULT} 
     */
    put_TreeFilter(filter) {
        result := ComCall(9, this, "ptr", filter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} mode 
     * @returns {HRESULT} 
     */
    get_AutomationElementMode(mode) {
        result := ComCall(10, this, "int*", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    put_AutomationElementMode(mode) {
        result := ComCall(11, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
