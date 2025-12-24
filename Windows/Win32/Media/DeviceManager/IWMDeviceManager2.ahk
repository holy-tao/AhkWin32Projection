#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMDevice.ahk
#Include .\IWMDMEnumDevice.ahk
#Include .\IWMDeviceManager.ahk

/**
 * The IWMDeviceManager2 interface extends IWMDeviceManager interface.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdevicemanager2
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
     * @param {PWSTR} pwszCanonicalName A wide-character, <b>null</b>-terminated string specifying the canonical name of the device.
     * @returns {IWMDMDevice} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmdevice">IWMDMDevice</a> interface of the device object with the specified canonical name. The caller must release this interface when done with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdevicemanager2-getdevicefromcanonicalname
     */
    GetDeviceFromCanonicalName(pwszCanonicalName) {
        pwszCanonicalName := pwszCanonicalName is String ? StrPtr(pwszCanonicalName) : pwszCanonicalName

        result := ComCall(6, this, "ptr", pwszCanonicalName, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMDMDevice(ppDevice)
    }

    /**
     * The EnumDevices2 method retrieves an enumeration interface that is used to enumerate portable devices connected to the computer.
     * @returns {IWMDMEnumDevice} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumdevice">IWMDMEnumDevice</a> interface. The caller is responsible for calling <b>Release</b> on the retrieved interface.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdevicemanager2-enumdevices2
     */
    EnumDevices2() {
        result := ComCall(7, this, "ptr*", &ppEnumDevice := 0, "HRESULT")
        return IWMDMEnumDevice(ppEnumDevice)
    }

    /**
     * The Reinitialize method forces Windows Media Device Manager to rediscover all the Windows Media Device Manager devices.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdevicemanager2-reinitialize
     */
    Reinitialize() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
