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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectForChild", "GetIAccessiblePair", "GetRuntimeId", "ConvertReturnedElement"]

    /**
     * 
     * @param {Integer} idChild 
     * @param {Pointer<IAccessibleEx>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessibleex-getobjectforchild
     */
    GetObjectForChild(idChild, pRetVal) {
        result := ComCall(3, this, "int", idChild, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAccessible>} ppAcc 
     * @param {Pointer<Integer>} pidChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessibleex-getiaccessiblepair
     */
    GetIAccessiblePair(ppAcc, pidChild) {
        pidChildMarshal := pidChild is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr*", ppAcc, pidChildMarshal, pidChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessibleex-getruntimeid
     */
    GetRuntimeId(pRetVal) {
        result := ComCall(5, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRawElementProviderSimple} pIn 
     * @param {Pointer<IAccessibleEx>} ppRetValOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessibleex-convertreturnedelement
     */
    ConvertReturnedElement(pIn, ppRetValOut) {
        result := ComCall(6, this, "ptr", pIn, "ptr*", ppRetValOut, "HRESULT")
        return result
    }
}
