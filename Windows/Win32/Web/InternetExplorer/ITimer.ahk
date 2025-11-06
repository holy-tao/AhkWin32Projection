#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITimer extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "Freeze", "GetTime"]

    /**
     * 
     * @param {VARIANT} vtimeMin 
     * @param {VARIANT} vtimeMax 
     * @param {VARIANT} vtimeInterval 
     * @param {Integer} dwFlags 
     * @param {ITimerSink} pTimerSink 
     * @returns {Integer} 
     */
    Advise(vtimeMin, vtimeMax, vtimeInterval, dwFlags, pTimerSink) {
        result := ComCall(3, this, "ptr", vtimeMin, "ptr", vtimeMax, "ptr", vtimeInterval, "uint", dwFlags, "ptr", pTimerSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFreeze 
     * @returns {HRESULT} 
     */
    Freeze(fFreeze) {
        result := ComCall(5, this, "int", fFreeze, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    GetTime() {
        pvtime := VARIANT()
        result := ComCall(6, this, "ptr", pvtime, "HRESULT")
        return pvtime
    }
}
