#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMDevice.ahk
#Include .\IWMDMEnumDevice.ahk
#Include .\IWMDeviceManager.ahk

/**
 * The IWMDeviceManager2 interface extends IWMDeviceManager interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-iwmdevicemanager2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDeviceManager2 extends IWMDeviceManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDeviceManager2
     * @type {Guid}
     */
    static IID => Guid("{923e5249-8731-4c5b-9b1c-b8b60b6e46af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceFromCanonicalName", "EnumDevices2", "Reinitialize"]

    /**
     * The GetDeviceFromCanonicalName method retrieves an IWMDMDevice interface for a device with a specified canonical name. You can retrieve a device's canonical name by calling IWMDMDevice2::GetCanonicalName.
     * @remarks
     * This method can be useful if an application implements <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmnotification">IWMDMNotification</a>, which sends a canonical name notification when a device connects or disconnects from the computer.
     * @param {PWSTR} pwszCanonicalName A wide-character, <b>null</b>-terminated string specifying the canonical name of the device.
     * @returns {IWMDMDevice} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmdevice">IWMDMDevice</a> interface of the device object with the specified canonical name. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdevicemanager2-getdevicefromcanonicalname
     */
    GetDeviceFromCanonicalName(pwszCanonicalName) {
        pwszCanonicalName := pwszCanonicalName is String ? StrPtr(pwszCanonicalName) : pwszCanonicalName

        result := ComCall(6, this, "ptr", pwszCanonicalName, "ptr*", &ppDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMDMDevice(ppDevice)
    }

    /**
     * The EnumDevices2 method retrieves an enumeration interface that is used to enumerate portable devices connected to the computer.
     * @remarks
     * This method returns an enumerator that takes advantage of the Plug and Play (PnP) system for a faster enumeration and lower memory use. For PnP-complaint service providers, it loads in memory only those service providers that have a device currently connected to the computer, and requests only those service providers to create device objects.
     * 
     * This method returns a snapshot of the devices connected when the underlying object was first created. To ensure that the device list is up to date, call <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdevicemanager2-reinitialize">Reinitialize</a> before calling this method.
     * @returns {IWMDMEnumDevice} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumdevice">IWMDMEnumDevice</a> interface. The caller is responsible for calling <b>Release</b> on the retrieved interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdevicemanager2-enumdevices2
     */
    EnumDevices2() {
        result := ComCall(7, this, "ptr*", &ppEnumDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMDMEnumDevice(ppEnumDevice)
    }

    /**
     * The Reinitialize method forces Windows Media Device Manager to rediscover all the Windows Media Device Manager devices.
     * @remarks
     * Windows Media Device Manager monitors Plug and Play (PnP) notifications to keep track of connected devices which are controlled by a PnP-compliant service provider. If a non-compliant device is plugged in or some other changes are made to a device for which the device does not generate PnP notifications (for example, insertion or removal of a storage card), the application should call this method before calling <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdevicemanager2-enumdevices2">IWMDeviceManager2::EnumDevices2</a>. The application would typically do this on a refresh request from the user.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdevicemanager2-reinitialize
     */
    Reinitialize() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
