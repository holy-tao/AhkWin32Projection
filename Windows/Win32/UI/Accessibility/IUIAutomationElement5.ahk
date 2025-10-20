#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement4.ahk

/**
 * Extends the IUIAutomationElement4 interface to provide access to current and cached landmark data.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement5
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement5 extends IUIAutomationElement4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement5
     * @type {Guid}
     */
    static IID => Guid("{98141c1d-0d0e-4175-bbe2-6bff455842a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 104

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentLandmarkType", "get_CurrentLocalizedLandmarkType", "get_CachedLandmarkType", "get_CachedLocalizedLandmarkType"]

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement5-get_currentlandmarktype
     */
    get_CurrentLandmarkType(retVal) {
        result := ComCall(104, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement5-get_currentlocalizedlandmarktype
     */
    get_CurrentLocalizedLandmarkType(retVal) {
        result := ComCall(105, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement5-get_cachedlandmarktype
     */
    get_CachedLandmarkType(retVal) {
        result := ComCall(106, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement5-get_cachedlocalizedlandmarktype
     */
    get_CachedLocalizedLandmarkType(retVal) {
        result := ComCall(107, this, "ptr", retVal, "HRESULT")
        return result
    }
}
