#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} dwRegisterType 
     * @param {Pointer<Byte>} pbCertificate 
     * @param {Integer} cbCertificate 
     * @param {DRM_VAL16} SerialNumber 
     * @param {Pointer<IWMRegisteredDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    RegisterDevice(dwRegisterType, pbCertificate, cbCertificate, SerialNumber, ppDevice) {
        result := ComCall(3, this, "uint", dwRegisterType, "char*", pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRegisterType 
     * @param {Pointer<Byte>} pbCertificate 
     * @param {Integer} cbCertificate 
     * @param {DRM_VAL16} SerialNumber 
     * @returns {HRESULT} 
     */
    UnregisterDevice(dwRegisterType, pbCertificate, cbCertificate, SerialNumber) {
        result := ComCall(4, this, "uint", dwRegisterType, "char*", pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRegisterType 
     * @param {Pointer<UInt32>} pcRegisteredDevices 
     * @returns {HRESULT} 
     */
    GetRegistrationStats(dwRegisterType, pcRegisteredDevices) {
        result := ComCall(5, this, "uint", dwRegisterType, "uint*", pcRegisteredDevices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRegisterType 
     * @param {Pointer<IWMRegisteredDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    GetFirstRegisteredDevice(dwRegisterType, ppDevice) {
        result := ComCall(6, this, "uint", dwRegisterType, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMRegisteredDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    GetNextRegisteredDevice(ppDevice) {
        result := ComCall(7, this, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRegisterType 
     * @param {Pointer<Byte>} pbCertificate 
     * @param {Integer} cbCertificate 
     * @param {DRM_VAL16} SerialNumber 
     * @param {Pointer<IWMRegisteredDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    GetRegisteredDeviceByID(dwRegisterType, pbCertificate, cbCertificate, SerialNumber, ppDevice) {
        result := ComCall(8, this, "uint", dwRegisterType, "char*", pbCertificate, "uint", cbCertificate, "ptr", SerialNumber, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
