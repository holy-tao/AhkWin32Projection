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
     * 
     * @param {Pointer<Int32>} pAddressState 
     * @returns {HRESULT} 
     */
    get_State(pAddressState) {
        result := ComCall(7, this, "int*", pAddressState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     */
    get_AddressName(ppName) {
        result := ComCall(8, this, "ptr", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     */
    get_ServiceProviderName(ppName) {
        result := ComCall(9, this, "ptr", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITTAPI>} ppTapiObject 
     * @returns {HRESULT} 
     */
    get_TAPIObject(ppTapiObject) {
        result := ComCall(10, this, "ptr", ppTapiObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDestAddress 
     * @param {Integer} lAddressType 
     * @param {Integer} lMediaTypes 
     * @param {Pointer<ITBasicCallControl>} ppCall 
     * @returns {HRESULT} 
     */
    CreateCall(pDestAddress, lAddressType, lMediaTypes, ppCall) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress

        result := ComCall(11, this, "ptr", pDestAddress, "int", lAddressType, "int", lMediaTypes, "ptr", ppCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_Calls(pVariant) {
        result := ComCall(12, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCall>} ppCallEnum 
     * @returns {HRESULT} 
     */
    EnumerateCalls(ppCallEnum) {
        result := ComCall(13, this, "ptr", ppCallEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDialableAddress 
     * @returns {HRESULT} 
     */
    get_DialableAddress(pDialableAddress) {
        result := ComCall(14, this, "ptr", pDialableAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITForwardInformation>} ppForwardInfo 
     * @returns {HRESULT} 
     */
    CreateForwardInfoObject(ppForwardInfo) {
        result := ComCall(15, this, "ptr", ppForwardInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITForwardInformation>} pForwardInfo 
     * @param {Pointer<ITBasicCallControl>} pCall 
     * @returns {HRESULT} 
     */
    Forward(pForwardInfo, pCall) {
        result := ComCall(16, this, "ptr", pForwardInfo, "ptr", pCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITForwardInformation>} ppForwardInfo 
     * @returns {HRESULT} 
     */
    get_CurrentForwardInfo(ppForwardInfo) {
        result := ComCall(17, this, "ptr", ppForwardInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMessageWaiting 
     * @returns {HRESULT} 
     */
    put_MessageWaiting(fMessageWaiting) {
        result := ComCall(18, this, "short", fMessageWaiting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfMessageWaiting 
     * @returns {HRESULT} 
     */
    get_MessageWaiting(pfMessageWaiting) {
        result := ComCall(19, this, "ptr", pfMessageWaiting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDoNotDisturb 
     * @returns {HRESULT} 
     */
    put_DoNotDisturb(fDoNotDisturb) {
        result := ComCall(20, this, "short", fDoNotDisturb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfDoNotDisturb 
     * @returns {HRESULT} 
     */
    get_DoNotDisturb(pfDoNotDisturb) {
        result := ComCall(21, this, "ptr", pfDoNotDisturb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
