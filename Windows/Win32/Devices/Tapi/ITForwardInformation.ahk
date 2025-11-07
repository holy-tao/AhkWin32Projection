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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_NumRingsNoAnswer", "get_NumRingsNoAnswer", "SetForwardType", "get_ForwardTypeDestination", "get_ForwardTypeCaller", "GetForwardType", "Clear"]

    /**
     * 
     * @param {Integer} lNumRings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-put_numringsnoanswer
     */
    put_NumRingsNoAnswer(lNumRings) {
        result := ComCall(7, this, "int", lNumRings, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-get_numringsnoanswer
     */
    get_NumRingsNoAnswer() {
        result := ComCall(8, this, "int*", &plNumRings := 0, "HRESULT")
        return plNumRings
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {BSTR} pDestAddress 
     * @param {BSTR} pCallerAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-setforwardtype
     */
    SetForwardType(ForwardType, pDestAddress, pCallerAddress) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pCallerAddress := pCallerAddress is String ? BSTR.Alloc(pCallerAddress).Value : pCallerAddress

        result := ComCall(9, this, "int", ForwardType, "ptr", pDestAddress, "ptr", pCallerAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-get_forwardtypedestination
     */
    get_ForwardTypeDestination(ForwardType) {
        ppDestAddress := BSTR()
        result := ComCall(10, this, "int", ForwardType, "ptr", ppDestAddress, "HRESULT")
        return ppDestAddress
    }

    /**
     * 
     * @param {Integer} Forwardtype 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-get_forwardtypecaller
     */
    get_ForwardTypeCaller(Forwardtype) {
        ppCallerAddress := BSTR()
        result := ComCall(11, this, "int", Forwardtype, "ptr", ppCallerAddress, "HRESULT")
        return ppCallerAddress
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {Pointer<BSTR>} ppDestinationAddress 
     * @param {Pointer<BSTR>} ppCallerAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-getforwardtype
     */
    GetForwardType(ForwardType, ppDestinationAddress, ppCallerAddress) {
        result := ComCall(12, this, "int", ForwardType, "ptr", ppDestinationAddress, "ptr", ppCallerAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-clear
     */
    Clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
