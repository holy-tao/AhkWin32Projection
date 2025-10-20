#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAMTuner.ahk

/**
 * The IAMTVTuner interface controls a TV tuner.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtvtuner
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTVTuner extends IAMTuner{
    /**
     * The interface identifier for IAMTVTuner
     * @type {Guid}
     */
    static IID => Guid("{211a8766-03ac-11d1-8d13-00aa00bd8339}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Pointer<Int32>} lAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    get_AvailableTVFormats(lAnalogVideoStandard) {
        result := ComCall(18, this, "int*", lAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    get_TVFormat(plAnalogVideoStandard) {
        result := ComCall(19, this, "int*", plAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lChannel 
     * @param {Pointer<Int32>} plFoundSignal 
     * @returns {HRESULT} 
     */
    AutoTune(lChannel, plFoundSignal) {
        result := ComCall(20, this, "int", lChannel, "int*", plFoundSignal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StoreAutoTune() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plNumInputConnections 
     * @returns {HRESULT} 
     */
    get_NumInputConnections(plNumInputConnections) {
        result := ComCall(22, this, "int*", plNumInputConnections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} InputType 
     * @returns {HRESULT} 
     */
    put_InputType(lIndex, InputType) {
        result := ComCall(23, this, "int", lIndex, "int", InputType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Int32>} pInputType 
     * @returns {HRESULT} 
     */
    get_InputType(lIndex, pInputType) {
        result := ComCall(24, this, "int", lIndex, "int*", pInputType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    put_ConnectInput(lIndex) {
        result := ComCall(25, this, "int", lIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plIndex 
     * @returns {HRESULT} 
     */
    get_ConnectInput(plIndex) {
        result := ComCall(26, this, "int*", plIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lFreq 
     * @returns {HRESULT} 
     */
    get_VideoFrequency(lFreq) {
        result := ComCall(27, this, "int*", lFreq, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lFreq 
     * @returns {HRESULT} 
     */
    get_AudioFrequency(lFreq) {
        result := ComCall(28, this, "int*", lFreq, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
