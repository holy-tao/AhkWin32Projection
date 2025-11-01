#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioClient2.ahk

/**
 * The IAudioClient3 interface is derived from the IAudioClient2 interface, with a set of additional methods that enable a Windows Audio Session API (WASAPI) audio client to query for the audio engine's supported periodicities and current periodicity as well as request initialization a shared audio stream with a specified periodicity.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclient3
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClient3 extends IAudioClient2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClient3
     * @type {Guid}
     */
    static IID => Guid("{7ed4ee07-8e67-4cd4-8c1a-2b7a5987ad42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSharedModeEnginePeriod", "GetCurrentSharedModeEnginePeriod", "InitializeSharedAudioStream"]

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {Pointer<Integer>} pDefaultPeriodInFrames 
     * @param {Pointer<Integer>} pFundamentalPeriodInFrames 
     * @param {Pointer<Integer>} pMinPeriodInFrames 
     * @param {Pointer<Integer>} pMaxPeriodInFrames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient3-getsharedmodeengineperiod
     */
    GetSharedModeEnginePeriod(pFormat, pDefaultPeriodInFrames, pFundamentalPeriodInFrames, pMinPeriodInFrames, pMaxPeriodInFrames) {
        pDefaultPeriodInFramesMarshal := pDefaultPeriodInFrames is VarRef ? "uint*" : "ptr"
        pFundamentalPeriodInFramesMarshal := pFundamentalPeriodInFrames is VarRef ? "uint*" : "ptr"
        pMinPeriodInFramesMarshal := pMinPeriodInFrames is VarRef ? "uint*" : "ptr"
        pMaxPeriodInFramesMarshal := pMaxPeriodInFrames is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", pFormat, pDefaultPeriodInFramesMarshal, pDefaultPeriodInFrames, pFundamentalPeriodInFramesMarshal, pFundamentalPeriodInFrames, pMinPeriodInFramesMarshal, pMinPeriodInFrames, pMaxPeriodInFramesMarshal, pMaxPeriodInFrames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppFormat 
     * @param {Pointer<Integer>} pCurrentPeriodInFrames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient3-getcurrentsharedmodeengineperiod
     */
    GetCurrentSharedModeEnginePeriod(ppFormat, pCurrentPeriodInFrames) {
        pCurrentPeriodInFramesMarshal := pCurrentPeriodInFrames is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr*", ppFormat, pCurrentPeriodInFramesMarshal, pCurrentPeriodInFrames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StreamFlags 
     * @param {Integer} PeriodInFrames 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {Pointer<Guid>} AudioSessionGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient3-initializesharedaudiostream
     */
    InitializeSharedAudioStream(StreamFlags, PeriodInFrames, pFormat, AudioSessionGuid) {
        result := ComCall(20, this, "uint", StreamFlags, "uint", PeriodInFrames, "ptr", pFormat, "ptr", AudioSessionGuid, "HRESULT")
        return result
    }
}
