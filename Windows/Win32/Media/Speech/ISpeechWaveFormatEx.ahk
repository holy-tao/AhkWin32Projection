#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechWaveFormatEx extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechWaveFormatEx
     * @type {Guid}
     */
    static IID => Guid("{7a1ef0d5-1581-4741-88e4-209a49f11a10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FormatTag", "put_FormatTag", "get_Channels", "put_Channels", "get_SamplesPerSec", "put_SamplesPerSec", "get_AvgBytesPerSec", "put_AvgBytesPerSec", "get_BlockAlign", "put_BlockAlign", "get_BitsPerSample", "put_BitsPerSample", "get_ExtraData", "put_ExtraData"]

    /**
     * 
     * @returns {Integer} 
     */
    get_FormatTag() {
        result := ComCall(7, this, "short*", &FormatTag := 0, "HRESULT")
        return FormatTag
    }

    /**
     * 
     * @param {Integer} FormatTag 
     * @returns {HRESULT} 
     */
    put_FormatTag(FormatTag) {
        result := ComCall(8, this, "short", FormatTag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Channels() {
        result := ComCall(9, this, "short*", &Channels := 0, "HRESULT")
        return Channels
    }

    /**
     * 
     * @param {Integer} Channels 
     * @returns {HRESULT} 
     */
    put_Channels(Channels) {
        result := ComCall(10, this, "short", Channels, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SamplesPerSec() {
        result := ComCall(11, this, "int*", &SamplesPerSec := 0, "HRESULT")
        return SamplesPerSec
    }

    /**
     * 
     * @param {Integer} SamplesPerSec 
     * @returns {HRESULT} 
     */
    put_SamplesPerSec(SamplesPerSec) {
        result := ComCall(12, this, "int", SamplesPerSec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AvgBytesPerSec() {
        result := ComCall(13, this, "int*", &AvgBytesPerSec := 0, "HRESULT")
        return AvgBytesPerSec
    }

    /**
     * 
     * @param {Integer} AvgBytesPerSec 
     * @returns {HRESULT} 
     */
    put_AvgBytesPerSec(AvgBytesPerSec) {
        result := ComCall(14, this, "int", AvgBytesPerSec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BlockAlign() {
        result := ComCall(15, this, "short*", &BlockAlign := 0, "HRESULT")
        return BlockAlign
    }

    /**
     * 
     * @param {Integer} BlockAlign 
     * @returns {HRESULT} 
     */
    put_BlockAlign(BlockAlign) {
        result := ComCall(16, this, "short", BlockAlign, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerSample() {
        result := ComCall(17, this, "short*", &BitsPerSample := 0, "HRESULT")
        return BitsPerSample
    }

    /**
     * 
     * @param {Integer} BitsPerSample 
     * @returns {HRESULT} 
     */
    put_BitsPerSample(BitsPerSample) {
        result := ComCall(18, this, "short", BitsPerSample, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ExtraData() {
        ExtraData := VARIANT()
        result := ComCall(19, this, "ptr", ExtraData, "HRESULT")
        return ExtraData
    }

    /**
     * 
     * @param {VARIANT} ExtraData 
     * @returns {HRESULT} 
     */
    put_ExtraData(ExtraData) {
        result := ComCall(20, this, "ptr", ExtraData, "HRESULT")
        return result
    }
}
