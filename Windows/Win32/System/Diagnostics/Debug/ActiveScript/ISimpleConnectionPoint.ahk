#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class ISimpleConnectionPoint extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pulCount 
     * @returns {HRESULT} 
     */
    GetEventCount(pulCount) {
        result := ComCall(3, this, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iEvent 
     * @param {Integer} cEvents 
     * @param {Pointer<Int32>} prgid 
     * @param {Pointer<BSTR>} prgbstr 
     * @param {Pointer<UInt32>} pcEventsFetched 
     * @returns {HRESULT} 
     */
    DescribeEvents(iEvent, cEvents, prgid, prgbstr, pcEventsFetched) {
        result := ComCall(4, this, "uint", iEvent, "uint", cEvents, "int*", prgid, "ptr", prgbstr, "uint*", pcEventsFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pdisp 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    Advise(pdisp, pdwCookie) {
        result := ComCall(5, this, "ptr", pdisp, "uint*", pdwCookie, "int")
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
        result := ComCall(6, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
