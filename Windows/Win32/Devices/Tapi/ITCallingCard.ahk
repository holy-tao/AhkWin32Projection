#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {Integer} 
     */
    PermanentCardID {
        get => this.get_PermanentCardID()
    }

    /**
     * @type {Integer} 
     */
    NumberOfDigits {
        get => this.get_NumberOfDigits()
    }

    /**
     * @type {Integer} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * @type {BSTR} 
     */
    CardName {
        get => this.get_CardName()
    }

    /**
     * @type {BSTR} 
     */
    SameAreaDialingRule {
        get => this.get_SameAreaDialingRule()
    }

    /**
     * @type {BSTR} 
     */
    LongDistanceDialingRule {
        get => this.get_LongDistanceDialingRule()
    }

    /**
     * @type {BSTR} 
     */
    InternationalDialingRule {
        get => this.get_InternationalDialingRule()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_permanentcardid
     */
    get_PermanentCardID() {
        result := ComCall(7, this, "int*", &plCardID := 0, "HRESULT")
        return plCardID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_numberofdigits
     */
    get_NumberOfDigits() {
        result := ComCall(8, this, "int*", &plDigits := 0, "HRESULT")
        return plDigits
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_options
     */
    get_Options() {
        result := ComCall(9, this, "int*", &plOptions := 0, "HRESULT")
        return plOptions
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_cardname
     */
    get_CardName() {
        ppCardName := BSTR()
        result := ComCall(10, this, "ptr", ppCardName, "HRESULT")
        return ppCardName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_sameareadialingrule
     */
    get_SameAreaDialingRule() {
        ppRule := BSTR()
        result := ComCall(11, this, "ptr", ppRule, "HRESULT")
        return ppRule
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_longdistancedialingrule
     */
    get_LongDistanceDialingRule() {
        ppRule := BSTR()
        result := ComCall(12, this, "ptr", ppRule, "HRESULT")
        return ppRule
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_internationaldialingrule
     */
    get_InternationalDialingRule() {
        ppRule := BSTR()
        result := ComCall(13, this, "ptr", ppRule, "HRESULT")
        return ppRule
    }
}
