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
     * 
     * @param {Integer} ForwardType 
     * @param {BSTR} pDestAddress 
     * @param {Integer} DestAddressType 
     * @param {BSTR} pCallerAddress 
     * @param {Integer} CallerAddressType 
     * @returns {HRESULT} 
     */
    SetForwardType2(ForwardType, pDestAddress, DestAddressType, pCallerAddress, CallerAddressType) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pCallerAddress := pCallerAddress is String ? BSTR.Alloc(pCallerAddress).Value : pCallerAddress

        result := ComCall(14, this, "int", ForwardType, "ptr", pDestAddress, "int", DestAddressType, "ptr", pCallerAddress, "int", CallerAddressType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {Pointer<BSTR>} ppDestinationAddress 
     * @param {Pointer<Int32>} pDestAddressType 
     * @param {Pointer<BSTR>} ppCallerAddress 
     * @param {Pointer<Int32>} pCallerAddressType 
     * @returns {HRESULT} 
     */
    GetForwardType2(ForwardType, ppDestinationAddress, pDestAddressType, ppCallerAddress, pCallerAddressType) {
        result := ComCall(15, this, "int", ForwardType, "ptr", ppDestinationAddress, "int*", pDestAddressType, "ptr", ppCallerAddress, "int*", pCallerAddressType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ForwardType 
     * @param {Pointer<Int32>} pDestAddressType 
     * @returns {HRESULT} 
     */
    get_ForwardTypeDestinationAddressType(ForwardType, pDestAddressType) {
        result := ComCall(16, this, "int", ForwardType, "int*", pDestAddressType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Forwardtype 
     * @param {Pointer<Int32>} pCallerAddressType 
     * @returns {HRESULT} 
     */
    get_ForwardTypeCallerAddressType(Forwardtype, pCallerAddressType) {
        result := ComCall(17, this, "int", Forwardtype, "int*", pCallerAddressType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
