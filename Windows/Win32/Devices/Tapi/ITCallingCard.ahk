#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallingCard interface provides methods to retrieve information concerning telephony calling cards.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallingcard
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallingCard extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallingCard
     * @type {Guid}
     */
    static IID => Guid("{0c4d8f00-8ddb-11d1-a09e-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PermanentCardID", "get_NumberOfDigits", "get_Options", "get_CardName", "get_SameAreaDialingRule", "get_LongDistanceDialingRule", "get_InternationalDialingRule"]

    /**
     * 
     * @param {Pointer<Integer>} plCardID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_permanentcardid
     */
    get_PermanentCardID(plCardID) {
        plCardIDMarshal := plCardID is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCardIDMarshal, plCardID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDigits 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_numberofdigits
     */
    get_NumberOfDigits(plDigits) {
        plDigitsMarshal := plDigits is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plDigitsMarshal, plDigits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_options
     */
    get_Options(plOptions) {
        plOptionsMarshal := plOptions is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plOptionsMarshal, plOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCardName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_cardname
     */
    get_CardName(ppCardName) {
        result := ComCall(10, this, "ptr", ppCardName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppRule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_sameareadialingrule
     */
    get_SameAreaDialingRule(ppRule) {
        result := ComCall(11, this, "ptr", ppRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppRule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_longdistancedialingrule
     */
    get_LongDistanceDialingRule(ppRule) {
        result := ComCall(12, this, "ptr", ppRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppRule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_internationaldialingrule
     */
    get_InternationalDialingRule(ppRule) {
        result := ComCall(13, this, "ptr", ppRule, "HRESULT")
        return result
    }
}
