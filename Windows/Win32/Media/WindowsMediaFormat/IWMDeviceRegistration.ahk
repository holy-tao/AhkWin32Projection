#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMRegisteredDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDeviceRegistration interface registers playback devices for secure data delivery.You can create a device registration object and retrieve a pointer to its IWMDeviceRegistration interface by calling the WMCreateDeviceRegistration function.
 * @remarks
 * The primary purpose of the device registration database is to store data about connected devices that can receive streaming media encoded for the Windows Media DRM 10 for Network Devices protocol. You can enter other devices in the database if desired.
 * 
 * The device registration database is a secure database on the client computer. All interactions with the database are managed internally; your application does not have direct access to it.
 * 
 * The same device registration database is used by all applications.
 * 
 * Devices in the database are registered by type. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type. Other types may be supported in future versions.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmdeviceregistration
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
     * @remarks
     * Registration is triggered by a registration request message sent to your application by the device. When you receive this message, you must first extract the certificate and device identifier from it by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parseregistrationreqmsg">IWMDRMMessageParser::ParseRegistrationReqMsg</a>. After parsing the message, pass the certificate and device identifier to this method.
     * 
     * After you register a device, you must perform proximity detection before sending any protected media data to it.
     * 
     * The DRM_DEVICE_REGISTER_TYPE_STORAGE register type is defined, but is not used in this release.
     * @param {Integer} dwRegisterType The type of the device to register. Devices that support Windows Media DRM 10 for Network Devices use DRM_DEVICE_REGISTER_TYPE_STREAMING. To register a device that does not use Windows Media DRM 10 for Network Devices, set this parameter to 0.
     * @param {Pointer<Integer>} pbCertificate Address of the device certificate in memory.
     * @param {Integer} cbCertificate The size of the certificate data in bytes.
     * @param {DRM_VAL16} SerialNumber 128-bit device identifier, stored in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_val16">DRM_VAL16</a> structure.
     * @returns {IWMRegisteredDevice} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice">IWMRegisteredDevice</a> interface of the newly registered device.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-registerdevice
     */
    RegisterDevice(dwRegisterType, pbCertificate, cbCertificate, SerialNumber) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwRegisterType, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "ptr*", &ppDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMRegisteredDevice(ppDevice)
    }

    /**
     * The UnregisterDevice method removes a device from the device registration database.
     * @remarks
     * The DRM_DEVICE_REGISTER_TYPE_STORAGE register type is defined, but is not used in this release.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-unregisterdevice
     */
    UnregisterDevice(dwRegisterType, pbCertificate, cbCertificate, SerialNumber) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", dwRegisterType, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetRegistrationStats method retrieves the number of devices in the device registration database that have a specified type.
     * @remarks
     * The DRM_DEVICE_REGISTER_TYPE_STORAGE register type is defined, but is not used in this release.
     * @param {Integer} dwRegisterType The type of the device for which to retrieve the count. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type.
     * @returns {Integer} Address of a variable that receives the number of registered devices of the specified type.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getregistrationstats
     */
    GetRegistrationStats(dwRegisterType) {
        result := ComCall(5, this, "uint", dwRegisterType, "uint*", &pcRegisteredDevices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcRegisteredDevices
    }

    /**
     * The GetFirstRegisteredDevice method retrieves information about the first device of a specified type that is in the device registration database.
     * @remarks
     * To enumerate registered devices of a given type, begin by calling this method to retrieve the first device entry. Then make repeated calls to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getnextregistereddevice">GetNextRegisteredDevice</a> to get subsequent device entries from the database.
     * 
     * The DRM_DEVICE_REGISTER_TYPE_STORAGE register type is defined, but is not used in this release.
     * @param {Integer} dwRegisterType The type of device for which to retrieve information. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type.
     * @returns {IWMRegisteredDevice} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice">IWMRegisteredDevice</a> interface. This interface provides access to information about the first registered device in the database that matches the type specified by <i>dwRegisterType</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getfirstregistereddevice
     */
    GetFirstRegisteredDevice(dwRegisterType) {
        result := ComCall(6, this, "uint", dwRegisterType, "ptr*", &ppDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMRegisteredDevice(ppDevice)
    }

    /**
     * The GetNextRegisteredDevice method enumerates the registered devices of a specified type.
     * @remarks
     * To enumerate registered devices of a given type, begin by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getfirstregistereddevice">GetFirstRegisteredDevice</a> to retrieve the first device. Then make repeated calls to this method to get subsequent devices from the list. After all devices of the specified types have been retrieved, the next call to <b>GetNextRegisteredDevice</b> returns S_FALSE and the address pointed to by <i>ppDevice</i> is set to <b>NULL</b>.
     * @returns {IWMRegisteredDevice} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice">IWMRegisteredDevice</a> interface. This interface provides access to information about a registered device in the database that matches the type specified by the <i>dwRegisterType</i> parameter used in the call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getfirstregistereddevice">GetFirstRegisteredDevice</a>. The information applies to the next device in the list (after the device retrieved previously).
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getnextregistereddevice
     */
    GetNextRegisteredDevice() {
        result := ComCall(7, this, "ptr*", &ppDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMRegisteredDevice(ppDevice)
    }

    /**
     * The GetRegisteredDeviceByID method retrieves information about a registered device by the device identifier.
     * @remarks
     * When your application receives messages from a device, you can use the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmdrmmessageparser">IWMDRMMessageParser</a> interface to extract the device certificate and device identifier. You can identify the device by using that data as inputs to this method.
     * 
     * The DRM_DEVICE_REGISTER_TYPE_STORAGE register type is defined, but is not used in this release.
     * @param {Integer} dwRegisterType The type of the device for which to retrieve information. Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type.
     * @param {Pointer<Integer>} pbCertificate Address of the device certificate in memory.
     * @param {Integer} cbCertificate The size of the certificate data in bytes.
     * @param {DRM_VAL16} SerialNumber 128-bit device identifier, stored in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_val16">DRM_VAL16</a> structure.
     * @returns {IWMRegisteredDevice} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice">IWMRegisteredDevice</a> interface. This interface provides access to information about the registered device in the list that matches the other identifying parameters.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdeviceregistration-getregistereddevicebyid
     */
    GetRegisteredDeviceByID(dwRegisterType, pbCertificate, cbCertificate, SerialNumber) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", dwRegisterType, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "ptr*", &ppDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMRegisteredDevice(ppDevice)
    }
}
