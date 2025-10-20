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
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentLandmarkType(retVal) {
        result := ComCall(104, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentLocalizedLandmarkType(retVal) {
        result := ComCall(105, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedLandmarkType(retVal) {
        result := ComCall(106, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedLocalizedLandmarkType(retVal) {
        result := ComCall(107, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
