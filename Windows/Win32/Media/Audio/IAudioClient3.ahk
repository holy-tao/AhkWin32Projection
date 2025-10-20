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
     * 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {Pointer<UInt32>} pDefaultPeriodInFrames 
     * @param {Pointer<UInt32>} pFundamentalPeriodInFrames 
     * @param {Pointer<UInt32>} pMinPeriodInFrames 
     * @param {Pointer<UInt32>} pMaxPeriodInFrames 
     * @returns {HRESULT} 
     */
    GetSharedModeEnginePeriod(pFormat, pDefaultPeriodInFrames, pFundamentalPeriodInFrames, pMinPeriodInFrames, pMaxPeriodInFrames) {
        result := ComCall(18, this, "ptr", pFormat, "uint*", pDefaultPeriodInFrames, "uint*", pFundamentalPeriodInFrames, "uint*", pMinPeriodInFrames, "uint*", pMaxPeriodInFrames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} ppFormat 
     * @param {Pointer<UInt32>} pCurrentPeriodInFrames 
     * @returns {HRESULT} 
     */
    GetCurrentSharedModeEnginePeriod(ppFormat, pCurrentPeriodInFrames) {
        result := ComCall(19, this, "ptr", ppFormat, "uint*", pCurrentPeriodInFrames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamFlags 
     * @param {Integer} PeriodInFrames 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {Pointer<Guid>} AudioSessionGuid 
     * @returns {HRESULT} 
     */
    InitializeSharedAudioStream(StreamFlags, PeriodInFrames, pFormat, AudioSessionGuid) {
        result := ComCall(20, this, "uint", StreamFlags, "uint", PeriodInFrames, "ptr", pFormat, "ptr", AudioSessionGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
