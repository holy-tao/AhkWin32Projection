#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidTuner.ahk

/**
 * The IMSVidAnalogTuner interface represents an analog-only tuner card that does not support the Broadcast Driver Architecture (BDA). This interface provides Automation access to the IAMTVTuner and IAMTVAudio interfaces.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAnalogTuner)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidanalogtuner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidAnalogTuner extends IMSVidTuner{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidAnalogTuner
     * @type {Guid}
     */
    static IID => Guid("{1c15d47e-911d-11d2-b632-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Channel", "put_Channel", "get_VideoFrequency", "get_AudioFrequency", "get_CountryCode", "put_CountryCode", "get_SAP", "put_SAP", "ChannelAvailable"]

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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-get_channel
     */
    get_Channel() {
        result := ComCall(22, this, "int*", &Channel := 0, "HRESULT")
        return Channel
    }

    /**
     * The put_Channel method specifies the tuner's channel.
     * @param {Integer} Channel Specifies the channel.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-put_channel
     */
    put_Channel(Channel) {
        result := ComCall(23, this, "int", Channel, "HRESULT")
        return result
    }

    /**
     * The get_VideoFrequency method retrieves the tuner's video frequency for testing purposes.
     * @returns {Integer} Pointer to a variable that receives the video frequency, in hertz (Hz).
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-get_videofrequency
     */
    get_VideoFrequency() {
        result := ComCall(24, this, "int*", &lcc := 0, "HRESULT")
        return lcc
    }

    /**
     * The get_AudioFrequency method retrieves the tuner's audio frequency.
     * @returns {Integer} Pointer to a variable that receives the audio frequency, in hertz (Hz).
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-get_audiofrequency
     */
    get_AudioFrequency() {
        result := ComCall(25, this, "int*", &lcc := 0, "HRESULT")
        return lcc
    }

    /**
     * The get_CountryCode method retrieves the tuner's country/region code.
     * @returns {Integer} Pointer to a variable that receives the country/region code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(26, this, "int*", &lcc := 0, "HRESULT")
        return lcc
    }

    /**
     * The put_CountryCode method specifies the tuner's country/region code.
     * @param {Integer} lcc Specifies the international country/region code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-put_countrycode
     */
    put_CountryCode(lcc) {
        result := ComCall(27, this, "int", lcc, "HRESULT")
        return result
    }

    /**
     * The get_SAP method retrieves the tuner's SAP setting to enable secondary audio components.
     * @returns {VARIANT_BOOL} Pointer to a flag indicating whether SAP is on.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-get_sap
     */
    get_SAP() {
        result := ComCall(28, this, "short*", &pfSapOn := 0, "HRESULT")
        return pfSapOn
    }

    /**
     * The put_SAP method specifies the tuner's SAP setting to enable secondary audio components.
     * @param {VARIANT_BOOL} fSapOn Flag indicating whether to enable or disable SAP.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-put_sap
     */
    put_SAP(fSapOn) {
        result := ComCall(29, this, "short", fSapOn, "HRESULT")
        return result
    }

    /**
     * The ChannelAvailable method queries whether a specified channel is available for viewing.
     * @param {Integer} nChannel Integer containing the channel.
     * @param {Pointer<Integer>} SignalStrength Pointer to a <b>long</b> value that specifies the signal strength.
     * @returns {VARIANT_BOOL} Receives a <b>VARIANT_BOOL</b> that indicates whether a signal is present.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner-channelavailable
     */
    ChannelAvailable(nChannel, SignalStrength) {
        SignalStrengthMarshal := SignalStrength is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, "int", nChannel, SignalStrengthMarshal, SignalStrength, "short*", &fSignalPresent := 0, "HRESULT")
        return fSignalPresent
    }
}
