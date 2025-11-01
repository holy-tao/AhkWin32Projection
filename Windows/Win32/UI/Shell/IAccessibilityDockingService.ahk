#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Docks an application window to the bottom of a monitor when a Windows Store app is visible and not snapped, or when the launcher is visible.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iaccessibilitydockingservice
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAccessibilityDockingService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccessibilityDockingService
     * @type {Guid}
     */
    static IID => Guid("{8849dc22-cedf-4c95-998d-051419dd3f76}")

    /**
     * The class identifier for AccessibilityDockingService
     * @type {Guid}
     */
    static CLSID => Guid("{29ce1d46-b481-4aa0-a08a-d3ebc8aca402}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableSize", "DockWindow", "UndockWindow"]

    /**
     * 
     * @param {HMONITOR} hMonitor 
     * @param {Pointer<Integer>} pcxFixed 
     * @param {Pointer<Integer>} pcyMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/com/iaccessibilitydockingservice-getavailablesize
     */
    GetAvailableSize(hMonitor, pcxFixed, pcyMax) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        pcxFixedMarshal := pcxFixed is VarRef ? "uint*" : "ptr"
        pcyMaxMarshal := pcyMax is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hMonitor, pcxFixedMarshal, pcxFixed, pcyMaxMarshal, pcyMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HMONITOR} hMonitor 
     * @param {Integer} cyRequested 
     * @param {IAccessibilityDockingServiceCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iaccessibilitydockingservice-dockwindow
     */
    DockWindow(hwnd, hMonitor, cyRequested, pCallback) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", hwnd, "ptr", hMonitor, "uint", cyRequested, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iaccessibilitydockingservice-undockwindow
     */
    UndockWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", hwnd, "HRESULT")
        return result
    }
}
