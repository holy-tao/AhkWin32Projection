#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDeviceEnumerator interface provides methods for enumerating multimedia device resources.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immdeviceenumerator
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDeviceEnumerator extends IUnknown{
    /**
     * The interface identifier for IMMDeviceEnumerator
     * @type {Guid}
     */
    static IID => Guid("{a95664d2-9614-4f35-a746-de8db63617e6}")

    /**
     * The class identifier for MMDeviceEnumerator
     * @type {Guid}
     */
    static CLSID => Guid("{bcde0395-e52f-467c-8e3d-c4579291692e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dataFlow 
     * @param {Integer} dwStateMask 
     * @param {Pointer<IMMDeviceCollection>} ppDevices 
     * @returns {HRESULT} 
     */
    EnumAudioEndpoints(dataFlow, dwStateMask, ppDevices) {
        result := ComCall(3, this, "int", dataFlow, "uint", dwStateMask, "ptr", ppDevices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dataFlow 
     * @param {Integer} role 
     * @param {Pointer<IMMDevice>} ppEndpoint 
     * @returns {HRESULT} 
     */
    GetDefaultAudioEndpoint(dataFlow, role, ppEndpoint) {
        result := ComCall(4, this, "int", dataFlow, "int", role, "ptr", ppEndpoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrId 
     * @param {Pointer<IMMDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    GetDevice(pwstrId, ppDevice) {
        pwstrId := pwstrId is String ? StrPtr(pwstrId) : pwstrId

        result := ComCall(5, this, "ptr", pwstrId, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMMNotificationClient>} pClient 
     * @returns {HRESULT} 
     */
    RegisterEndpointNotificationCallback(pClient) {
        result := ComCall(6, this, "ptr", pClient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMMNotificationClient>} pClient 
     * @returns {HRESULT} 
     */
    UnregisterEndpointNotificationCallback(pClient) {
        result := ComCall(7, this, "ptr", pClient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
