#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAMTuner.ahk" { IAMTuner }
#Import ".\TunerInputType.ahk" { TunerInputType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IAMTVTuner interface controls a TV tuner.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamtvtuner
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMTVTuner extends IAMTuner {
    /**
     * The interface identifier for IAMTVTuner
     * @type {Guid}
     */
    static IID := Guid("{211a8766-03ac-11d1-8d13-00aa00bd8339}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMTVTuner interfaces
    */
    struct Vtbl extends IAMTuner.Vtbl {
        get_AvailableTVFormats  : IntPtr
        get_TVFormat            : IntPtr
        AutoTune                : IntPtr
        StoreAutoTune           : IntPtr
        get_NumInputConnections : IntPtr
        put_InputType           : IntPtr
        get_InputType           : IntPtr
        put_ConnectInput        : IntPtr
        get_ConnectInput        : IntPtr
        get_VideoFrequency      : IntPtr
        get_AudioFrequency      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMTVTuner.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(18, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
    }

    /**
     * The get_TVFormat method retrieves the current analog video TV standard in use.
     * @returns {Integer} Pointer to a variable that receives a member of the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(19, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * The AutoTune method scans for a precise signal on the channel's frequency.
     * @remarks
     * TV channels generally map to a unique frequency depending on regional variances. To avoid interference between multiple transmitters that are assigned the same channel when they are in close geographic proximity, small frequency offsets are introduced at each transmitter. In the United States, this offset ranges up to +/– 26.25 kilohertz (kHz).
     * 
     * This method handles the channel-to-frequency conversion and scans for the most precise frequency. Store these values by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamtvtuner-storeautotune">IAMTVTuner::StoreAutoTune</a> method. You can find base frequencies for channels in the appendix <a href="https://docs.microsoft.com/windows/desktop/DirectShow/international-analog-tv-tuning">International Analog TV Tuning</a>.
     * @param {Integer} lChannel TV channel number.
     * @returns {Integer} Pointer to a variable indicating whether the channel's frequency was found; nonzero indicates found, zero indicates not found.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-autotune
     */
    AutoTune(lChannel) {
        result := ComCall(20, this, "int", lChannel, "int*", &plFoundSignal := 0, "HRESULT")
        return plFoundSignal
    }

    /**
     * The StoreAutoTune method saves the fine-tuning information for all channels.
     * @remarks
     * Override the channel-to-frequency information stored by this method by setting a new country/region code in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamtuner-put_countrycode">IAMTuner::put_CountryCode</a> method. For a listing of country/region codes, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/international-analog-tv-tuning">International Analog TV Tuning</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-storeautotune
     */
    StoreAutoTune() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * The get_NumInputConnections method retrieves the number of TV sources plugged into the tuner filter.
     * @returns {Integer} Pointer to a variable that receives the number of TV sources plugged into the tuner filter.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_numinputconnections
     */
    get_NumInputConnections() {
        result := ComCall(22, this, "int*", &plNumInputConnections := 0, "HRESULT")
        return plNumInputConnections
    }

    /**
     * The put_InputType method sets the tuner input type (cable or antenna).
     * @param {Integer} lIndex Index value that specifies the input pin to be set.
     * @param {TunerInputType} InputType Value indicating the connection type, as specified in the [TunerInputType](/windows/desktop/api/strmif/ne-strmif-tunerinputtype) enumeration.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-put_inputtype
     */
    put_InputType(lIndex, InputType) {
        result := ComCall(23, this, "int", lIndex, TunerInputType, InputType, "HRESULT")
        return result
    }

    /**
     * The get_InputType method retrieves the input type set in IAMTVTuner::put_InputType.
     * @param {Integer} lIndex Index value that specifies the input pin that will be set.
     * @returns {TunerInputType} Pointer to a variable the receives a member of the [TunerInputType](/windows/desktop/api/strmif/ne-strmif-tunerinputtype) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_inputtype
     */
    get_InputType(lIndex) {
        result := ComCall(24, this, "int", lIndex, "int*", &pInputType := 0, "HRESULT")
        return pInputType
    }

    /**
     * The put_ConnectInput method sets the hardware tuner input connection.
     * @param {Integer} lIndex Index value of the input pin to set connection for.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-put_connectinput
     */
    put_ConnectInput(lIndex) {
        result := ComCall(25, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * The get_ConnectInput method retrieves the hardware tuner input connection.
     * @returns {Integer} Pointer to the input pin to get the connection for.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_connectinput
     */
    get_ConnectInput() {
        result := ComCall(26, this, "int*", &plIndex := 0, "HRESULT")
        return plIndex
    }

    /**
     * The get_VideoFrequency method retrieves the current video frequency.
     * @remarks
     * This is a diagnostic method that enables you to examine the exact frequency being used for a given channel.
     * @returns {Integer} Pointer to a variable that receives the video frequency, in hertz (Hz).
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_videofrequency
     */
    get_VideoFrequency() {
        result := ComCall(27, this, "int*", &lFreq := 0, "HRESULT")
        return lFreq
    }

    /**
     * The get_AudioFrequency method retrieves the currently tuned audio frequency.
     * @remarks
     * This is a diagnostic method that enables you to examine the exact frequency being used for a given channel.
     * @returns {Integer} Pointer to a variable that receives the audio frequency, in hertz (Hz).
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvtuner-get_audiofrequency
     */
    get_AudioFrequency() {
        result := ComCall(28, this, "int*", &lFreq := 0, "HRESULT")
        return lFreq
    }

    Query(iid) {
        if (IAMTVTuner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AvailableTVFormats := CallbackCreate(GetMethod(implObj, "get_AvailableTVFormats"), flags, 2)
        this.vtbl.get_TVFormat := CallbackCreate(GetMethod(implObj, "get_TVFormat"), flags, 2)
        this.vtbl.AutoTune := CallbackCreate(GetMethod(implObj, "AutoTune"), flags, 3)
        this.vtbl.StoreAutoTune := CallbackCreate(GetMethod(implObj, "StoreAutoTune"), flags, 1)
        this.vtbl.get_NumInputConnections := CallbackCreate(GetMethod(implObj, "get_NumInputConnections"), flags, 2)
        this.vtbl.put_InputType := CallbackCreate(GetMethod(implObj, "put_InputType"), flags, 3)
        this.vtbl.get_InputType := CallbackCreate(GetMethod(implObj, "get_InputType"), flags, 3)
        this.vtbl.put_ConnectInput := CallbackCreate(GetMethod(implObj, "put_ConnectInput"), flags, 2)
        this.vtbl.get_ConnectInput := CallbackCreate(GetMethod(implObj, "get_ConnectInput"), flags, 2)
        this.vtbl.get_VideoFrequency := CallbackCreate(GetMethod(implObj, "get_VideoFrequency"), flags, 2)
        this.vtbl.get_AudioFrequency := CallbackCreate(GetMethod(implObj, "get_AudioFrequency"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AvailableTVFormats)
        CallbackFree(this.vtbl.get_TVFormat)
        CallbackFree(this.vtbl.AutoTune)
        CallbackFree(this.vtbl.StoreAutoTune)
        CallbackFree(this.vtbl.get_NumInputConnections)
        CallbackFree(this.vtbl.put_InputType)
        CallbackFree(this.vtbl.get_InputType)
        CallbackFree(this.vtbl.put_ConnectInput)
        CallbackFree(this.vtbl.get_ConnectInput)
        CallbackFree(this.vtbl.get_VideoFrequency)
        CallbackFree(this.vtbl.get_AudioFrequency)
    }
}
