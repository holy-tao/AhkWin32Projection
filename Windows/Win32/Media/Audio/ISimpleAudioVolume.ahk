#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISimpleAudioVolume interface enables a client to control the master volume level of an audio session.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-isimpleaudiovolume
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISimpleAudioVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimpleAudioVolume
     * @type {Guid}
     */
    static IID => Guid("{87ce5498-68d6-44e5-9215-6da47ef883d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMasterVolume", "GetMasterVolume", "SetMute", "GetMute"]

    /**
     * 
     * @param {Float} fLevel 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-isimpleaudiovolume-setmastervolume
     */
    SetMasterVolume(fLevel, EventContext) {
        result := ComCall(3, this, "float", fLevel, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-isimpleaudiovolume-getmastervolume
     */
    GetMasterVolume() {
        result := ComCall(4, this, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * 
     * @param {BOOL} bMute 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-isimpleaudiovolume-setmute
     */
    SetMute(bMute, EventContext) {
        result := ComCall(5, this, "int", bMute, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-isimpleaudiovolume-getmute
     */
    GetMute() {
        result := ComCall(6, this, "int*", &pbMute := 0, "HRESULT")
        return pbMute
    }
}
