#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTTSEngine extends IUnknown{
    /**
     * The interface identifier for ISpTTSEngine
     * @type {Guid}
     */
    static IID => Guid("{a74d7c8e-4cc5-4f2f-a6eb-804dee18500e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwSpeakFlags 
     * @param {Pointer<Guid>} rguidFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Pointer<SPVTEXTFRAG>} pTextFragList 
     * @param {Pointer<ISpTTSEngineSite>} pOutputSite 
     * @returns {HRESULT} 
     */
    Speak(dwSpeakFlags, rguidFormatId, pWaveFormatEx, pTextFragList, pOutputSite) {
        result := ComCall(3, this, "uint", dwSpeakFlags, "ptr", rguidFormatId, "ptr", pWaveFormatEx, "ptr", pTextFragList, "ptr", pOutputSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pTargetFmtId 
     * @param {Pointer<WAVEFORMATEX>} pTargetWaveFormatEx 
     * @param {Pointer<Guid>} pOutputFormatId 
     * @param {Pointer<WAVEFORMATEX>} ppCoMemOutputWaveFormatEx 
     * @returns {HRESULT} 
     */
    GetOutputFormat(pTargetFmtId, pTargetWaveFormatEx, pOutputFormatId, ppCoMemOutputWaveFormatEx) {
        result := ComCall(4, this, "ptr", pTargetFmtId, "ptr", pTargetWaveFormatEx, "ptr", pOutputFormatId, "ptr", ppCoMemOutputWaveFormatEx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
