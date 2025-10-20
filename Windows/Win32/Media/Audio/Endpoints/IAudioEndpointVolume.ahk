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
     * 
     * @param {Pointer<IAudioEndpointVolumeCallback>} pNotify 
     * @returns {HRESULT} 
     */
    RegisterControlChangeNotify(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioEndpointVolumeCallback>} pNotify 
     * @returns {HRESULT} 
     */
    UnregisterControlChangeNotify(pNotify) {
        result := ComCall(4, this, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnChannelCount 
     * @returns {HRESULT} 
     */
    GetChannelCount(pnChannelCount) {
        result := ComCall(5, this, "uint*", pnChannelCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} fLevelDB 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetMasterVolumeLevel(fLevelDB, pguidEventContext) {
        result := ComCall(6, this, "float", fLevelDB, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} fLevel 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetMasterVolumeLevelScalar(fLevel, pguidEventContext) {
        result := ComCall(7, this, "float", fLevel, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pfLevelDB 
     * @returns {HRESULT} 
     */
    GetMasterVolumeLevel(pfLevelDB) {
        result := ComCall(8, this, "float*", pfLevelDB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pfLevel 
     * @returns {HRESULT} 
     */
    GetMasterVolumeLevelScalar(pfLevel) {
        result := ComCall(9, this, "float*", pfLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Float} fLevelDB 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetChannelVolumeLevel(nChannel, fLevelDB, pguidEventContext) {
        result := ComCall(10, this, "uint", nChannel, "float", fLevelDB, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Float} fLevel 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetChannelVolumeLevelScalar(nChannel, fLevel, pguidEventContext) {
        result := ComCall(11, this, "uint", nChannel, "float", fLevel, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Single>} pfLevelDB 
     * @returns {HRESULT} 
     */
    GetChannelVolumeLevel(nChannel, pfLevelDB) {
        result := ComCall(12, this, "uint", nChannel, "float*", pfLevelDB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Single>} pfLevel 
     * @returns {HRESULT} 
     */
    GetChannelVolumeLevelScalar(nChannel, pfLevel) {
        result := ComCall(13, this, "uint", nChannel, "float*", pfLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMute 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetMute(bMute, pguidEventContext) {
        result := ComCall(14, this, "int", bMute, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbMute 
     * @returns {HRESULT} 
     */
    GetMute(pbMute) {
        result := ComCall(15, this, "ptr", pbMute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnStep 
     * @param {Pointer<UInt32>} pnStepCount 
     * @returns {HRESULT} 
     */
    GetVolumeStepInfo(pnStep, pnStepCount) {
        result := ComCall(16, this, "uint*", pnStep, "uint*", pnStepCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    VolumeStepUp(pguidEventContext) {
        result := ComCall(17, this, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    VolumeStepDown(pguidEventContext) {
        result := ComCall(18, this, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwHardwareSupportMask 
     * @returns {HRESULT} 
     */
    QueryHardwareSupport(pdwHardwareSupportMask) {
        result := ComCall(19, this, "uint*", pdwHardwareSupportMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pflVolumeMindB 
     * @param {Pointer<Single>} pflVolumeMaxdB 
     * @param {Pointer<Single>} pflVolumeIncrementdB 
     * @returns {HRESULT} 
     */
    GetVolumeRange(pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB) {
        result := ComCall(20, this, "float*", pflVolumeMindB, "float*", pflVolumeMaxdB, "float*", pflVolumeIncrementdB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
