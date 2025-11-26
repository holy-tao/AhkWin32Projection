#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMRegisteredDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDeviceRegistration interface registers playback devices for secure data delivery.You can create a device registration object and retrieve a pointer to its IWMDeviceRegistration interface by calling the WMCreateDeviceRegistration function.
 * @remarks
 * 
 * The primary purpose of the device registration database is to store data about connected devices that can receive streaming media encoded for the Windows Media DRM 10 for Network Devices protocol. You can enter other devices in the database if desired.
 * 
 * The device registration database is a secure database on the client computer. All interactions with the database are managed internally; your application does not have direct access to it.
 * 
 * The same device registration database is used by all applications.
 * 
 * Devices in the database are registered by type. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type. Other types may be supported in future versions.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdeviceregistration
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDeviceRegistration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDeviceRegistration
     * @type {Guid}
     */
    static IID => Guid("{f6211f03-8d21-4e94-93e6-8510805f2d99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDevice", "UnregisterDevice", "GetRegistrationStats", "GetFirstRegisteredDevice", "GetNextRegisteredDevice", "GetRegisteredDeviceByID"]

    /**
     * The RegisterDevice method adds a device to the device list.
     * @param {Integer} dwRegisterType The type of the device to register. Devices that support Windows Media DRM 10 for Network Devices use DRM_DEVICE_REGISTER_TYPE_STREAMING. To register a device that does not use Windows Media DRM 10 for Network Devices, set this parameter to 0.
     * @param {Pointer<Integer>} pbCertificate Address of the device certificate in memory.
     * @param {Integer} cbCertificate The size of the certificate data in bytes.
     * @param {DRM_VAL16} SerialNumber 128-bit device identifier, stored in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_val16">DRM_VAL16</a> structure.
     * @returns {IWMRegisteredDevice} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice">IWMRegisteredDevice</a> interface of the newly registered device.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-registerdevice
     */
    RegisterDevice(dwRegisterType, pbCertificate, cbCertificate, SerialNumber) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwRegisterType, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMRegisteredDevice(ppDevice)
    }

    /**
     * The UnregisterDevice method removes a device from the device registration database.
     * @param {Integer} dwRegisterType <b>DWORD</b> containing the type of the device to remove. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type.
     * @param {Pointer<Integer>} pbCertificate Address of the device certificate in memory.
     * @param {Integer} cbCertificate The size of the certificate data in bytes.
     * @param {DRM_VAL16} SerialNumber 128-bit device identifier, stored in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_val16">DRM_VAL16</a> structure.
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
     * The <i>pbCertificate</i> parameter is <b>NULL</b>, but the <i>cbCertificate</i> parameter is greater than zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-unregisterdevice
     */
    UnregisterDevice(dwRegisterType, pbCertificate, cbCertificate, SerialNumber) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", dwRegisterType, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "HRESULT")
        return result
    }

    /**
     * The GetRegistrationStats method retrieves the number of devices in the device registration database that have a specified type.
     * @param {Integer} dwRegisterType The type of the device for which to retrieve the count. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type.
     * @returns {Integer} Address of a variable that receives the number of registered devices of the specified type.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getregistrationstats
     */
    GetRegistrationStats(dwRegisterType) {
        result := ComCall(5, this, "uint", dwRegisterType, "uint*", &pcRegisteredDevices := 0, "HRESULT")
        return pcRegisteredDevices
    }

    /**
     * The GetFirstRegisteredDevice method retrieves information about the first device of a specified type that is in the device registration database.
     * @param {Integer} dwRegisterType The type of device for which to retrieve information. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type.
     * @returns {IWMRegisteredDevice} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice">IWMRegisteredDevice</a> interface. This interface provides access to information about the first registered device in the database that matches the type specified by <i>dwRegisterType</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getfirstregistereddevice
     */
    GetFirstRegisteredDevice(dwRegisterType) {
        result := ComCall(6, this, "uint", dwRegisterType, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMRegisteredDevice(ppDevice)
    }

    /**
     * The GetNextRegisteredDevice method enumerates the registered devices of a specified type.
     * @returns {IWMRegisteredDevice} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice">IWMRegisteredDevice</a> interface. This interface provides access to information about a registered device in the database that matches the type specified by the <i>dwRegisterType</i> parameter used in the call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getfirstregistereddevice">GetFirstRegisteredDevice</a>. The information applies to the next device in the list (after the device retrieved previously).
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getnextregistereddevice
     */
    GetNextRegisteredDevice() {
        result := ComCall(7, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMRegisteredDevice(ppDevice)
    }

    /**
     * The GetRegisteredDeviceByID method retrieves information about a registered device by the device identifier.
     * @param {Integer} dwRegisterType The type of the device for which to retrieve information. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type.
     * @param {Pointer<Integer>} pbCertificate Address of the device certificate in memory.
     * @param {Integer} cbCertificate The size of the certificate data in bytes.
     * @param {DRM_VAL16} SerialNumber 128-bit device identifier, stored in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_val16">DRM_VAL16</a> structure.
     * @returns {IWMRegisteredDevice} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice">IWMRegisteredDevice</a> interface. This interface provides access to information about the registered device in the list that matches the other identifying parameters.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getregistereddevicebyid
     */
    GetRegisteredDeviceByID(dwRegisterType, pbCertificate, cbCertificate, SerialNumber) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", dwRegisterType, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMRegisteredDevice(ppDevice)
    }
}
