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
     * @type {Integer} 
     */
    CurrentDockPosition {
        get => this.get_CurrentDockPosition()
    }

    /**
     * @type {Integer} 
     */
    CachedDockPosition {
        get => this.get_CachedDockPosition()
    }

    /**
     * Sets the dock position of this element.
     * @param {Integer} dockPos 
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-setdockposition
     */
    SetDockPosition(dockPos) {
        result := ComCall(3, this, "int", dockPos, "HRESULT")
        return result
    }

    /**
     * Retrieves the dock position of this element within its docking container.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-get_currentdockposition
     */
    get_CurrentDockPosition() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached dock position of this element within its docking container.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-get_cacheddockposition
     */
    get_CachedDockPosition() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
