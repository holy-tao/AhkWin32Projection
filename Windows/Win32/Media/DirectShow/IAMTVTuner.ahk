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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AvailableTVFormats", "get_TVFormat", "AutoTune", "StoreAutoTune", "get_NumInputConnections", "put_InputType", "get_InputType", "put_ConnectInput", "get_ConnectInput", "get_VideoFrequency", "get_AudioFrequency"]

    /**
     * 
     * @param {Pointer<Integer>} lAnalogVideoStandard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_availabletvformats
     */
    get_AvailableTVFormats(lAnalogVideoStandard) {
        result := ComCall(18, this, "int*", lAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plAnalogVideoStandard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_tvformat
     */
    get_TVFormat(plAnalogVideoStandard) {
        result := ComCall(19, this, "int*", plAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lChannel 
     * @param {Pointer<Integer>} plFoundSignal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-autotune
     */
    AutoTune(lChannel, plFoundSignal) {
        result := ComCall(20, this, "int", lChannel, "int*", plFoundSignal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-storeautotune
     */
    StoreAutoTune() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plNumInputConnections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_numinputconnections
     */
    get_NumInputConnections(plNumInputConnections) {
        result := ComCall(22, this, "int*", plNumInputConnections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} InputType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-put_inputtype
     */
    put_InputType(lIndex, InputType) {
        result := ComCall(23, this, "int", lIndex, "int", InputType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} pInputType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_inputtype
     */
    get_InputType(lIndex, pInputType) {
        result := ComCall(24, this, "int", lIndex, "int*", pInputType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-put_connectinput
     */
    put_ConnectInput(lIndex) {
        result := ComCall(25, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_connectinput
     */
    get_ConnectInput(plIndex) {
        result := ComCall(26, this, "int*", plIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lFreq 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_videofrequency
     */
    get_VideoFrequency(lFreq) {
        result := ComCall(27, this, "int*", lFreq, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lFreq 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_audiofrequency
     */
    get_AudioFrequency(lFreq) {
        result := ComCall(28, this, "int*", lFreq, "HRESULT")
        return result
    }
}
