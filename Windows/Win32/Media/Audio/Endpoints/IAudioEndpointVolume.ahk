#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioEndpointVolume interface represents the volume controls on the audio stream to or from an audio endpoint device.
 * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nn-endpointvolume-iaudioendpointvolume
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointVolume
     * @type {Guid}
     */
    static IID => Guid("{5cdf2c82-841e-4546-9722-0cf74078229a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterControlChangeNotify", "UnregisterControlChangeNotify", "GetChannelCount", "SetMasterVolumeLevel", "SetMasterVolumeLevelScalar", "GetMasterVolumeLevel", "GetMasterVolumeLevelScalar", "SetChannelVolumeLevel", "SetChannelVolumeLevelScalar", "GetChannelVolumeLevel", "GetChannelVolumeLevelScalar", "SetMute", "GetMute", "GetVolumeStepInfo", "VolumeStepUp", "VolumeStepDown", "QueryHardwareSupport", "GetVolumeRange"]

    /**
     * 
     * @param {IAudioEndpointVolumeCallback} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-registercontrolchangenotify
     */
    RegisterControlChangeNotify(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioEndpointVolumeCallback} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-unregistercontrolchangenotify
     */
    UnregisterControlChangeNotify(pNotify) {
        result := ComCall(4, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(5, this, "uint*", &pnChannelCount := 0, "HRESULT")
        return pnChannelCount
    }

    /**
     * 
     * @param {Float} fLevelDB 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmastervolumelevel
     */
    SetMasterVolumeLevel(fLevelDB, pguidEventContext) {
        result := ComCall(6, this, "float", fLevelDB, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} fLevel 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmastervolumelevelscalar
     */
    SetMasterVolumeLevelScalar(fLevel, pguidEventContext) {
        result := ComCall(7, this, "float", fLevel, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmastervolumelevel
     */
    GetMasterVolumeLevel() {
        result := ComCall(8, this, "float*", &pfLevelDB := 0, "HRESULT")
        return pfLevelDB
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmastervolumelevelscalar
     */
    GetMasterVolumeLevelScalar() {
        result := ComCall(9, this, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Float} fLevelDB 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setchannelvolumelevel
     */
    SetChannelVolumeLevel(nChannel, fLevelDB, pguidEventContext) {
        result := ComCall(10, this, "uint", nChannel, "float", fLevelDB, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Float} fLevel 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setchannelvolumelevelscalar
     */
    SetChannelVolumeLevelScalar(nChannel, fLevel, pguidEventContext) {
        result := ComCall(11, this, "uint", nChannel, "float", fLevel, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelvolumelevel
     */
    GetChannelVolumeLevel(nChannel) {
        result := ComCall(12, this, "uint", nChannel, "float*", &pfLevelDB := 0, "HRESULT")
        return pfLevelDB
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelvolumelevelscalar
     */
    GetChannelVolumeLevelScalar(nChannel) {
        result := ComCall(13, this, "uint", nChannel, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * 
     * @param {BOOL} bMute 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmute
     */
    SetMute(bMute, pguidEventContext) {
        result := ComCall(14, this, "int", bMute, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmute
     */
    GetMute() {
        result := ComCall(15, this, "int*", &pbMute := 0, "HRESULT")
        return pbMute
    }

    /**
     * 
     * @param {Pointer<Integer>} pnStep 
     * @param {Pointer<Integer>} pnStepCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumestepinfo
     */
    GetVolumeStepInfo(pnStep, pnStepCount) {
        pnStepMarshal := pnStep is VarRef ? "uint*" : "ptr"
        pnStepCountMarshal := pnStepCount is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pnStepMarshal, pnStep, pnStepCountMarshal, pnStepCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-volumestepup
     */
    VolumeStepUp(pguidEventContext) {
        result := ComCall(17, this, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-volumestepdown
     */
    VolumeStepDown(pguidEventContext) {
        result := ComCall(18, this, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-queryhardwaresupport
     */
    QueryHardwareSupport() {
        result := ComCall(19, this, "uint*", &pdwHardwareSupportMask := 0, "HRESULT")
        return pdwHardwareSupportMask
    }

    /**
     * 
     * @param {Pointer<Float>} pflVolumeMindB 
     * @param {Pointer<Float>} pflVolumeMaxdB 
     * @param {Pointer<Float>} pflVolumeIncrementdB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumerange
     */
    GetVolumeRange(pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB) {
        pflVolumeMindBMarshal := pflVolumeMindB is VarRef ? "float*" : "ptr"
        pflVolumeMaxdBMarshal := pflVolumeMaxdB is VarRef ? "float*" : "ptr"
        pflVolumeIncrementdBMarshal := pflVolumeIncrementdB is VarRef ? "float*" : "ptr"

        result := ComCall(20, this, pflVolumeMindBMarshal, pflVolumeMindB, pflVolumeMaxdBMarshal, pflVolumeMaxdB, pflVolumeIncrementdBMarshal, pflVolumeIncrementdB, "HRESULT")
        return result
    }
}
