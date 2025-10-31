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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChannelCount", "SetChannelVolume", "GetChannelVolume", "SetAllVolumes", "GetAllVolumes"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-getchannelcount
     */
    GetChannelCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Float} fLevel 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-setchannelvolume
     */
    SetChannelVolume(dwIndex, fLevel, EventContext) {
        result := ComCall(4, this, "uint", dwIndex, "float", fLevel, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Float>} pfLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-getchannelvolume
     */
    GetChannelVolume(dwIndex, pfLevel) {
        result := ComCall(5, this, "uint", dwIndex, "float*", pfLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCount 
     * @param {Pointer<Float>} pfVolumes 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-setallvolumes
     */
    SetAllVolumes(dwCount, pfVolumes, EventContext) {
        result := ComCall(6, this, "uint", dwCount, "float*", pfVolumes, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCount 
     * @param {Pointer<Float>} pfVolumes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-getallvolumes
     */
    GetAllVolumes(dwCount, pfVolumes) {
        result := ComCall(7, this, "uint", dwCount, "float*", pfVolumes, "HRESULT")
        return result
    }
}
