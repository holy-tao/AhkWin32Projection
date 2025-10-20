#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDeviceManager.ahk

/**
 * The IWMDeviceManager2 interface extends IWMDeviceManager interface.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdevicemanager2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDeviceManager2 extends IWMDeviceManager{
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
     * 
     * @param {PWSTR} pwszCanonicalName 
     * @param {Pointer<IWMDMDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    GetDeviceFromCanonicalName(pwszCanonicalName, ppDevice) {
        pwszCanonicalName := pwszCanonicalName is String ? StrPtr(pwszCanonicalName) : pwszCanonicalName

        result := ComCall(6, this, "ptr", pwszCanonicalName, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMEnumDevice>} ppEnumDevice 
     * @returns {HRESULT} 
     */
    EnumDevices2(ppEnumDevice) {
        result := ComCall(7, this, "ptr", ppEnumDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reinitialize() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
