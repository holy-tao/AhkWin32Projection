#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITForwardInformation.ahk

/**
 * The ITForwardInformation2 interface exposes methods that provide additional methods for the control of forwarding information. See ITForwardInformation for the basic forwarding control methods.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itforwardinformation2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITForwardInformation2 extends ITForwardInformation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITForwardInformation2
     * @type {Guid}
     */
    static IID => Guid("{5229b4ed-b260-4382-8e1a-5df3a8a4ccc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetForwardType2", "GetForwardType2", "get_ForwardTypeDestinationAddressType", "get_ForwardTypeCallerAddressType"]

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {BSTR} pDestAddress 
     * @param {Integer} DestAddressType 
     * @param {BSTR} pCallerAddress 
     * @param {Integer} CallerAddressType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation2-setforwardtype2
     */
    SetForwardType2(ForwardType, pDestAddress, DestAddressType, pCallerAddress, CallerAddressType) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pCallerAddress := pCallerAddress is String ? BSTR.Alloc(pCallerAddress).Value : pCallerAddress

        result := ComCall(14, this, "int", ForwardType, "ptr", pDestAddress, "int", DestAddressType, "ptr", pCallerAddress, "int", CallerAddressType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {Pointer<BSTR>} ppDestinationAddress 
     * @param {Pointer<Integer>} pDestAddressType 
     * @param {Pointer<BSTR>} ppCallerAddress 
     * @param {Pointer<Integer>} pCallerAddressType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation2-getforwardtype2
     */
    GetForwardType2(ForwardType, ppDestinationAddress, pDestAddressType, ppCallerAddress, pCallerAddressType) {
        result := ComCall(15, this, "int", ForwardType, "ptr", ppDestinationAddress, "int*", pDestAddressType, "ptr", ppCallerAddress, "int*", pCallerAddressType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {Pointer<Integer>} pDestAddressType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation2-get_forwardtypedestinationaddresstype
     */
    get_ForwardTypeDestinationAddressType(ForwardType, pDestAddressType) {
        result := ComCall(16, this, "int", ForwardType, "int*", pDestAddressType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Forwardtype 
     * @param {Pointer<Integer>} pCallerAddressType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation2-get_forwardtypecalleraddresstype
     */
    get_ForwardTypeCallerAddressType(Forwardtype, pCallerAddressType) {
        result := ComCall(17, this, "int", Forwardtype, "int*", pCallerAddressType, "HRESULT")
        return result
    }
}
