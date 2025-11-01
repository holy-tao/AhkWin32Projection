#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class ISimpleConnectionPoint extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimpleConnectionPoint
     * @type {Guid}
     */
    static IID => Guid("{51973c3e-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventCount", "DescribeEvents", "Advise", "Unadvise"]

    /**
     * 
     * @param {Pointer<Integer>} pulCount 
     * @returns {HRESULT} 
     */
    GetEventCount(pulCount) {
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulCountMarshal, pulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iEvent 
     * @param {Integer} cEvents 
     * @param {Pointer<Integer>} prgid 
     * @param {Pointer<BSTR>} prgbstr 
     * @param {Pointer<Integer>} pcEventsFetched 
     * @returns {HRESULT} 
     */
    DescribeEvents(iEvent, cEvents, prgid, prgbstr, pcEventsFetched) {
        prgidMarshal := prgid is VarRef ? "int*" : "ptr"
        pcEventsFetchedMarshal := pcEventsFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", iEvent, "uint", cEvents, prgidMarshal, prgid, "ptr", prgbstr, pcEventsFetchedMarshal, pcEventsFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     */
    Advise(pdisp, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pdisp, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
