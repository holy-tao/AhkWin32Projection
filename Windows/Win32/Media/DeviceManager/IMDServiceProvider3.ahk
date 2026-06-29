#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMDServiceProvider2.ahk" { IMDServiceProvider2 }

/**
 * The IMDServiceProvider3 interface extends the IMDServiceProvider2 interface by providing a method for setting the device enumeration preferences.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdserviceprovider3
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDServiceProvider3 extends IMDServiceProvider2 {
    /**
     * The interface identifier for IMDServiceProvider3
     * @type {Guid}
     */
    static IID := Guid("{4ed13ef3-a971-4d19-9f51-0e1826b2da57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDServiceProvider3 interfaces
    */
    struct Vtbl extends IMDServiceProvider2.Vtbl {
        SetDeviceEnumPreference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDServiceProvider3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetDeviceEnumPreference method sets the device enumeration preferences. (IMDServiceProvider3.SetDeviceEnumPreference)
     * @remarks
     * This API provides clients the ability to override the default device enumeration behavior of Windows Media Device Manager.
     * 
     * Client applications must call this method immediately after creating the device manager object by querying for the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdevicemanager">IWMDeviceManager</a> interface from Windows Media Device Manager. The call must be made before any enumeration occurs, either explicitly or implicitly as a result of another operation.
     * 
     * After a preference flag is set, it cannot be changed for the lifetime of the application (not just the lifetime of the Windows Media Device Manager object). Attempting to change a preference flag will result in an error. Calling this API again with the same flag settings does not return an error, and also does have any effect on enumeration.
     * 
     * The DO_NOT_VIRTUALIZE_STORAGES_AS_DEVICES flag has to be honored by the service provider to take effect. It is possible that, despite this flag, some devices are enumerated as a device-per-storage.
     * @param {Integer} dwEnumPref Contains a bitwise <b>OR</b> combination of one or more of the following bit values that specify enumeration preference. Each set bit enables the corresponding extended behavior, whereas the absence of that bit disables the extended behavior and specifies the default, backward-compatible enumeration behavior. The possible values for <i>dwEnumPref</i> are provided in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>DO_NOT_VIRTUALIZE_STORAGES_AS_DEVICES</td>
     * <td>By default, for devices containing multiple storage media, each of these storages enumerates as a separate pseudo-device. However, when this bit is set, storages are not visible as devices, and only devices are visible as devices.</td>
     * </tr>
     * <tr>
     * <td>ALLOW_OUTOFBAND_NOTIFICATION</td>
     * <td>By default, the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmnotification">IWMDMNotification</a> callback mechanism provides applications with device arrival and removal events. When this bit is set, the service provider is free to notify the application by a separate mechanism, such as by using a window message. This behavior is in addition to the Windows Media Device Manager notifications. This flag does not suppress Windows Media Device Manager notifications.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
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
     * The <i>dwEnumPref</i> parameter contains an unsupported bit value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_CALL_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was called after an enumeration operation. It must be called before the enumeration operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdserviceprovider3-setdeviceenumpreference
     */
    SetDeviceEnumPreference(dwEnumPref) {
        result := ComCall(6, this, "uint", dwEnumPref, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMDServiceProvider3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDeviceEnumPreference := CallbackCreate(GetMethod(implObj, "SetDeviceEnumPreference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDeviceEnumPreference)
    }
}
