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
     * @param {Pointer<Integer>} pnChannelCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount
     */
    GetChannelCount(pnChannelCount) {
        result := ComCall(5, this, "uint*", pnChannelCount, "HRESULT")
        return result
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
     * @param {Pointer<Float>} pfLevelDB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmastervolumelevel
     */
    GetMasterVolumeLevel(pfLevelDB) {
        result := ComCall(8, this, "float*", pfLevelDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pfLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmastervolumelevelscalar
     */
    GetMasterVolumeLevelScalar(pfLevel) {
        result := ComCall(9, this, "float*", pfLevel, "HRESULT")
        return result
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
     * @param {Pointer<Float>} pfLevelDB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelvolumelevel
     */
    GetChannelVolumeLevel(nChannel, pfLevelDB) {
        result := ComCall(12, this, "uint", nChannel, "float*", pfLevelDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Float>} pfLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelvolumelevelscalar
     */
    GetChannelVolumeLevelScalar(nChannel, pfLevel) {
        result := ComCall(13, this, "uint", nChannel, "float*", pfLevel, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbMute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmute
     */
    GetMute(pbMute) {
        result := ComCall(15, this, "ptr", pbMute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnStep 
     * @param {Pointer<Integer>} pnStepCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumestepinfo
     */
    GetVolumeStepInfo(pnStep, pnStepCount) {
        result := ComCall(16, this, "uint*", pnStep, "uint*", pnStepCount, "HRESULT")
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
     * @param {Pointer<Integer>} pdwHardwareSupportMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-queryhardwaresupport
     */
    QueryHardwareSupport(pdwHardwareSupportMask) {
        result := ComCall(19, this, "uint*", pdwHardwareSupportMask, "HRESULT")
        return result
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
        result := ComCall(20, this, "float*", pflVolumeMindB, "float*", pflVolumeMaxdB, "float*", pflVolumeIncrementdB, "HRESULT")
        return result
    }
}
