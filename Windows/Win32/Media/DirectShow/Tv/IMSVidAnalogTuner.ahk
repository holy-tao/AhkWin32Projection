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
     * 
     * @param {Pointer<Integer>} Channel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_channel
     */
    get_Channel(Channel) {
        ChannelMarshal := Channel is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, ChannelMarshal, Channel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Channel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-put_channel
     */
    put_Channel(Channel) {
        result := ComCall(23, this, "int", Channel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_videofrequency
     */
    get_VideoFrequency(lcc) {
        lccMarshal := lcc is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, lccMarshal, lcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_audiofrequency
     */
    get_AudioFrequency(lcc) {
        lccMarshal := lcc is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, lccMarshal, lcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_countrycode
     */
    get_CountryCode(lcc) {
        lccMarshal := lcc is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, lccMarshal, lcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-put_countrycode
     */
    put_CountryCode(lcc) {
        result := ComCall(27, this, "int", lcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfSapOn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-get_sap
     */
    get_SAP(pfSapOn) {
        result := ComCall(28, this, "ptr", pfSapOn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSapOn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-put_sap
     */
    put_SAP(fSapOn) {
        result := ComCall(29, this, "short", fSapOn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Integer>} SignalStrength 
     * @param {Pointer<VARIANT_BOOL>} fSignalPresent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner-channelavailable
     */
    ChannelAvailable(nChannel, SignalStrength, fSignalPresent) {
        SignalStrengthMarshal := SignalStrength is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, "int", nChannel, SignalStrengthMarshal, SignalStrength, "ptr", fSignalPresent, "HRESULT")
        return result
    }
}
