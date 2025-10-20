#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that are called by Microsoft UI Automation to retrieve extra information about a control that supports Microsoft Active Accessibility.
 * @remarks
 * 
  * This interface can be implemented on custom controls that also implement the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface, to provide added support for UI Automation without the cost of a full UI Automation provider implementation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iaccessibleex
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccessibleEx extends IUnknown{
    /**
     * The interface identifier for IAccessibleEx
     * @type {Guid}
     */
    static IID => Guid("{f8b80ada-2c44-48d0-89be-5ff23c9cd875}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} idChild 
     * @param {Pointer<IAccessibleEx>} pRetVal 
     * @returns {HRESULT} 
     */
    GetObjectForChild(idChild, pRetVal) {
        result := ComCall(3, this, "int", idChild, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAccessible>} ppAcc 
     * @param {Pointer<Int32>} pidChild 
     * @returns {HRESULT} 
     */
    GetIAccessiblePair(ppAcc, pidChild) {
        result := ComCall(4, this, "ptr", ppAcc, "int*", pidChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pRetVal 
     * @returns {HRESULT} 
     */
    GetRuntimeId(pRetVal) {
        result := ComCall(5, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} pIn 
     * @param {Pointer<IAccessibleEx>} ppRetValOut 
     * @returns {HRESULT} 
     */
    ConvertReturnedElement(pIn, ppRetValOut) {
        result := ComCall(6, this, "ptr", pIn, "ptr", ppRetValOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
