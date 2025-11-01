#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} FormatTag 
     * @returns {HRESULT} 
     */
    get_FormatTag(FormatTag) {
        FormatTagMarshal := FormatTag is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, FormatTagMarshal, FormatTag, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Channels 
     * @returns {HRESULT} 
     */
    get_Channels(Channels) {
        ChannelsMarshal := Channels is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, ChannelsMarshal, Channels, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} SamplesPerSec 
     * @returns {HRESULT} 
     */
    get_SamplesPerSec(SamplesPerSec) {
        SamplesPerSecMarshal := SamplesPerSec is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, SamplesPerSecMarshal, SamplesPerSec, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} AvgBytesPerSec 
     * @returns {HRESULT} 
     */
    get_AvgBytesPerSec(AvgBytesPerSec) {
        AvgBytesPerSecMarshal := AvgBytesPerSec is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, AvgBytesPerSecMarshal, AvgBytesPerSec, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} BlockAlign 
     * @returns {HRESULT} 
     */
    get_BlockAlign(BlockAlign) {
        BlockAlignMarshal := BlockAlign is VarRef ? "short*" : "ptr"

        result := ComCall(15, this, BlockAlignMarshal, BlockAlign, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} BitsPerSample 
     * @returns {HRESULT} 
     */
    get_BitsPerSample(BitsPerSample) {
        BitsPerSampleMarshal := BitsPerSample is VarRef ? "short*" : "ptr"

        result := ComCall(17, this, BitsPerSampleMarshal, BitsPerSample, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} ExtraData 
     * @returns {HRESULT} 
     */
    get_ExtraData(ExtraData) {
        result := ComCall(19, this, "ptr", ExtraData, "HRESULT")
        return result
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
