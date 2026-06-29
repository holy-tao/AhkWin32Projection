#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidTuner.ahk" { IMSVidTuner }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IMSVidAnalogTuner interface represents an analog-only tuner card that does not support the Broadcast Driver Architecture (BDA). This interface provides Automation access to the IAMTVTuner and IAMTVAudio interfaces.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAnalogTuner)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidanalogtuner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidAnalogTuner extends IMSVidTuner {
    /**
     * The interface identifier for IMSVidAnalogTuner
     * @type {Guid}
     */
    static IID := Guid("{1c15d47e-911d-11d2-b632-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidAnalogTuner interfaces
    */
    struct Vtbl extends IMSVidTuner.Vtbl {
        get_Channel        : IntPtr
        put_Channel        : IntPtr
        get_VideoFrequency : IntPtr
        get_AudioFrequency : IntPtr
        get_CountryCode    : IntPtr
        put_CountryCode    : IntPtr
        get_SAP            : IntPtr
        put_SAP            : IntPtr
        ChannelAvailable   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidAnalogTuner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
        set => this.put_Channel(value)
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
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
        set => this.put_CountryCode(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SAP {
        get => this.get_SAP()
        set => this.put_SAP(value)
    }

    /**
     * The get_Channel method retrieves the tuner's current channel.
     * @returns {Integer} Pointer to a variable that receives the channel.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_channel
     */
    get_Channel() {
        result := ComCall(22, this, "int*", &Channel := 0, "HRESULT")
        return Channel
    }

    /**
     * The put_Channel method specifies the tuner's channel.
     * @param {Integer} Channel Specifies the channel.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-put_channel
     */
    put_Channel(Channel) {
        result := ComCall(23, this, "int", Channel, "HRESULT")
        return result
    }

    /**
     * The get_VideoFrequency method retrieves the tuner's video frequency for testing purposes.
     * @remarks
     * This method is intended for diagnostic and testing purposes.
     * @returns {Integer} Pointer to a variable that receives the video frequency, in hertz (Hz).
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_videofrequency
     */
    get_VideoFrequency() {
        result := ComCall(24, this, "int*", &lcc := 0, "HRESULT")
        return lcc
    }

    /**
     * The get_AudioFrequency method retrieves the tuner's audio frequency.
     * @remarks
     * This method is intended for diagnostic and testing purposes.
     * @returns {Integer} Pointer to a variable that receives the audio frequency, in hertz (Hz).
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_audiofrequency
     */
    get_AudioFrequency() {
        result := ComCall(25, this, "int*", &lcc := 0, "HRESULT")
        return lcc
    }

    /**
     * The get_CountryCode method retrieves the tuner's country/region code.
     * @remarks
     * Do not confuse the international country/region code with the LCID. The country/region code establishes the mapping between channel numbers and frequencies.
     * @returns {Integer} Pointer to a variable that receives the country/region code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(26, this, "int*", &lcc := 0, "HRESULT")
        return lcc
    }

    /**
     * The put_CountryCode method specifies the tuner's country/region code.
     * @remarks
     * Do not confuse the international country/region code with the LCID. The country/region code establishes the mapping between channel numbers and frequencies.
     * @param {Integer} lcc Specifies the international country/region code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-put_countrycode
     */
    put_CountryCode(lcc) {
        result := ComCall(27, this, "int", lcc, "HRESULT")
        return result
    }

    /**
     * The get_SAP method retrieves the tuner's SAP setting to enable secondary audio components.
     * @returns {VARIANT_BOOL} Pointer to a flag indicating whether SAP is on.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_sap
     */
    get_SAP() {
        result := ComCall(28, this, VARIANT_BOOL.Ptr, &pfSapOn := 0, "HRESULT")
        return pfSapOn
    }

    /**
     * The put_SAP method specifies the tuner's SAP setting to enable secondary audio components.
     * @param {VARIANT_BOOL} fSapOn Flag indicating whether to enable or disable SAP.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-put_sap
     */
    put_SAP(fSapOn) {
        result := ComCall(29, this, VARIANT_BOOL, fSapOn, "HRESULT")
        return result
    }

    /**
     * The ChannelAvailable method queries whether a specified channel is available for viewing.
     * @param {Integer} nChannel Integer containing the channel.
     * @param {Pointer<Integer>} SignalStrength Pointer to a <b>long</b> value that specifies the signal strength.
     * @returns {VARIANT_BOOL} Receives a <b>VARIANT_BOOL</b> that indicates whether a signal is present.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-channelavailable
     */
    ChannelAvailable(nChannel, SignalStrength) {
        SignalStrengthMarshal := SignalStrength is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, "int", nChannel, SignalStrengthMarshal, SignalStrength, VARIANT_BOOL.Ptr, &fSignalPresent := 0, "HRESULT")
        return fSignalPresent
    }

    Query(iid) {
        if (IMSVidAnalogTuner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Channel := CallbackCreate(GetMethod(implObj, "get_Channel"), flags, 2)
        this.vtbl.put_Channel := CallbackCreate(GetMethod(implObj, "put_Channel"), flags, 2)
        this.vtbl.get_VideoFrequency := CallbackCreate(GetMethod(implObj, "get_VideoFrequency"), flags, 2)
        this.vtbl.get_AudioFrequency := CallbackCreate(GetMethod(implObj, "get_AudioFrequency"), flags, 2)
        this.vtbl.get_CountryCode := CallbackCreate(GetMethod(implObj, "get_CountryCode"), flags, 2)
        this.vtbl.put_CountryCode := CallbackCreate(GetMethod(implObj, "put_CountryCode"), flags, 2)
        this.vtbl.get_SAP := CallbackCreate(GetMethod(implObj, "get_SAP"), flags, 2)
        this.vtbl.put_SAP := CallbackCreate(GetMethod(implObj, "put_SAP"), flags, 2)
        this.vtbl.ChannelAvailable := CallbackCreate(GetMethod(implObj, "ChannelAvailable"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Channel)
        CallbackFree(this.vtbl.put_Channel)
        CallbackFree(this.vtbl.get_VideoFrequency)
        CallbackFree(this.vtbl.get_AudioFrequency)
        CallbackFree(this.vtbl.get_CountryCode)
        CallbackFree(this.vtbl.put_CountryCode)
        CallbackFree(this.vtbl.get_SAP)
        CallbackFree(this.vtbl.put_SAP)
        CallbackFree(this.vtbl.ChannelAvailable)
    }
}
