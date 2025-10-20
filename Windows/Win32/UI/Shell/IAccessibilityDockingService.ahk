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
     * 
     * @param {HMONITOR} hMonitor 
     * @param {Pointer<UInt32>} pcxFixed 
     * @param {Pointer<UInt32>} pcyMax 
     * @returns {HRESULT} 
     */
    GetAvailableSize(hMonitor, pcxFixed, pcyMax) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(3, this, "ptr", hMonitor, "uint*", pcxFixed, "uint*", pcyMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HMONITOR} hMonitor 
     * @param {Integer} cyRequested 
     * @param {Pointer<IAccessibilityDockingServiceCallback>} pCallback 
     * @returns {HRESULT} 
     */
    DockWindow(hwnd, hMonitor, cyRequested, pCallback) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", hwnd, "ptr", hMonitor, "uint", cyRequested, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    UndockWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
