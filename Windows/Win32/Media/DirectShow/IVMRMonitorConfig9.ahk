#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMonitorConfig9 interface is implemented by the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrmonitorconfig9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMonitorConfig9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMonitorConfig9
     * @type {Guid}
     */
    static IID => Guid("{46c2e457-8ba0-4eef-b80b-0680f0978749}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMonitor", "GetMonitor", "SetDefaultMonitor", "GetDefaultMonitor", "GetAvailableMonitors"]

    /**
     * On a multi-monitor system, the SetMonitor method specifies the monitor that the VMR should use when it creates the Direct3D device.
     * @param {Integer} uDev Index that specifies the monitor.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument; <i>uDev</i> does not correspond to a valid monitor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot set the monitor after the VMR's input pins have been connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmonitorconfig9-setmonitor
     */
    SetMonitor(uDev) {
        result := ComCall(3, this, "uint", uDev, "HRESULT")
        return result
    }

    /**
     * The GetMonitor method retrieves the monitor that this instance of the VMR is using for video playback.
     * @returns {Integer} Pointer that receives an index that identifies the monitor currently in use.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmonitorconfig9-getmonitor
     */
    GetMonitor() {
        result := ComCall(4, this, "uint*", &puDev := 0, "HRESULT")
        return puDev
    }

    /**
     * The SetDefaultMonitor method specifies the default monitor that all future instances of the VMR should use for video playback.
     * @param {Integer} uDev Index that specifies the default monitor.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not set the specified monitor as the default.
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
     * Invalid argument; <i>uDev</i> does not correspond to a valid monitor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The allocator-presenter has not been loaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmonitorconfig9-setdefaultmonitor
     */
    SetDefaultMonitor(uDev) {
        result := ComCall(5, this, "uint", uDev, "HRESULT")
        return result
    }

    /**
     * The GetDefaultMonitor method retrieves the default monitor that all future instances of the VMR will use for video playback.
     * @returns {Integer} Pointer that receives an index that identifies the default monitor on the system.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmonitorconfig9-getdefaultmonitor
     */
    GetDefaultMonitor() {
        result := ComCall(6, this, "uint*", &puDev := 0, "HRESULT")
        return puDev
    }

    /**
     * The GetAvailableMonitors method retrieves information about the monitors currently available on the system.
     * @param {Pointer<VMR9MonitorInfo>} pInfo Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9monitorinfo">VMR9MonitorInfo</a> structures that contain information about each monitor on the system.
     * @param {Integer} dwMaxInfoArraySize Specifies the maximum number of members in the array.
     * @param {Pointer<Integer>} pdwNumDevices If <i>pInfo</i> is <b>NULL</b>, this parameter receives the required array size. Otherwise, it receives the actual number of devices retrieved.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument; <i>dwMaxInfoArraySize</i> must be greater than zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmonitorconfig9-getavailablemonitors
     */
    GetAvailableMonitors(pInfo, dwMaxInfoArraySize, pdwNumDevices) {
        pdwNumDevicesMarshal := pdwNumDevices is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pInfo, "uint", dwMaxInfoArraySize, pdwNumDevicesMarshal, pdwNumDevices, "HRESULT")
        return result
    }
}
