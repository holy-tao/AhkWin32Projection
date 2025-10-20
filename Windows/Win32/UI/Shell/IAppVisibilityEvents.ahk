#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables applications to receive notifications of state changes in a display and of changes in Start screen visibility.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iappvisibilityevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAppVisibilityEvents extends IUnknown{
    /**
     * The interface identifier for IAppVisibilityEvents
     * @type {Guid}
     */
    static IID => Guid("{6584ce6b-7d82-49c2-89c9-c6bc02ba8c38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HMONITOR} hMonitor 
     * @param {Integer} previousMode 
     * @param {Integer} currentMode 
     * @returns {HRESULT} 
     */
    AppVisibilityOnMonitorChanged(hMonitor, previousMode, currentMode) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(3, this, "ptr", hMonitor, "int", previousMode, "int", currentMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} currentVisibleState 
     * @returns {HRESULT} 
     */
    LauncherVisibilityChange(currentVisibleState) {
        result := ComCall(4, this, "int", currentVisibleState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
