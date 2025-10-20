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
     * 
     * @param {Pointer<Int32>} Channel 
     * @returns {HRESULT} 
     */
    get_Channel(Channel) {
        result := ComCall(22, this, "int*", Channel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Channel 
     * @returns {HRESULT} 
     */
    put_Channel(Channel) {
        result := ComCall(23, this, "int", Channel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lcc 
     * @returns {HRESULT} 
     */
    get_VideoFrequency(lcc) {
        result := ComCall(24, this, "int*", lcc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lcc 
     * @returns {HRESULT} 
     */
    get_AudioFrequency(lcc) {
        result := ComCall(25, this, "int*", lcc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lcc 
     * @returns {HRESULT} 
     */
    get_CountryCode(lcc) {
        result := ComCall(26, this, "int*", lcc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcc 
     * @returns {HRESULT} 
     */
    put_CountryCode(lcc) {
        result := ComCall(27, this, "int", lcc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfSapOn 
     * @returns {HRESULT} 
     */
    get_SAP(pfSapOn) {
        result := ComCall(28, this, "ptr", pfSapOn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSapOn 
     * @returns {HRESULT} 
     */
    put_SAP(fSapOn) {
        result := ComCall(29, this, "short", fSapOn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Int32>} SignalStrength 
     * @param {Pointer<VARIANT_BOOL>} fSignalPresent 
     * @returns {HRESULT} 
     */
    ChannelAvailable(nChannel, SignalStrength, fSignalPresent) {
        result := ComCall(30, this, "int", nChannel, "int*", SignalStrength, "ptr", fSignalPresent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
