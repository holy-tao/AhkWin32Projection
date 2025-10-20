#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITForwardInformation interface provides methods for setup and implementation of call forwarding.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itforwardinformation
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITForwardInformation extends IDispatch{
    /**
     * The interface identifier for ITForwardInformation
     * @type {Guid}
     */
    static IID => Guid("{449f659e-88a3-11d1-bb5d-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} lNumRings 
     * @returns {HRESULT} 
     */
    put_NumRingsNoAnswer(lNumRings) {
        result := ComCall(7, this, "int", lNumRings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plNumRings 
     * @returns {HRESULT} 
     */
    get_NumRingsNoAnswer(plNumRings) {
        result := ComCall(8, this, "int*", plNumRings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {BSTR} pDestAddress 
     * @param {BSTR} pCallerAddress 
     * @returns {HRESULT} 
     */
    SetForwardType(ForwardType, pDestAddress, pCallerAddress) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pCallerAddress := pCallerAddress is String ? BSTR.Alloc(pCallerAddress).Value : pCallerAddress

        result := ComCall(9, this, "int", ForwardType, "ptr", pDestAddress, "ptr", pCallerAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {Pointer<BSTR>} ppDestAddress 
     * @returns {HRESULT} 
     */
    get_ForwardTypeDestination(ForwardType, ppDestAddress) {
        result := ComCall(10, this, "int", ForwardType, "ptr", ppDestAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Forwardtype 
     * @param {Pointer<BSTR>} ppCallerAddress 
     * @returns {HRESULT} 
     */
    get_ForwardTypeCaller(Forwardtype, ppCallerAddress) {
        result := ComCall(11, this, "int", Forwardtype, "ptr", ppCallerAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {Pointer<BSTR>} ppDestinationAddress 
     * @param {Pointer<BSTR>} ppCallerAddress 
     * @returns {HRESULT} 
     */
    GetForwardType(ForwardType, ppDestinationAddress, ppCallerAddress) {
        result := ComCall(12, this, "int", ForwardType, "ptr", ppDestinationAddress, "ptr", ppCallerAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
