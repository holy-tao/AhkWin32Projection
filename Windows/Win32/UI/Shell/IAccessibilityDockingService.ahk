#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Docks an application window to the bottom of a monitor when a Windows Store app is visible and not snapped, or when the launcher is visible.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iaccessibilitydockingservice
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
     * Gets the dimensions available for docking an accessibility window on a monitor.
     * @remarks
     * Accessibility windows can only be docked to a monitor that has at least 768 vertical screen pixels. This API will not allow such windows to be docked with a height that would cause Windows Store apps to have less than 768 vertical screen pixels.
     * @param {HMONITOR} hMonitor Specifies the monitor for which the available docking size will be retrieved.
     * @param {Pointer<Integer>} pcxFixed 
     * @param {Pointer<Integer>} pcyMax 
     * @returns {HRESULT} | Return code                                                                                                                          | Description                                                                      |
     * |--------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>                                                 | Success.<br/>                                                              |
     * | <dl> <dt>**HRESULT\_FROM\_WIN32(ERROR\_INVALID\_MONITOR\_HANDLE)**</dt> </dl> | The monitor specified by the monitor handle does not support docking.<br/> |
     * 
     * 
     * 
     *  
     * 
     * If either *puMaxHeight* or *puFixedWidth* are null, an access violation will occur.
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
     * Docks the specified window handle to the specified monitor handle.
     * @param {HWND} hwnd The accessibility application window that will be docked on the passed monitor handle.
     * @param {HMONITOR} hMonitor The monitor on which the accessibility application window will be docked.
     * @param {Integer} cyRequested TBD
     * @param {IAccessibilityDockingServiceCallback} pCallback The callback pointer on which the accessibility application will receive the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-iaccessibilitydockingservice-undockwindow">Undock</a> notification.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The window handle or monitor handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process is not a UIAcess accessibility application or the calling process does not own the window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMM_E_DOCKOCCUPIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is already another window occupying the docking space. Only one window can be docked at a time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMM_E_INSUFFICIENTHEIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested <i>uHeight</i> is larger than the maximum allowed docking height for the specified monitor. However, if this error code is being returned, it means that this monitor does support docking, though at a height indicated by a call to the <a href="https://docs.microsoft.com/windows/desktop/com/iaccessibilitydockingservice-getavailablesize">GetAvailableSize</a> method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_MONITOR_HANDLE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The monitor specified by the monitor handle does not support docking.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iaccessibilitydockingservice-dockwindow
     */
    DockWindow(hwnd, hMonitor, cyRequested, pCallback) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", hwnd, "ptr", hMonitor, "uint", cyRequested, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Undocks the specified window handle if it is currently docked.
     * @remarks
     * This method can only be used to undock windows that belong to the calling process.
     * @param {HWND} hwnd TBD
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The window does not belong to the calling process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_WINDOW_HANDLE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The window is not docked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iaccessibilitydockingservice-undockwindow
     */
    UndockWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", hwnd, "HRESULT")
        return result
    }
}
