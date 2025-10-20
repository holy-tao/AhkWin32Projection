#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IHardwareAudioEngineBase interface is implemented by audio endpoints for the audio stack to use to configure and retrieve information about the hardware audio engine.
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-ihardwareaudioenginebase
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IHardwareAudioEngineBase extends IUnknown{
    /**
     * The interface identifier for IHardwareAudioEngineBase
     * @type {Guid}
     */
    static IID => Guid("{eddce3e4-f3c1-453a-b461-223563cbd886}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} _pwstrDeviceId 
     * @param {Integer} _uConnectorId 
     * @param {Pointer<UInt32>} _pAvailableConnectorInstanceCount 
     * @returns {HRESULT} 
     */
    GetAvailableOffloadConnectorCount(_pwstrDeviceId, _uConnectorId, _pAvailableConnectorInstanceCount) {
        _pwstrDeviceId := _pwstrDeviceId is String ? StrPtr(_pwstrDeviceId) : _pwstrDeviceId

        result := ComCall(3, this, "ptr", _pwstrDeviceId, "uint", _uConnectorId, "uint*", _pAvailableConnectorInstanceCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMMDevice>} pDevice 
     * @param {BOOL} _bRequestDeviceFormat 
     * @param {Pointer<WAVEFORMATEX>} _ppwfxFormat 
     * @returns {HRESULT} 
     */
    GetEngineFormat(pDevice, _bRequestDeviceFormat, _ppwfxFormat) {
        result := ComCall(4, this, "ptr", pDevice, "int", _bRequestDeviceFormat, "ptr", _ppwfxFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMMDevice>} pDevice 
     * @param {Pointer<WAVEFORMATEX>} _pwfxFormat 
     * @returns {HRESULT} 
     */
    SetEngineDeviceFormat(pDevice, _pwfxFormat) {
        result := ComCall(5, this, "ptr", pDevice, "ptr", _pwfxFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMMDevice>} pDevice 
     * @param {BOOL} _bEnable 
     * @returns {HRESULT} 
     */
    SetGfxState(pDevice, _bEnable) {
        result := ComCall(6, this, "ptr", pDevice, "int", _bEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMMDevice>} pDevice 
     * @param {Pointer<BOOL>} _pbEnable 
     * @returns {HRESULT} 
     */
    GetGfxState(pDevice, _pbEnable) {
        result := ComCall(7, this, "ptr", pDevice, "ptr", _pbEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
