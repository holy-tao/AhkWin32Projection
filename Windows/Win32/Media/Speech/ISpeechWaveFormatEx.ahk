#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechWaveFormatEx extends IDispatch{
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
     * 
     * @param {Pointer<Int16>} FormatTag 
     * @returns {HRESULT} 
     */
    get_FormatTag(FormatTag) {
        result := ComCall(7, this, "short*", FormatTag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FormatTag 
     * @returns {HRESULT} 
     */
    put_FormatTag(FormatTag) {
        result := ComCall(8, this, "short", FormatTag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} Channels 
     * @returns {HRESULT} 
     */
    get_Channels(Channels) {
        result := ComCall(9, this, "short*", Channels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Channels 
     * @returns {HRESULT} 
     */
    put_Channels(Channels) {
        result := ComCall(10, this, "short", Channels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} SamplesPerSec 
     * @returns {HRESULT} 
     */
    get_SamplesPerSec(SamplesPerSec) {
        result := ComCall(11, this, "int*", SamplesPerSec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SamplesPerSec 
     * @returns {HRESULT} 
     */
    put_SamplesPerSec(SamplesPerSec) {
        result := ComCall(12, this, "int", SamplesPerSec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} AvgBytesPerSec 
     * @returns {HRESULT} 
     */
    get_AvgBytesPerSec(AvgBytesPerSec) {
        result := ComCall(13, this, "int*", AvgBytesPerSec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AvgBytesPerSec 
     * @returns {HRESULT} 
     */
    put_AvgBytesPerSec(AvgBytesPerSec) {
        result := ComCall(14, this, "int", AvgBytesPerSec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} BlockAlign 
     * @returns {HRESULT} 
     */
    get_BlockAlign(BlockAlign) {
        result := ComCall(15, this, "short*", BlockAlign, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BlockAlign 
     * @returns {HRESULT} 
     */
    put_BlockAlign(BlockAlign) {
        result := ComCall(16, this, "short", BlockAlign, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} BitsPerSample 
     * @returns {HRESULT} 
     */
    get_BitsPerSample(BitsPerSample) {
        result := ComCall(17, this, "short*", BitsPerSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BitsPerSample 
     * @returns {HRESULT} 
     */
    put_BitsPerSample(BitsPerSample) {
        result := ComCall(18, this, "short", BitsPerSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} ExtraData 
     * @returns {HRESULT} 
     */
    get_ExtraData(ExtraData) {
        result := ComCall(19, this, "ptr", ExtraData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ExtraData 
     * @returns {HRESULT} 
     */
    put_ExtraData(ExtraData) {
        result := ComCall(20, this, "ptr", ExtraData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
