#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_LNBInfo interface is implemented on a BDA device filter, specifically an LNB device. The methods are called by the Network Provider to instruct the device on how to acquire the satellite signal.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_LNBInfo)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_lnbinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_LNBInfo extends IUnknown{
    /**
     * The interface identifier for IBDA_LNBInfo
     * @type {Guid}
     */
    static IID => Guid("{992cf102-49f9-4719-a664-c4f23e2408f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ulLOFLow 
     * @returns {HRESULT} 
     */
    put_LocalOscilatorFrequencyLowBand(ulLOFLow) {
        result := ComCall(3, this, "uint", ulLOFLow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulLOFLow 
     * @returns {HRESULT} 
     */
    get_LocalOscilatorFrequencyLowBand(pulLOFLow) {
        result := ComCall(4, this, "uint*", pulLOFLow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulLOFHigh 
     * @returns {HRESULT} 
     */
    put_LocalOscilatorFrequencyHighBand(ulLOFHigh) {
        result := ComCall(5, this, "uint", ulLOFHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulLOFHigh 
     * @returns {HRESULT} 
     */
    get_LocalOscilatorFrequencyHighBand(pulLOFHigh) {
        result := ComCall(6, this, "uint*", pulLOFHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSwitchFrequency 
     * @returns {HRESULT} 
     */
    put_HighLowSwitchFrequency(ulSwitchFrequency) {
        result := ComCall(7, this, "uint", ulSwitchFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulSwitchFrequency 
     * @returns {HRESULT} 
     */
    get_HighLowSwitchFrequency(pulSwitchFrequency) {
        result := ComCall(8, this, "uint*", pulSwitchFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
