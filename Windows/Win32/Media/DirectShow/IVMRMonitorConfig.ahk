#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VMRMONITORINFO.ahk" { VMRMONITORINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VMRGUID.ahk" { VMRGUID }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRMonitorConfig interface is implemented by the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrmonitorconfig
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRMonitorConfig extends IUnknown {
    /**
     * The interface identifier for IVMRMonitorConfig
     * @type {Guid}
     */
    static IID := Guid("{9cf0b1b6-fbaa-4b7f-88cf-cf1f130a0dce}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRMonitorConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMonitor           : IntPtr
        GetMonitor           : IntPtr
        SetDefaultMonitor    : IntPtr
        GetDefaultMonitor    : IntPtr
        GetAvailableMonitors : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRMonitorConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * On a multi-monitor system, the SetMonitor method specifies the monitor that this instance of the VMR should use for video playback.
     * @remarks
     * Use this method on a multi-monitor system to specify to the VMR which DirectDraw driver should be used when connecting to an upstream decoder filter.
     * 
     * The <b>pGUID</b> member of the VMRGUID structure must be either <b>NULL</b>, indicating the default DirectDraw device, or equal to the address of the <b>GUID</b> member of the <b>VMRGUID</b> structure. Otherwise, the method returns E_INVALIDARG.
     * 
     * If the specified GUID does not correspond to any monitor, the method return E_INVALIDARG.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-setmonitor
     */
    SetMonitor(pGUID) {
        result := ComCall(3, this, VMRGUID.Ptr, pGUID, "HRESULT")
        return result
    }

    /**
     * The GetMonitor method retrieves the monitor that this instance of the VMR is using for video playback.
     * @returns {VMRGUID} Pointer to a [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure allocated by the caller. The method fills this structure with a GUID that identifies the monitor.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-getmonitor
     */
    GetMonitor() {
        pGUID := VMRGUID()
        result := ComCall(4, this, VMRGUID.Ptr, pGUID, "HRESULT")
        return pGUID
    }

    /**
     * The SetDefaultMonitor method specifies the default monitor that all future instances of the VMR should use for video playback.
     * @remarks
     * Use this method on a multi-monitor system to specify to the VMR the default DirectDraw device to use when connecting to an upstream filter. The default DirectDraw device can be overridden for a particular connection by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrmonitorconfig-setmonitor">SetMonitor</a> method.
     * 
     * The <b>pGUID</b> member of the VMRGUID structure must be either <b>NULL</b>, indicating the default DirectDraw device, or equal to the address of the <b>GUID</b> member of the <b>VMRGUID</b> structure. Otherwise, the method returns E_INVALIDARG.
     * 
     * If the specified GUID does not correspond to any monitor, the method return E_INVALIDARG.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-setdefaultmonitor
     */
    SetDefaultMonitor(pGUID) {
        result := ComCall(5, this, VMRGUID.Ptr, pGUID, "HRESULT")
        return result
    }

    /**
     * The GetDefaultMonitor method retrieves the default monitor that all future instances of the VMR will use for video playback.
     * @remarks
     * Use this method on a multi-monitor system to determine which is the default DirectDraw device the VMR will use when connecting to an upstream filter.
     * @returns {VMRGUID} Pointer to a [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure that identifies the default monitor on the system.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-getdefaultmonitor
     */
    GetDefaultMonitor() {
        pGUID := VMRGUID()
        result := ComCall(6, this, VMRGUID.Ptr, pGUID, "HRESULT")
        return pGUID
    }

    /**
     * The GetAvailableMonitors method retrieves information about the monitors currently available on the system.
     * @remarks
     * Use this method to get a list of DirectDraw device GUIDs and their associated monitor information that the VMR can use when connecting to an upstream decoder filter. To return the required array size in the <i>pdwNumDevices</i> parameter, specify <b>NULL</b> for <i>pInfo</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-getavailablemonitors
     */
    GetAvailableMonitors(pInfo, dwMaxInfoArraySize, pdwNumDevices) {
        pdwNumDevicesMarshal := pdwNumDevices is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, VMRMONITORINFO.Ptr, pInfo, "uint", dwMaxInfoArraySize, pdwNumDevicesMarshal, pdwNumDevices, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRMonitorConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMonitor := CallbackCreate(GetMethod(implObj, "SetMonitor"), flags, 2)
        this.vtbl.GetMonitor := CallbackCreate(GetMethod(implObj, "GetMonitor"), flags, 2)
        this.vtbl.SetDefaultMonitor := CallbackCreate(GetMethod(implObj, "SetDefaultMonitor"), flags, 2)
        this.vtbl.GetDefaultMonitor := CallbackCreate(GetMethod(implObj, "GetDefaultMonitor"), flags, 2)
        this.vtbl.GetAvailableMonitors := CallbackCreate(GetMethod(implObj, "GetAvailableMonitors"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMonitor)
        CallbackFree(this.vtbl.GetMonitor)
        CallbackFree(this.vtbl.SetDefaultMonitor)
        CallbackFree(this.vtbl.GetDefaultMonitor)
        CallbackFree(this.vtbl.GetAvailableMonitors)
    }
}
