#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTTSEngine extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Speak", "GetOutputFormat"]

    /**
     * 
     * @param {Integer} dwSpeakFlags 
     * @param {Pointer<Guid>} rguidFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Pointer<SPVTEXTFRAG>} pTextFragList 
     * @param {ISpTTSEngineSite} pOutputSite 
     * @returns {HRESULT} 
     */
    Speak(dwSpeakFlags, rguidFormatId, pWaveFormatEx, pTextFragList, pOutputSite) {
        result := ComCall(3, this, "uint", dwSpeakFlags, "ptr", rguidFormatId, "ptr", pWaveFormatEx, "ptr", pTextFragList, "ptr", pOutputSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pTargetFmtId 
     * @param {Pointer<WAVEFORMATEX>} pTargetWaveFormatEx 
     * @param {Pointer<Guid>} pOutputFormatId 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppCoMemOutputWaveFormatEx 
     * @returns {HRESULT} 
     */
    GetOutputFormat(pTargetFmtId, pTargetWaveFormatEx, pOutputFormatId, ppCoMemOutputWaveFormatEx) {
        ppCoMemOutputWaveFormatExMarshal := ppCoMemOutputWaveFormatEx is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pTargetFmtId, "ptr", pTargetWaveFormatEx, "ptr", pOutputFormatId, ppCoMemOutputWaveFormatExMarshal, ppCoMemOutputWaveFormatEx, "HRESULT")
        return result
    }
}
