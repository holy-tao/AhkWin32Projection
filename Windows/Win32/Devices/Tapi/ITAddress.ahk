#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAddress interface is the base interface for the Address object. Applications use this interface to get information about and use the Address object.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddress
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddress extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAddress
     * @type {Guid}
     */
    static IID => Guid("{b1efc386-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_State", "get_AddressName", "get_ServiceProviderName", "get_TAPIObject", "CreateCall", "get_Calls", "EnumerateCalls", "get_DialableAddress", "CreateForwardInfoObject", "Forward", "get_CurrentForwardInfo", "put_MessageWaiting", "get_MessageWaiting", "put_DoNotDisturb", "get_DoNotDisturb"]

    /**
     * 
     * @param {Pointer<Integer>} pAddressState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_state
     */
    get_State(pAddressState) {
        pAddressStateMarshal := pAddressState is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pAddressStateMarshal, pAddressState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_addressname
     */
    get_AddressName(ppName) {
        result := ComCall(8, this, "ptr", ppName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_serviceprovidername
     */
    get_ServiceProviderName(ppName) {
        result := ComCall(9, this, "ptr", ppName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITTAPI>} ppTapiObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_tapiobject
     */
    get_TAPIObject(ppTapiObject) {
        result := ComCall(10, this, "ptr*", ppTapiObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDestAddress 
     * @param {Integer} lAddressType 
     * @param {Integer} lMediaTypes 
     * @param {Pointer<ITBasicCallControl>} ppCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-createcall
     */
    CreateCall(pDestAddress, lAddressType, lMediaTypes, ppCall) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress

        result := ComCall(11, this, "ptr", pDestAddress, "int", lAddressType, "int", lMediaTypes, "ptr*", ppCall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_calls
     */
    get_Calls(pVariant) {
        result := ComCall(12, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCall>} ppCallEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-enumeratecalls
     */
    EnumerateCalls(ppCallEnum) {
        result := ComCall(13, this, "ptr*", ppCallEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDialableAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_dialableaddress
     */
    get_DialableAddress(pDialableAddress) {
        result := ComCall(14, this, "ptr", pDialableAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITForwardInformation>} ppForwardInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-createforwardinfoobject
     */
    CreateForwardInfoObject(ppForwardInfo) {
        result := ComCall(15, this, "ptr*", ppForwardInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITForwardInformation} pForwardInfo 
     * @param {ITBasicCallControl} pCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-forward
     */
    Forward(pForwardInfo, pCall) {
        result := ComCall(16, this, "ptr", pForwardInfo, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITForwardInformation>} ppForwardInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_currentforwardinfo
     */
    get_CurrentForwardInfo(ppForwardInfo) {
        result := ComCall(17, this, "ptr*", ppForwardInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMessageWaiting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-put_messagewaiting
     */
    put_MessageWaiting(fMessageWaiting) {
        result := ComCall(18, this, "short", fMessageWaiting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfMessageWaiting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_messagewaiting
     */
    get_MessageWaiting(pfMessageWaiting) {
        result := ComCall(19, this, "ptr", pfMessageWaiting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDoNotDisturb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-put_donotdisturb
     */
    put_DoNotDisturb(fDoNotDisturb) {
        result := ComCall(20, this, "short", fDoNotDisturb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfDoNotDisturb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_donotdisturb
     */
    get_DoNotDisturb(pfDoNotDisturb) {
        result := ComCall(21, this, "ptr", pfDoNotDisturb, "HRESULT")
        return result
    }
}
