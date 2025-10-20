#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDirectMusicSynthSink interface is now largely obsolete and is supported only by versions of DirectMusic before DirectX 8.
 * @see https://docs.microsoft.com/windows/win32/api//dmusics/nn-dmusics-idirectmusicsynthsink
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicSynthSink extends IUnknown{
    /**
     * The interface identifier for IDirectMusicSynthSink
     * @type {Guid}
     */
    static IID => Guid("{09823663-5c85-11d2-afa6-00aa0024d8b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDirectMusicSynth>} pSynth 
     * @returns {HRESULT} 
     */
    Init(pSynth) {
        result := ComCall(3, this, "ptr", pSynth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceClock>} pClock 
     * @returns {HRESULT} 
     */
    SetMasterClock(pClock) {
        result := ComCall(4, this, "ptr", pClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceClock>} ppClock 
     * @returns {HRESULT} 
     */
    GetLatencyClock(ppClock) {
        result := ComCall(5, this, "ptr", ppClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    Activate(fEnable) {
        result := ComCall(6, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} llSampleTime 
     * @param {Pointer<Int64>} prfTime 
     * @returns {HRESULT} 
     */
    SampleToRefTime(llSampleTime, prfTime) {
        result := ComCall(7, this, "int64", llSampleTime, "int64*", prfTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rfTime 
     * @param {Pointer<Int64>} pllSampleTime 
     * @returns {HRESULT} 
     */
    RefTimeToSample(rfTime, pllSampleTime) {
        result := ComCall(8, this, "int64", rfTime, "int64*", pllSampleTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectSound>} pDirectSound 
     * @param {Pointer<IDirectSoundBuffer>} pDirectSoundBuffer 
     * @returns {HRESULT} 
     */
    SetDirectSound(pDirectSound, pDirectSoundBuffer) {
        result := ComCall(9, this, "ptr", pDirectSound, "ptr", pDirectSoundBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBufferSizeInSamples 
     * @returns {HRESULT} 
     */
    GetDesiredBufferSize(pdwBufferSizeInSamples) {
        result := ComCall(10, this, "uint*", pdwBufferSizeInSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
