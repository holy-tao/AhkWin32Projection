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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableOffloadConnectorCount", "GetEngineFormat", "SetEngineDeviceFormat", "SetGfxState", "GetGfxState"]

    /**
     * The GetAvailableOffloadConnectorCount method retrieves the number of avaialable endpoints that can handle offloaded streams on the hardware audio engine.
     * @param {PWSTR} _pwstrDeviceId A pointer to the device ID of the hardware audio engine device.
     * @param {Integer} _uConnectorId The identifier for the endpoint connector.
     * @returns {Integer} A pointer to the number of available endpoint connectors that can handle offloaded audio streams.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getavailableoffloadconnectorcount
     */
    GetAvailableOffloadConnectorCount(_pwstrDeviceId, _uConnectorId) {
        _pwstrDeviceId := _pwstrDeviceId is String ? StrPtr(_pwstrDeviceId) : _pwstrDeviceId

        result := ComCall(3, this, "ptr", _pwstrDeviceId, "uint", _uConnectorId, "uint*", &_pAvailableConnectorInstanceCount := 0, "HRESULT")
        return _pAvailableConnectorInstanceCount
    }

    /**
     * The GetEngineFormat method retrieves the current data format of the offloaded audio stream.
     * @param {IMMDevice} pDevice A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface.
     * @param {BOOL} _bRequestDeviceFormat A Boolean variable that indicates whether or not the <b>IMMDevice</b> interface is being accessed to retrieve the device format.
     * @param {Pointer<Pointer<WAVEFORMATEX>>} _ppwfxFormat A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> structure that provides information about the hardware audio engine. This includes the waveform audio format type, the number of audio channels, and the sample rate of the audio engine.
     * @returns {HRESULT} The <b>GetEngineFormat</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getengineformat
     */
    GetEngineFormat(pDevice, _bRequestDeviceFormat, _ppwfxFormat) {
        _ppwfxFormatMarshal := _ppwfxFormat is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pDevice, "int", _bRequestDeviceFormat, _ppwfxFormatMarshal, _ppwfxFormat, "HRESULT")
        return result
    }

    /**
     * The SetEngineDeviceFormat method sets the waveform audio format for the hardware audio engine.
     * @param {IMMDevice} pDevice A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface.
     * @param {Pointer<WAVEFORMATEX>} _pwfxFormat A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> structure that provides information about the hardware audio engine.
     * @returns {HRESULT} The <b>SetEngineDeviceFormat</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-setenginedeviceformat
     */
    SetEngineDeviceFormat(pDevice, _pwfxFormat) {
        result := ComCall(5, this, "ptr", pDevice, "ptr", _pwfxFormat, "HRESULT")
        return result
    }

    /**
     * The SetGfxState method sets the GFX state of the offloaded audio stream.
     * @param {IMMDevice} pDevice Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface.
     * @param {BOOL} _bEnable Pointer to a boolean variable.
     * @returns {HRESULT} The <b>SetGfxState</b> method returns S_OK to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-setgfxstate
     */
    SetGfxState(pDevice, _bEnable) {
        result := ComCall(6, this, "ptr", pDevice, "int", _bEnable, "HRESULT")
        return result
    }

    /**
     * The GetGfxState method retrieves the GFX state of the offloaded audio stream.
     * @param {IMMDevice} pDevice Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface.
     * @returns {BOOL} Pointer to a boolean variable.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getgfxstate
     */
    GetGfxState(pDevice) {
        result := ComCall(7, this, "ptr", pDevice, "int*", &_pbEnable := 0, "HRESULT")
        return _pbEnable
    }
}
