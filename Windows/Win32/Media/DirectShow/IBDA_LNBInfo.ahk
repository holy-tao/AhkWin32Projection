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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_LocalOscilatorFrequencyLowBand", "get_LocalOscilatorFrequencyLowBand", "put_LocalOscilatorFrequencyHighBand", "get_LocalOscilatorFrequencyHighBand", "put_HighLowSwitchFrequency", "get_HighLowSwitchFrequency"]

    /**
     * 
     * @param {Integer} ulLOFLow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-put_localoscilatorfrequencylowband
     */
    put_LocalOscilatorFrequencyLowBand(ulLOFLow) {
        result := ComCall(3, this, "uint", ulLOFLow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulLOFLow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-get_localoscilatorfrequencylowband
     */
    get_LocalOscilatorFrequencyLowBand(pulLOFLow) {
        result := ComCall(4, this, "uint*", pulLOFLow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulLOFHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-put_localoscilatorfrequencyhighband
     */
    put_LocalOscilatorFrequencyHighBand(ulLOFHigh) {
        result := ComCall(5, this, "uint", ulLOFHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulLOFHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-get_localoscilatorfrequencyhighband
     */
    get_LocalOscilatorFrequencyHighBand(pulLOFHigh) {
        result := ComCall(6, this, "uint*", pulLOFHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulSwitchFrequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-put_highlowswitchfrequency
     */
    put_HighLowSwitchFrequency(ulSwitchFrequency) {
        result := ComCall(7, this, "uint", ulSwitchFrequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulSwitchFrequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-get_highlowswitchfrequency
     */
    get_HighLowSwitchFrequency(pulSwitchFrequency) {
        result := ComCall(8, this, "uint*", pulSwitchFrequency, "HRESULT")
        return result
    }
}
