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
     * 
     * @param {PWSTR} _pwstrDeviceId 
     * @param {Integer} _uConnectorId 
     * @param {Pointer<Integer>} _pAvailableConnectorInstanceCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getavailableoffloadconnectorcount
     */
    GetAvailableOffloadConnectorCount(_pwstrDeviceId, _uConnectorId, _pAvailableConnectorInstanceCount) {
        _pwstrDeviceId := _pwstrDeviceId is String ? StrPtr(_pwstrDeviceId) : _pwstrDeviceId

        _pAvailableConnectorInstanceCountMarshal := _pAvailableConnectorInstanceCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", _pwstrDeviceId, "uint", _uConnectorId, _pAvailableConnectorInstanceCountMarshal, _pAvailableConnectorInstanceCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMMDevice} pDevice 
     * @param {BOOL} _bRequestDeviceFormat 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} _ppwfxFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getengineformat
     */
    GetEngineFormat(pDevice, _bRequestDeviceFormat, _ppwfxFormat) {
        result := ComCall(4, this, "ptr", pDevice, "int", _bRequestDeviceFormat, "ptr*", _ppwfxFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMMDevice} pDevice 
     * @param {Pointer<WAVEFORMATEX>} _pwfxFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-setenginedeviceformat
     */
    SetEngineDeviceFormat(pDevice, _pwfxFormat) {
        result := ComCall(5, this, "ptr", pDevice, "ptr", _pwfxFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMMDevice} pDevice 
     * @param {BOOL} _bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-setgfxstate
     */
    SetGfxState(pDevice, _bEnable) {
        result := ComCall(6, this, "ptr", pDevice, "int", _bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMMDevice} pDevice 
     * @param {Pointer<BOOL>} _pbEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getgfxstate
     */
    GetGfxState(pDevice, _pbEnable) {
        result := ComCall(7, this, "ptr", pDevice, "ptr", _pbEnable, "HRESULT")
        return result
    }
}
