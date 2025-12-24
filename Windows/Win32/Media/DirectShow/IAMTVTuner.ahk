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
     * @type {Integer} 
     */
    AvailableTVFormats {
        get => this.get_AvailableTVFormats()
    }

    /**
     * @type {Integer} 
     */
    TVFormat {
        get => this.get_TVFormat()
    }

    /**
     * @type {Integer} 
     */
    NumInputConnections {
        get => this.get_NumInputConnections()
    }

    /**
     * @type {Integer} 
     */
    ConnectInput {
        get => this.get_ConnectInput()
        set => this.put_ConnectInput(value)
    }

    /**
     * @type {Integer} 
     */
    VideoFrequency {
        get => this.get_VideoFrequency()
    }

    /**
     * @type {Integer} 
     */
    AudioFrequency {
        get => this.get_AudioFrequency()
    }

    /**
     * The get_AvailableTVFormats method retrieves all the analog video TV standards that the tuner supports.
     * @returns {Integer} Pointer to a variable that receives a bitwise combination of values from the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(18, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
    }

    /**
     * The get_TVFormat method retrieves the current analog video TV standard in use.
     * @returns {Integer} Pointer to a variable that receives a member of the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(19, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * The AutoTune method scans for a precise signal on the channel's frequency.
     * @param {Integer} lChannel TV channel number.
     * @returns {Integer} Pointer to a variable indicating whether the channel's frequency was found; nonzero indicates found, zero indicates not found.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-autotune
     */
    AutoTune(lChannel) {
        result := ComCall(20, this, "int", lChannel, "int*", &plFoundSignal := 0, "HRESULT")
        return plFoundSignal
    }

    /**
     * The StoreAutoTune method saves the fine-tuning information for all channels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-storeautotune
     */
    StoreAutoTune() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * The get_NumInputConnections method retrieves the number of TV sources plugged into the tuner filter.
     * @returns {Integer} Pointer to a variable that receives the number of TV sources plugged into the tuner filter.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-get_numinputconnections
     */
    get_NumInputConnections() {
        result := ComCall(22, this, "int*", &plNumInputConnections := 0, "HRESULT")
        return plNumInputConnections
    }

    /**
     * The put_InputType method sets the tuner input type (cable or antenna).
     * @param {Integer} lIndex Index value that specifies the input pin to be set.
     * @param {Integer} InputType Value indicating the connection type, as specified in the [TunerInputType](/windows/desktop/api/strmif/ne-strmif-tunerinputtype) enumeration.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-put_inputtype
     */
    put_InputType(lIndex, InputType) {
        result := ComCall(23, this, "int", lIndex, "int", InputType, "HRESULT")
        return result
    }

    /**
     * The get_InputType method retrieves the input type set in IAMTVTuner::put_InputType.
     * @param {Integer} lIndex Index value that specifies the input pin that will be set.
     * @returns {Integer} Pointer to a variable the receives a member of the [TunerInputType](/windows/desktop/api/strmif/ne-strmif-tunerinputtype) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-get_inputtype
     */
    get_InputType(lIndex) {
        result := ComCall(24, this, "int", lIndex, "int*", &pInputType := 0, "HRESULT")
        return pInputType
    }

    /**
     * The put_ConnectInput method sets the hardware tuner input connection.
     * @param {Integer} lIndex Index value of the input pin to set connection for.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-put_connectinput
     */
    put_ConnectInput(lIndex) {
        result := ComCall(25, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * The get_ConnectInput method retrieves the hardware tuner input connection.
     * @returns {Integer} Pointer to the input pin to get the connection for.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-get_connectinput
     */
    get_ConnectInput() {
        result := ComCall(26, this, "int*", &plIndex := 0, "HRESULT")
        return plIndex
    }

    /**
     * The get_VideoFrequency method retrieves the current video frequency.
     * @returns {Integer} Pointer to a variable that receives the video frequency, in hertz (Hz).
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-get_videofrequency
     */
    get_VideoFrequency() {
        result := ComCall(27, this, "int*", &lFreq := 0, "HRESULT")
        return lFreq
    }

    /**
     * The get_AudioFrequency method retrieves the currently tuned audio frequency.
     * @returns {Integer} Pointer to a variable that receives the audio frequency, in hertz (Hz).
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvtuner-get_audiofrequency
     */
    get_AudioFrequency() {
        result := ComCall(28, this, "int*", &lFreq := 0, "HRESULT")
        return lFreq
    }
}
