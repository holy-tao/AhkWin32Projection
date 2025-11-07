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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(18, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(19, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * 
     * @param {Integer} lChannel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-autotune
     */
    AutoTune(lChannel) {
        result := ComCall(20, this, "int", lChannel, "int*", &plFoundSignal := 0, "HRESULT")
        return plFoundSignal
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_numinputconnections
     */
    get_NumInputConnections() {
        result := ComCall(22, this, "int*", &plNumInputConnections := 0, "HRESULT")
        return plNumInputConnections
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_inputtype
     */
    get_InputType(lIndex) {
        result := ComCall(24, this, "int", lIndex, "int*", &pInputType := 0, "HRESULT")
        return pInputType
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_connectinput
     */
    get_ConnectInput() {
        result := ComCall(26, this, "int*", &plIndex := 0, "HRESULT")
        return plIndex
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_videofrequency
     */
    get_VideoFrequency() {
        result := ComCall(27, this, "int*", &lFreq := 0, "HRESULT")
        return lFreq
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_audiofrequency
     */
    get_AudioFrequency() {
        result := ComCall(28, this, "int*", &lFreq := 0, "HRESULT")
        return lFreq
    }
}
