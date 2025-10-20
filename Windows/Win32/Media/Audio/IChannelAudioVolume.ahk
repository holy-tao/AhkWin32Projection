#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IChannelAudioVolume interface enables a client to control and monitor the volume levels for all of the channels in the audio session that the stream belongs to.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-ichannelaudiovolume
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IChannelAudioVolume extends IUnknown{
    /**
     * The interface identifier for IChannelAudioVolume
     * @type {Guid}
     */
    static IID => Guid("{1c158861-b533-4b30-b1cf-e853e51c59b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetChannelCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Float} fLevel 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    SetChannelVolume(dwIndex, fLevel, EventContext) {
        result := ComCall(4, this, "uint", dwIndex, "float", fLevel, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Single>} pfLevel 
     * @returns {HRESULT} 
     */
    GetChannelVolume(dwIndex, pfLevel) {
        result := ComCall(5, this, "uint", dwIndex, "float*", pfLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCount 
     * @param {Pointer<Single>} pfVolumes 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    SetAllVolumes(dwCount, pfVolumes, EventContext) {
        result := ComCall(6, this, "uint", dwCount, "float*", pfVolumes, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCount 
     * @param {Pointer<Single>} pfVolumes 
     * @returns {HRESULT} 
     */
    GetAllVolumes(dwCount, pfVolumes) {
        result := ComCall(7, this, "uint", dwCount, "float*", pfVolumes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
