#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITCallingCard interface provides methods to retrieve information concerning telephony calling cards.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcallingcard
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCallingCard extends IDispatch {
    /**
     * The interface identifier for ITCallingCard
     * @type {Guid}
     */
    static IID := Guid("{0c4d8f00-8ddb-11d1-a09e-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCallingCard interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_PermanentCardID          : IntPtr
        get_NumberOfDigits           : IntPtr
        get_Options                  : IntPtr
        get_CardName                 : IntPtr
        get_SameAreaDialingRule      : IntPtr
        get_LongDistanceDialingRule  : IntPtr
        get_InternationalDialingRule : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCallingCard.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The get_PermanentCardID method gets the permanent identifier that identifies the card.
     * @returns {Integer} Pointer to calling card identifier.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_permanentcardid
     */
    get_PermanentCardID() {
        result := ComCall(7, this, "int*", &plCardID := 0, "HRESULT")
        return plCardID
    }

    /**
     * The get_NumberOfDigits method gets the number of digits in the existing card number.
     * @remarks
     * The card number itself is not returned for security reasons. The application can use this information to insert filler bytes into a text control in "password" mode to show that a number exists.
     * @returns {Integer} Pointer to number of digits in the card number.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_numberofdigits
     */
    get_NumberOfDigits() {
        result := ComCall(8, this, "int*", &plDigits := 0, "HRESULT")
        return plDigits
    }

    /**
     * The get_Options method gets the translation options for this address and card.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateoption--constants">LINETRANSLATEOPTION</a> flags.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_options
     */
    get_Options() {
        result := ComCall(9, this, "int*", &plOptions := 0, "HRESULT")
        return plOptions
    }

    /**
     * The get_CardName method gets the friendly name for the calling card.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppCardName</i> parameter.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing a displayable name for the calling card.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_cardname
     */
    get_CardName() {
        ppCardName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, ppCardName, "HRESULT")
        return ppCardName
    }

    /**
     * The get_SameAreaDialingRule method gets the dialing rules for calls within the same area code.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppRule</i> parameter.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of local area dialing rules.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_sameareadialingrule
     */
    get_SameAreaDialingRule() {
        ppRule := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, ppRule, "HRESULT")
        return ppRule
    }

    /**
     * The get_LongDistanceDialingRule method gets the long distance dialing rules for this calling card.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppRule</i> parameter.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of long distance dialing rules.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_longdistancedialingrule
     */
    get_LongDistanceDialingRule() {
        ppRule := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, ppRule, "HRESULT")
        return ppRule
    }

    /**
     * The get_InternationalDialingRule method gets the international dialing rules for this calling card.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppRule</i> parameter.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of international dialing rules.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallingcard-get_internationaldialingrule
     */
    get_InternationalDialingRule() {
        ppRule := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, ppRule, "HRESULT")
        return ppRule
    }

    Query(iid) {
        if (ITCallingCard.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PermanentCardID := CallbackCreate(GetMethod(implObj, "get_PermanentCardID"), flags, 2)
        this.vtbl.get_NumberOfDigits := CallbackCreate(GetMethod(implObj, "get_NumberOfDigits"), flags, 2)
        this.vtbl.get_Options := CallbackCreate(GetMethod(implObj, "get_Options"), flags, 2)
        this.vtbl.get_CardName := CallbackCreate(GetMethod(implObj, "get_CardName"), flags, 2)
        this.vtbl.get_SameAreaDialingRule := CallbackCreate(GetMethod(implObj, "get_SameAreaDialingRule"), flags, 2)
        this.vtbl.get_LongDistanceDialingRule := CallbackCreate(GetMethod(implObj, "get_LongDistanceDialingRule"), flags, 2)
        this.vtbl.get_InternationalDialingRule := CallbackCreate(GetMethod(implObj, "get_InternationalDialingRule"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PermanentCardID)
        CallbackFree(this.vtbl.get_NumberOfDigits)
        CallbackFree(this.vtbl.get_Options)
        CallbackFree(this.vtbl.get_CardName)
        CallbackFree(this.vtbl.get_SameAreaDialingRule)
        CallbackFree(this.vtbl.get_LongDistanceDialingRule)
        CallbackFree(this.vtbl.get_InternationalDialingRule)
    }
}
