#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a factory that can instantiate a WPD Automation Device object in a Windows Store app.
 * @remarks
 * <div class="alert"><b>Note</b>  This interface can only be used in Windows Store apps.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicewebcontrol
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceWebControl extends IDispatch {
    /**
     * The interface identifier for IPortableDeviceWebControl
     * @type {Guid}
     */
    static IID := Guid("{94fc7953-5ca1-483a-8aee-df52e7747d00}")

    /**
     * The class identifier for PortableDeviceWebControl
     * @type {Guid}
     */
    static CLSID := Guid("{186dd02c-2dec-41b5-a7d4-b59056fade51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceWebControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetDeviceFromId      : IntPtr
        GetDeviceFromIdAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceWebControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Instantiates a WPD Automation Device object for a given WPD device identifier. (IPortableDeviceWebControl.GetDeviceFromId)
     * @remarks
     * <div class="alert"><b>Note</b>  This method can only be used in Windows Store apps.</div>
     * <div> </div>
     * @param {BSTR} deviceId A <b>BSTR</b> that is used by Plug-and-play to identify a currently connected WPD device. The Plug and Play (PnP) identifier for a particular device can be obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">IPortableDeviceManager::GetDevices</a> method in the WPD C++/COM API.
     * 
     * A Windows Store app can obtain the PnP identifier of a WPD device by using <a href="https://docs.microsoft.com/uwp/api/windows.devices.portable.servicedevice.getdeviceselector">Windows.Devices.Portable.ServiceDevice.GetDeviceSelector</a> or <a href="https://docs.microsoft.com/uwp/api/windows.devices.portable.servicedevice.getdeviceselectorfromserviceid">Windows.Devices.Portable.ServiceDevice.GetDeviceSelectorFromServiceId</a> to get a selector string to pass to <a href="https://docs.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync">Windows.Devices.Enumeration.DeviceInformation.FindAllAsync</a>. <a href="https://docs.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync">FindAllAsync</a> returns a collection of <a href="https://docs.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation">DeviceInformation</a> objects that represent the currently connected  WPD devices. A <b>DeviceInformation</b> object's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-id-vb">Id</a> property is the device's PnP identifier.
     * @returns {IDispatch} Contains a pointer to the <b>IDispatch</b> implementation for the WPD Automation <a href="https://docs.microsoft.com/previous-versions/windows/desktop/wiaaut/-wiaaut-device">Device</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicewebcontrol-getdevicefromid
     */
    GetDeviceFromId(deviceId) {
        deviceId := deviceId is String ? BSTR.Alloc(deviceId).Value : deviceId

        result := ComCall(7, this, BSTR, deviceId, "ptr*", &ppDevice := 0, "HRESULT")
        return IDispatch(ppDevice)
    }

    /**
     * Instantiates a WPD Automation Device object asynchronously for a given WPD device identifier.
     * @remarks
     * <div class="alert"><b>Note</b>  This method can only be used in Windows Store apps.</div>
     * <div> </div>
     * @param {BSTR} deviceId A <b>BSTR</b> that is used by Plug-and-play to identify a currently connected WPD device. The Plug and Play (PnP) identifier for a particular device can be obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">IPortableDeviceManager::GetDevices</a> method in the WPD C++/COM API. 
     * 
     * A Windows Store app can obtain the PnP identifier of a WPD device by using <a href="https://docs.microsoft.com/uwp/api/windows.devices.portable.servicedevice.getdeviceselector">Windows.Devices.Portable.ServiceDevice.GetDeviceSelector</a> or <a href="https://docs.microsoft.com/uwp/api/windows.devices.portable.servicedevice.getdeviceselectorfromserviceid">Windows.Devices.Portable.ServiceDevice.GetDeviceSelectorFromServiceId</a> to get a selector string to pass to <a href="https://docs.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync">Windows.Devices.Enumeration.DeviceInformation.FindAllAsync</a>. <a href="https://docs.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync">FindAllAsync</a> returns a collection of <a href="https://docs.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation">DeviceInformation</a> objects that represent the currently connected  WPD devices. A <b>DeviceInformation</b> object's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-id-vb">Id</a> property is the device's PnP identifier.
     * @param {IDispatch} pCompletionHandler A completion handler.
     * @param {IDispatch} pErrorHandler An error handler.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * A call to this method outside of a Windows Store app running on Windows 8 will return this error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicewebcontrol-getdevicefromidasync
     */
    GetDeviceFromIdAsync(deviceId, pCompletionHandler, pErrorHandler) {
        deviceId := deviceId is String ? BSTR.Alloc(deviceId).Value : deviceId

        result := ComCall(8, this, BSTR, deviceId, "ptr", pCompletionHandler, "ptr", pErrorHandler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceWebControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceFromId := CallbackCreate(GetMethod(implObj, "GetDeviceFromId"), flags, 3)
        this.vtbl.GetDeviceFromIdAsync := CallbackCreate(GetMethod(implObj, "GetDeviceFromIdAsync"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceFromId)
        CallbackFree(this.vtbl.GetDeviceFromIdAsync)
    }
}
