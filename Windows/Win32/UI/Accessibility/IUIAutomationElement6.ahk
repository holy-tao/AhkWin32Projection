#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement5.ahk

/**
 * Extends the IUIAutomationElement5 interface to provide access to current and cached full descriptions.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement6
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement6 extends IUIAutomationElement5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement6
     * @type {Guid}
     */
    static IID => Guid("{4780d450-8bca-4977-afa5-a4a517f555e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 108

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentFullDescription", "get_CachedFullDescription"]

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement6-get_currentfulldescription
     */
    get_CurrentFullDescription(retVal) {
        result := ComCall(108, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement6-get_cachedfulldescription
     */
    get_CachedFullDescription(retVal) {
        result := ComCall(109, this, "ptr", retVal, "HRESULT")
        return result
    }
}
