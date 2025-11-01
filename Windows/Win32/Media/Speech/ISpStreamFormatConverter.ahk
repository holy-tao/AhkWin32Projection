#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpStreamFormat.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpStreamFormatConverter extends ISpStreamFormat{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpStreamFormatConverter
     * @type {Guid}
     */
    static IID => Guid("{678a932c-ea71-4446-9b41-78fda6280a29}")

    /**
     * The class identifier for SpStreamFormatConverter
     * @type {Guid}
     */
    static CLSID => Guid("{7013943a-e2ec-11d2-a086-00c04f8ef9b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBaseStream", "GetBaseStream", "SetFormat", "ResetSeekPosition", "ScaleConvertedToBaseOffset", "ScaleBaseToConvertedOffset"]

    /**
     * 
     * @param {ISpStreamFormat} pStream 
     * @param {BOOL} fSetFormatToBaseStreamFormat 
     * @param {BOOL} fWriteToBaseStream 
     * @returns {HRESULT} 
     */
    SetBaseStream(pStream, fSetFormatToBaseStreamFormat, fWriteToBaseStream) {
        result := ComCall(15, this, "ptr", pStream, "int", fSetFormatToBaseStreamFormat, "int", fWriteToBaseStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpStreamFormat>} ppStream 
     * @returns {HRESULT} 
     */
    GetBaseStream(ppStream) {
        result := ComCall(16, this, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidFormatIdOfConvertedStream 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatExOfConvertedStream 
     * @returns {HRESULT} 
     */
    SetFormat(rguidFormatIdOfConvertedStream, pWaveFormatExOfConvertedStream) {
        result := ComCall(17, this, "ptr", rguidFormatIdOfConvertedStream, "ptr", pWaveFormatExOfConvertedStream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetSeekPosition() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffsetConvertedStream 
     * @param {Pointer<Integer>} pullOffsetBaseStream 
     * @returns {HRESULT} 
     */
    ScaleConvertedToBaseOffset(ullOffsetConvertedStream, pullOffsetBaseStream) {
        pullOffsetBaseStreamMarshal := pullOffsetBaseStream is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "uint", ullOffsetConvertedStream, pullOffsetBaseStreamMarshal, pullOffsetBaseStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffsetBaseStream 
     * @param {Pointer<Integer>} pullOffsetConvertedStream 
     * @returns {HRESULT} 
     */
    ScaleBaseToConvertedOffset(ullOffsetBaseStream, pullOffsetConvertedStream) {
        pullOffsetConvertedStreamMarshal := pullOffsetConvertedStream is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "uint", ullOffsetBaseStream, pullOffsetConvertedStreamMarshal, pullOffsetConvertedStream, "HRESULT")
        return result
    }
}
