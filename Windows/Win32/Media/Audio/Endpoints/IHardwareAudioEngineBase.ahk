#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\IMMDevice.ahk" { IMMDevice }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IHardwareAudioEngineBase interface is implemented by audio endpoints for the audio stack to use to configure and retrieve information about the hardware audio engine.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-ihardwareaudioenginebase
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IHardwareAudioEngineBase extends IUnknown {
    /**
     * The interface identifier for IHardwareAudioEngineBase
     * @type {Guid}
     */
    static IID := Guid("{eddce3e4-f3c1-453a-b461-223563cbd886}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHardwareAudioEngineBase interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAvailableOffloadConnectorCount : IntPtr
        GetEngineFormat                   : IntPtr
        SetEngineDeviceFormat             : IntPtr
        SetGfxState                       : IntPtr
        GetGfxState                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHardwareAudioEngineBase.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetAvailableOffloadConnectorCount method retrieves the number of available endpoints that can handle offloaded streams on the hardware audio engine.
     * @param {PWSTR} _pwstrDeviceId A pointer to the device ID of the hardware audio engine device.
     * @param {Integer} _uConnectorId The identifier for the endpoint connector.
     * @returns {Integer} A pointer to the number of available endpoint connectors that can handle offloaded audio streams.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getavailableoffloadconnectorcount
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
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getengineformat
     */
    GetEngineFormat(pDevice, _bRequestDeviceFormat, _ppwfxFormat) {
        _ppwfxFormatMarshal := _ppwfxFormat is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pDevice, BOOL, _bRequestDeviceFormat, _ppwfxFormatMarshal, _ppwfxFormat, "HRESULT")
        return result
    }

    /**
     * The SetEngineDeviceFormat method sets the waveform audio format for the hardware audio engine.
     * @param {IMMDevice} pDevice A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface.
     * @param {Pointer<WAVEFORMATEX>} _pwfxFormat A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> structure that provides information about the hardware audio engine.
     * @returns {HRESULT} The <b>SetEngineDeviceFormat</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-setenginedeviceformat
     */
    SetEngineDeviceFormat(pDevice, _pwfxFormat) {
        result := ComCall(5, this, "ptr", pDevice, WAVEFORMATEX.Ptr, _pwfxFormat, "HRESULT")
        return result
    }

    /**
     * The SetGfxState method sets the GFX state of the offloaded audio stream.
     * @param {IMMDevice} pDevice Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface.
     * @param {BOOL} _bEnable Pointer to a boolean variable.
     * @returns {HRESULT} The <b>SetGfxState</b> method returns S_OK to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-setgfxstate
     */
    SetGfxState(pDevice, _bEnable) {
        result := ComCall(6, this, "ptr", pDevice, BOOL, _bEnable, "HRESULT")
        return result
    }

    /**
     * The GetGfxState method retrieves the GFX state of the offloaded audio stream.
     * @param {IMMDevice} pDevice Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface.
     * @returns {BOOL} Pointer to a boolean variable.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-ihardwareaudioenginebase-getgfxstate
     */
    GetGfxState(pDevice) {
        result := ComCall(7, this, "ptr", pDevice, BOOL.Ptr, &_pbEnable := 0, "HRESULT")
        return _pbEnable
    }

    Query(iid) {
        if (IHardwareAudioEngineBase.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAvailableOffloadConnectorCount := CallbackCreate(GetMethod(implObj, "GetAvailableOffloadConnectorCount"), flags, 4)
        this.vtbl.GetEngineFormat := CallbackCreate(GetMethod(implObj, "GetEngineFormat"), flags, 4)
        this.vtbl.SetEngineDeviceFormat := CallbackCreate(GetMethod(implObj, "SetEngineDeviceFormat"), flags, 3)
        this.vtbl.SetGfxState := CallbackCreate(GetMethod(implObj, "SetGfxState"), flags, 3)
        this.vtbl.GetGfxState := CallbackCreate(GetMethod(implObj, "GetGfxState"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAvailableOffloadConnectorCount)
        CallbackFree(this.vtbl.GetEngineFormat)
        CallbackFree(this.vtbl.SetEngineDeviceFormat)
        CallbackFree(this.vtbl.SetGfxState)
        CallbackFree(this.vtbl.GetGfxState)
    }
}
