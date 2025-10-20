#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITimer extends IUnknown{
    /**
     * The interface identifier for ITimer
     * @type {Guid}
     */
    static IID => Guid("{3050f360-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {VARIANT} vtimeMin 
     * @param {VARIANT} vtimeMax 
     * @param {VARIANT} vtimeInterval 
     * @param {Integer} dwFlags 
     * @param {Pointer<ITimerSink>} pTimerSink 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    Advise(vtimeMin, vtimeMax, vtimeInterval, dwFlags, pTimerSink, pdwCookie) {
        result := ComCall(3, this, "ptr", vtimeMin, "ptr", vtimeMax, "ptr", vtimeInterval, "uint", dwFlags, "ptr", pTimerSink, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fFreeze 
     * @returns {HRESULT} 
     */
    Freeze(fFreeze) {
        result := ComCall(5, this, "int", fFreeze, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvtime 
     * @returns {HRESULT} 
     */
    GetTime(pvtime) {
        result := ComCall(6, this, "ptr", pvtime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
