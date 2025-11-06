#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\IReferenceClock.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDirectMusicSynthSink interface is now largely obsolete and is supported only by versions of DirectMusic before DirectX 8.
 * @see https://docs.microsoft.com/windows/win32/api//dmusics/nn-dmusics-idirectmusicsynthsink
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicSynthSink extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "SetMasterClock", "GetLatencyClock", "Activate", "SampleToRefTime", "RefTimeToSample", "SetDirectSound", "GetDesiredBufferSize"]

    /**
     * 
     * @param {IDirectMusicSynth} pSynth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-init
     */
    Init(pSynth) {
        result := ComCall(3, this, "ptr", pSynth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IReferenceClock} pClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-setmasterclock
     */
    SetMasterClock(pClock) {
        result := ComCall(4, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IReferenceClock} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-getlatencyclock
     */
    GetLatencyClock() {
        result := ComCall(5, this, "ptr*", &ppClock := 0, "HRESULT")
        return IReferenceClock(ppClock)
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-activate
     */
    Activate(fEnable) {
        result := ComCall(6, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} llSampleTime 
     * @param {Pointer<Integer>} prfTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-sampletoreftime
     */
    SampleToRefTime(llSampleTime, prfTime) {
        prfTimeMarshal := prfTime is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "int64", llSampleTime, prfTimeMarshal, prfTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rfTime 
     * @param {Pointer<Integer>} pllSampleTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-reftimetosample
     */
    RefTimeToSample(rfTime, pllSampleTime) {
        pllSampleTimeMarshal := pllSampleTime is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "int64", rfTime, pllSampleTimeMarshal, pllSampleTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectSound} pDirectSound 
     * @param {IDirectSoundBuffer} pDirectSoundBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-setdirectsound
     */
    SetDirectSound(pDirectSound, pDirectSoundBuffer) {
        result := ComCall(9, this, "ptr", pDirectSound, "ptr", pDirectSoundBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBufferSizeInSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-getdesiredbuffersize
     */
    GetDesiredBufferSize(pdwBufferSizeInSamples) {
        pdwBufferSizeInSamplesMarshal := pdwBufferSizeInSamples is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwBufferSizeInSamplesMarshal, pdwBufferSizeInSamples, "HRESULT")
        return result
    }
}
