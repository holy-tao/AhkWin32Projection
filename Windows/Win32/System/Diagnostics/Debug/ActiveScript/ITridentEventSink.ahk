#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class ITridentEventSink extends IUnknown{
    /**
     * The interface identifier for ITridentEventSink
     * @type {Guid}
     */
    static IID => Guid("{1dc9ca50-06ef-11d2-8415-006008c3fbfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pstrEvent 
     * @param {Pointer<DISPPARAMS>} pdp 
     * @param {Pointer<VARIANT>} pvarRes 
     * @param {Pointer<EXCEPINFO>} pei 
     * @returns {HRESULT} 
     */
    FireEvent(pstrEvent, pdp, pvarRes, pei) {
        pstrEvent := pstrEvent is String ? StrPtr(pstrEvent) : pstrEvent

        result := ComCall(3, this, "ptr", pstrEvent, "ptr", pdp, "ptr", pvarRes, "ptr", pei, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
