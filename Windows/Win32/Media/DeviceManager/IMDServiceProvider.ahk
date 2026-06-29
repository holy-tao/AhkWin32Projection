#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMDSPEnumDevice.ahk" { IMDSPEnumDevice }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMDServiceProvider interface is the initial interface that Windows Media Device Manager uses to connect to your service provider.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdserviceprovider
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDServiceProvider extends IUnknown {
    /**
     * The interface identifier for IMDServiceProvider
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a10-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDServiceProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDeviceCount : IntPtr
        EnumDevices    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDServiceProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDeviceCount method returns the number of installed physical or software devices that are currently attached and are known by the service provider.
     * @remarks
     * The service provider should return only the number of supported devices that are currently attached to the computer.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the count of known devices.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdserviceprovider-getdevicecount
     */
    GetDeviceCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The EnumDevices method enumerates the installed physical or software devices that are currently attached and are known by the service provider.
     * @remarks
     * This method is called on service providers that are not registered as Plug and Play aware (see <a href="https://docs.microsoft.com/windows/desktop/WMDM/enabling-pnp-for-devices">Enabling PnP for Devices</a> and <a href="https://docs.microsoft.com/windows/desktop/WMDM/enumerating-devices-service-provider">Enumerating Devices</a> for details). A service provider should return only the enumerator, which will enumerate only the devices that are currently attached to the computer and are supported by the service provider.
     * 
     * This method will be called only when an application starts, or when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdevicemanager2-reinitialize">IWMDeviceManager2::Reinitialize</a>.
     * 
     * At present, Windows Media Device Manager does not support returning installed devices.
     * 
     * The service provider cannot alert the application when devices connect or disconnect from the computer. If a Plug and Play device connects or disconnects and an application implements <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmnotification">IWMDMNotification</a>, then Windows Media Device Manager will send a notification to the application.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {IMDSPEnumDevice} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspenumdevice">IMDSPEnumDevice</a> interface. If the service provider implements <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdserviceprovider2-createdevice">IMDServiceProvider2::CreateDevice</a>, this enumerator should only enumerate non-Plug and Play devices.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdserviceprovider-enumdevices
     */
    EnumDevices() {
        result := ComCall(4, this, "ptr*", &ppEnumDevice := 0, "HRESULT")
        return IMDSPEnumDevice(ppEnumDevice)
    }

    Query(iid) {
        if (IMDServiceProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceCount := CallbackCreate(GetMethod(implObj, "GetDeviceCount"), flags, 2)
        this.vtbl.EnumDevices := CallbackCreate(GetMethod(implObj, "EnumDevices"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceCount)
        CallbackFree(this.vtbl.EnumDevices)
    }
}
