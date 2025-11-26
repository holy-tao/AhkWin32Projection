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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AppVisibilityOnMonitorChanged", "LauncherVisibilityChange"]

    /**
     * Notifies a client that the mode of a display has changed.
     * @param {HMONITOR} hMonitor The display that has a changing mode.
     * @param {Integer} previousMode The previous mode of <i>hMonitor</i>, which may be <b>MAV_UNKNOWN</b>  if the client was unaware of the display previously.
     * @param {Integer} currentMode The current mode of <i>hMonitor</i>, which will not be <b>MAV_UNKNOWN</b>.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iappvisibilityevents-appvisibilityonmonitorchanged
     */
    AppVisibilityOnMonitorChanged(hMonitor, previousMode, currentMode) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(3, this, "ptr", hMonitor, "int", previousMode, "int", currentMode, "HRESULT")
        return result
    }

    /**
     * Notifies a client that visibility of the Start screen has changed.
     * @param {BOOL} currentVisibleState <b>TRUE</b> if the Start screen is displayed; otherwise, <b>FALSE.</b>
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iappvisibilityevents-launchervisibilitychange
     */
    LauncherVisibilityChange(currentVisibleState) {
        result := ComCall(4, this, "int", currentVisibleState, "HRESULT")
        return result
    }
}
