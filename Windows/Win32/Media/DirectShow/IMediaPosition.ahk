#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaPosition interface contains methods for seeking to a position within a stream.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediaposition
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaPosition extends IDispatch{
    /**
     * The interface identifier for IMediaPosition
     * @type {Guid}
     */
    static IID => Guid("{56a868b2-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Double>} plength 
     * @returns {HRESULT} 
     */
    get_Duration(plength) {
        result := ComCall(7, this, "double*", plength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} llTime 
     * @returns {HRESULT} 
     */
    put_CurrentPosition(llTime) {
        result := ComCall(8, this, "double", llTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pllTime 
     * @returns {HRESULT} 
     */
    get_CurrentPosition(pllTime) {
        result := ComCall(9, this, "double*", pllTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pllTime 
     * @returns {HRESULT} 
     */
    get_StopTime(pllTime) {
        result := ComCall(10, this, "double*", pllTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} llTime 
     * @returns {HRESULT} 
     */
    put_StopTime(llTime) {
        result := ComCall(11, this, "double", llTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pllTime 
     * @returns {HRESULT} 
     */
    get_PrerollTime(pllTime) {
        result := ComCall(12, this, "double*", pllTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} llTime 
     * @returns {HRESULT} 
     */
    put_PrerollTime(llTime) {
        result := ComCall(13, this, "double", llTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dRate 
     * @returns {HRESULT} 
     */
    put_Rate(dRate) {
        result := ComCall(14, this, "double", dRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdRate 
     * @returns {HRESULT} 
     */
    get_Rate(pdRate) {
        result := ComCall(15, this, "double*", pdRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCanSeekForward 
     * @returns {HRESULT} 
     */
    CanSeekForward(pCanSeekForward) {
        result := ComCall(16, this, "int*", pCanSeekForward, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCanSeekBackward 
     * @returns {HRESULT} 
     */
    CanSeekBackward(pCanSeekBackward) {
        result := ComCall(17, this, "int*", pCanSeekBackward, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
