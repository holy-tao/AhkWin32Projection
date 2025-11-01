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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Duration", "put_CurrentPosition", "get_CurrentPosition", "get_StopTime", "put_StopTime", "get_PrerollTime", "put_PrerollTime", "put_Rate", "get_Rate", "CanSeekForward", "CanSeekBackward"]

    /**
     * 
     * @param {Pointer<Float>} plength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-get_duration
     */
    get_Duration(plength) {
        plengthMarshal := plength is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, plengthMarshal, plength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} llTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-put_currentposition
     */
    put_CurrentPosition(llTime) {
        result := ComCall(8, this, "double", llTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pllTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-get_currentposition
     */
    get_CurrentPosition(pllTime) {
        pllTimeMarshal := pllTime is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, pllTimeMarshal, pllTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pllTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-get_stoptime
     */
    get_StopTime(pllTime) {
        pllTimeMarshal := pllTime is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, pllTimeMarshal, pllTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} llTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-put_stoptime
     */
    put_StopTime(llTime) {
        result := ComCall(11, this, "double", llTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pllTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-get_prerolltime
     */
    get_PrerollTime(pllTime) {
        pllTimeMarshal := pllTime is VarRef ? "double*" : "ptr"

        result := ComCall(12, this, pllTimeMarshal, pllTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} llTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-put_prerolltime
     */
    put_PrerollTime(llTime) {
        result := ComCall(13, this, "double", llTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-put_rate
     */
    put_Rate(dRate) {
        result := ComCall(14, this, "double", dRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-get_rate
     */
    get_Rate(pdRate) {
        pdRateMarshal := pdRate is VarRef ? "double*" : "ptr"

        result := ComCall(15, this, pdRateMarshal, pdRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCanSeekForward 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-canseekforward
     */
    CanSeekForward(pCanSeekForward) {
        pCanSeekForwardMarshal := pCanSeekForward is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pCanSeekForwardMarshal, pCanSeekForward, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCanSeekBackward 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaposition-canseekbackward
     */
    CanSeekBackward(pCanSeekBackward) {
        pCanSeekBackwardMarshal := pCanSeekBackward is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pCanSeekBackwardMarshal, pCanSeekBackward, "HRESULT")
        return result
    }
}
