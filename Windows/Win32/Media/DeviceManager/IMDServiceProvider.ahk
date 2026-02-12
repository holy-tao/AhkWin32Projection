#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPEnumDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDServiceProvider interface is the initial interface that Windows Media Device Manager uses to connect to your service provider.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-imdserviceprovider
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDServiceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a10-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceCount", "EnumDevices"]

    /**
     * The GetDeviceCount method returns the number of installed physical or software devices that are currently attached and are known by the service provider.
     * @remarks
     * The service provider should return only the number of supported devices that are currently attached to the computer.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the count of known devices.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdserviceprovider-getdevicecount
     */
    GetDeviceCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdserviceprovider-enumdevices
     */
    EnumDevices() {
        result := ComCall(4, this, "ptr*", &ppEnumDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPEnumDevice(ppEnumDevice)
    }
}
