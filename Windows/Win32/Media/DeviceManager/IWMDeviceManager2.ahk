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
     * 
     * @param {PWSTR} pwszCanonicalName 
     * @returns {IWMDMDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager2-getdevicefromcanonicalname
     */
    GetDeviceFromCanonicalName(pwszCanonicalName) {
        pwszCanonicalName := pwszCanonicalName is String ? StrPtr(pwszCanonicalName) : pwszCanonicalName

        result := ComCall(6, this, "ptr", pwszCanonicalName, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMDMDevice(ppDevice)
    }

    /**
     * 
     * @returns {IWMDMEnumDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager2-enumdevices2
     */
    EnumDevices2() {
        result := ComCall(7, this, "ptr*", &ppEnumDevice := 0, "HRESULT")
        return IWMDMEnumDevice(ppEnumDevice)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager2-reinitialize
     */
    Reinitialize() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
