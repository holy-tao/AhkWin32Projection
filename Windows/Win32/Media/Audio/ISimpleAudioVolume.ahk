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
     * 
     * @param {Float} fLevel 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    SetMasterVolume(fLevel, EventContext) {
        result := ComCall(3, this, "float", fLevel, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pfLevel 
     * @returns {HRESULT} 
     */
    GetMasterVolume(pfLevel) {
        result := ComCall(4, this, "float*", pfLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMute 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    SetMute(bMute, EventContext) {
        result := ComCall(5, this, "int", bMute, "ptr", EventContext, "int")
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
        result := ComCall(6, this, "ptr", pbMute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
