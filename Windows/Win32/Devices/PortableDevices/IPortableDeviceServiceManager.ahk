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
     * Retrieves a list of the services associated with the specified device.
     * @param {PWSTR} pszPnPDeviceID The Plug and Play (PnP) identifier of the device.
     * @param {Pointer<Guid>} guidServiceCategory A reference to a globally unique identifier (GUID) that specifies the category of services to retrieve. If the  referenced identifier is <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/device-interface-guids">GUID_DEVINTERFACE_WPD_SERVICE</a>, this method will retrieve all services supported by the device.
     * @param {Pointer<PWSTR>} pServices A user-allocated array of pointers to strings. When the method returns, the array contains the retrieved PnP service identifiers.
     * @param {Pointer<Integer>} pcServices The number of elements in the array specified by the <i>pServices</i> parameter. This value represents the maximum number of service identifiers that will be retrieved. When the method returns,  this parameter contains the number of identifiers actually retrieved.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array referenced by the <i>pServices</i> parameter was too small to contain all of the services.
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
     * The <i>pcServices</i> parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemanager-getdeviceservices
     */
    GetDeviceServices(pszPnPDeviceID, guidServiceCategory, pServices, pcServices) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID

        pServicesMarshal := pServices is VarRef ? "ptr*" : "ptr"
        pcServicesMarshal := pcServices is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszPnPDeviceID, "ptr", guidServiceCategory, pServicesMarshal, pServices, pcServicesMarshal, pcServices, "HRESULT")
        return result
    }

    /**
     * Retrieves the device associated with the specified service.
     * @param {PWSTR} pszPnPServiceID The Plug and Play (PnP) identifier of the service.
     * @returns {PWSTR} The retrieved PnP identifier of the device associated with the service.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemanager-getdeviceforservice
     */
    GetDeviceForService(pszPnPServiceID) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(4, this, "ptr", pszPnPServiceID, "ptr*", &ppszPnPDeviceID := 0, "HRESULT")
        return ppszPnPDeviceID
    }
}
