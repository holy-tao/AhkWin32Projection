#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that enables child elements to be arranged horizontally and vertically, relative to each other.
 * @remarks
 * 
  * Microsoft UI Automation client applications use this interface to access the dock properties of UI Automation elements that function as controls within a docking container. A docking container is a control that allows the arrangement of child elements, both horizontally and vertically, relative to the boundaries of the docking container and other elements within the container. Controls are docked relative to each other based on their current z-order; the higher their z-order placement the farther they are placed from the specified edge of the docking container.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationdockpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationDockPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationDockPattern
     * @type {Guid}
     */
    static IID => Guid("{fde5ef97-1464-48f6-90bf-43d0948e86ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDockPosition", "get_CurrentDockPosition", "get_CachedDockPosition"]

    /**
     * 
     * @param {Integer} dockPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-setdockposition
     */
    SetDockPosition(dockPos) {
        result := ComCall(3, this, "int", dockPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-get_currentdockposition
     */
    get_CurrentDockPosition(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-get_cacheddockposition
     */
    get_CachedDockPosition(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, retValMarshal, retVal, "HRESULT")
        return result
    }
}
