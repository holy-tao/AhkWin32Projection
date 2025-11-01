#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves the device associated with a service and the list of services found on a device.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemanager
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceServiceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceServiceManager
     * @type {Guid}
     */
    static IID => Guid("{a8abc4e9-a84a-47a9-80b3-c5d9b172a961}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceServices", "GetDeviceForService"]

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {Pointer<Guid>} guidServiceCategory 
     * @param {Pointer<PWSTR>} pServices 
     * @param {Pointer<Integer>} pcServices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemanager-getdeviceservices
     */
    GetDeviceServices(pszPnPDeviceID, guidServiceCategory, pServices, pcServices) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID

        result := ComCall(3, this, "ptr", pszPnPDeviceID, "ptr", guidServiceCategory, "ptr", pServices, "uint*", pcServices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPServiceID 
     * @param {Pointer<PWSTR>} ppszPnPDeviceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemanager-getdeviceforservice
     */
    GetDeviceForService(pszPnPServiceID, ppszPnPDeviceID) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(4, this, "ptr", pszPnPServiceID, "ptr", ppszPnPDeviceID, "HRESULT")
        return result
    }
}
