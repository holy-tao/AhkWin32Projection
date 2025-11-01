#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to an element in a docking container.
 * @remarks
 * 
  * <b>IDockProvider</b> does not expose any properties of the docking 
  *         container or any properties of controls that might be docked adjacent to the current 
  *         control in the docking container.
  *         
  * 
  * Controls are docked relative to each other based on their current z-order; 
  *         the higher their z-order placement, the farther they are placed from the specified edge of the docking container.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-idockprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IDockProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDockProvider
     * @type {Guid}
     */
    static IID => Guid("{159bc72c-4ad3-485e-9637-d7052edf0146}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDockPosition", "get_DockPosition"]

    /**
     * 
     * @param {Integer} dockPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idockprovider-setdockposition
     */
    SetDockPosition(dockPosition) {
        result := ComCall(3, this, "int", dockPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idockprovider-get_dockposition
     */
    get_DockPosition(pRetVal) {
        result := ComCall(4, this, "int*", pRetVal, "HRESULT")
        return result
    }
}
