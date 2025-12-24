#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VMRGUID.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMonitorConfig interface is implemented by the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrmonitorconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMonitorConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMonitorConfig
     * @type {Guid}
     */
    static IID => Guid("{9cf0b1b6-fbaa-4b7f-88cf-cf1f130a0dce}")

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
     * On a multi-monitor system, the SetMonitor method specifies the monitor that this instance of the VMR should use for video playback.
     * @param {Pointer<VMRGUID>} pGUID Pointer to a [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure that identifies the monitor.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Invalid argument.
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
     * Success.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmonitorconfig-setmonitor
     */
    SetMonitor(pGUID) {
        result := ComCall(3, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * The GetMonitor method retrieves the monitor that this instance of the VMR is using for video playback.
     * @returns {VMRGUID} Pointer to a [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure allocated by the caller. The method fills this structure with a GUID that identifies the monitor.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmonitorconfig-getmonitor
     */
    GetMonitor() {
        pGUID := VMRGUID()
        result := ComCall(4, this, "ptr", pGUID, "HRESULT")
        return pGUID
    }

    /**
     * The SetDefaultMonitor method specifies the default monitor that all future instances of the VMR should use for video playback.
     * @param {Pointer<VMRGUID>} pGUID Pointer to a [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure that identifies the monitor.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Invalid argument. The specified monitor does not exist, or the pGUID parameter was not formatted correctly.
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
     * Success.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmonitorconfig-setdefaultmonitor
     */
    SetDefaultMonitor(pGUID) {
        result := ComCall(5, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * The GetDefaultMonitor method retrieves the default monitor that all future instances of the VMR will use for video playback.
     * @returns {VMRGUID} Pointer to a [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure that identifies the default monitor on the system.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmonitorconfig-getdefaultmonitor
     */
    GetDefaultMonitor() {
        pGUID := VMRGUID()
        result := ComCall(6, this, "ptr", pGUID, "HRESULT")
        return pGUID
    }

    /**
     * The GetAvailableMonitors method retrieves information about the monitors currently available on the system.
     * @param {Pointer<VMRMONITORINFO>} pInfo Pointer to an array of [VMRMONITORINFO](/windows/desktop/api/strmif/ns-strmif-vmrmonitorinfo) structures that contain information about each monitor on the system.
     * @param {Integer} dwMaxInfoArraySize Specifies the maximum number of members in the array.
     * @param {Pointer<Integer>} pdwNumDevices Pointer to a variable that receives the number of devices retrieved.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmonitorconfig-getavailablemonitors
     */
    GetAvailableMonitors(pInfo, dwMaxInfoArraySize, pdwNumDevices) {
        pdwNumDevicesMarshal := pdwNumDevices is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pInfo, "uint", dwMaxInfoArraySize, pdwNumDevicesMarshal, pdwNumDevices, "HRESULT")
        return result
    }
}
