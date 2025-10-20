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
     * 
     * @param {Integer} lDbStrength 
     * @returns {HRESULT} 
     */
    put_SignalStrength(lDbStrength) {
        result := ComCall(3, this, "int", lDbStrength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDbStrength 
     * @returns {HRESULT} 
     */
    get_SignalStrength(plDbStrength) {
        result := ComCall(4, this, "int*", plDbStrength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPercentQuality 
     * @returns {HRESULT} 
     */
    put_SignalQuality(lPercentQuality) {
        result := ComCall(5, this, "int", lPercentQuality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPercentQuality 
     * @returns {HRESULT} 
     */
    get_SignalQuality(plPercentQuality) {
        result := ComCall(6, this, "int*", plPercentQuality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOLEAN} fPresent 
     * @returns {HRESULT} 
     */
    put_SignalPresent(fPresent) {
        result := ComCall(7, this, "char", fPresent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pfPresent 
     * @returns {HRESULT} 
     */
    get_SignalPresent(pfPresent) {
        result := ComCall(8, this, "char*", pfPresent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOLEAN} fLocked 
     * @returns {HRESULT} 
     */
    put_SignalLocked(fLocked) {
        result := ComCall(9, this, "char", fLocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pfLocked 
     * @returns {HRESULT} 
     */
    get_SignalLocked(pfLocked) {
        result := ComCall(10, this, "char*", pfLocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lmsSampleTime 
     * @returns {HRESULT} 
     */
    put_SampleTime(lmsSampleTime) {
        result := ComCall(11, this, "int", lmsSampleTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plmsSampleTime 
     * @returns {HRESULT} 
     */
    get_SampleTime(plmsSampleTime) {
        result := ComCall(12, this, "int*", plmsSampleTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
