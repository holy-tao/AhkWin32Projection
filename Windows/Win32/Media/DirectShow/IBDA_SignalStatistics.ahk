#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_SignalStatistics interface is implemented on a BDA device filter and provides methods by which the filter can describe the condition of a signal that is being received.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_SignalStatistics)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_signalstatistics
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_SignalStatistics extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_SignalStatistics
     * @type {Guid}
     */
    static IID => Guid("{1347d106-cf3a-428a-a5cb-ac0d9a2a4338}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_SignalStrength", "get_SignalStrength", "put_SignalQuality", "get_SignalQuality", "put_SignalPresent", "get_SignalPresent", "put_SignalLocked", "get_SignalLocked", "put_SampleTime", "get_SampleTime"]

    /**
     * 
     * @param {Integer} lDbStrength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_signalstrength
     */
    put_SignalStrength(lDbStrength) {
        result := ComCall(3, this, "int", lDbStrength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDbStrength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_signalstrength
     */
    get_SignalStrength(plDbStrength) {
        plDbStrengthMarshal := plDbStrength is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plDbStrengthMarshal, plDbStrength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPercentQuality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_signalquality
     */
    put_SignalQuality(lPercentQuality) {
        result := ComCall(5, this, "int", lPercentQuality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPercentQuality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_signalquality
     */
    get_SignalQuality(plPercentQuality) {
        plPercentQualityMarshal := plPercentQuality is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, plPercentQualityMarshal, plPercentQuality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} fPresent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_signalpresent
     */
    put_SignalPresent(fPresent) {
        result := ComCall(7, this, "char", fPresent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pfPresent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_signalpresent
     */
    get_SignalPresent(pfPresent) {
        pfPresentMarshal := pfPresent is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pfPresentMarshal, pfPresent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} fLocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_signallocked
     */
    put_SignalLocked(fLocked) {
        result := ComCall(9, this, "char", fLocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pfLocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_signallocked
     */
    get_SignalLocked(pfLocked) {
        pfLockedMarshal := pfLocked is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pfLockedMarshal, pfLocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lmsSampleTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_sampletime
     */
    put_SampleTime(lmsSampleTime) {
        result := ComCall(11, this, "int", lmsSampleTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plmsSampleTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_sampletime
     */
    get_SampleTime(plmsSampleTime) {
        plmsSampleTimeMarshal := plmsSampleTime is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plmsSampleTimeMarshal, plmsSampleTime, "HRESULT")
        return result
    }
}
