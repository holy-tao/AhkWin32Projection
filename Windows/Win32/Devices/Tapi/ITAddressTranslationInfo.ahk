#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used to determine the address translation data.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itaddresstranslationinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAddressTranslationInfo extends IDispatch {
    /**
     * The interface identifier for ITAddressTranslationInfo
     * @type {Guid}
     */
    static IID := Guid("{afc15945-8d40-11d1-a09e-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAddressTranslationInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DialableString         : IntPtr
        get_DisplayableString      : IntPtr
        get_CurrentCountryCode     : IntPtr
        get_DestinationCountryCode : IntPtr
        get_TranslationResults     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAddressTranslationInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DialableString {
        get => this.get_DialableString()
    }

    /**
     * @type {BSTR} 
     */
    DisplayableString {
        get => this.get_DisplayableString()
    }

    /**
     * @type {Integer} 
     */
    CurrentCountryCode {
        get => this.get_CurrentCountryCode()
    }

    /**
     * @type {Integer} 
     */
    DestinationCountryCode {
        get => this.get_DestinationCountryCode()
    }

    /**
     * @type {Integer} 
     */
    TranslationResults {
        get => this.get_TranslationResults()
    }

    /**
     * The get_DialableString method gets a string that contains a dialable number. Typically, this number is then used as the pDestAddress argument in ITAddress::CreateCall.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppDialableString</i> parameter.
     * 			
     * 
     * Corresponds to the <b>dwDialableStringSize</b> and <b>dwDialableStringOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a> structure.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing representation of dialable string.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslationinfo-get_dialablestring
     */
    get_DialableString() {
        ppDialableString := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, ppDialableString, "HRESULT")
        return ppDialableString
    }

    /**
     * The get_DisplayableString method gets a string that contains a displayable version of the dialable number.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppDisplayableString</i> parameter.
     * 			
     * 
     * Corresponds to the <b>dwDisplayableStringSize</b> and <b>dwDisplayableStringOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a> structure.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing representation of displayable string.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslationinfo-get_displayablestring
     */
    get_DisplayableString() {
        ppDisplayableString := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, ppDisplayableString, "HRESULT")
        return ppDisplayableString
    }

    /**
     * The get_CurrentCountryCode method gets the current country/region code.
     * @remarks
     * Corresponds to the <b>dwCurrentCountry</b> member of the TAPI 2 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a> structure.
     * @returns {Integer} Pointer to the country/region code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslationinfo-get_currentcountrycode
     */
    get_CurrentCountryCode() {
        result := ComCall(9, this, "int*", &CountryCode := 0, "HRESULT")
        return CountryCode
    }

    /**
     * Retrieves the country/region code for the call destination.
     * @remarks
     * Corresponds to the <b>dwDestCountry</b> member of the TAPI 2 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a> structure.
     * @returns {Integer} A pointer to destination country/region code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslationinfo-get_destinationcountrycode
     */
    get_DestinationCountryCode() {
        result := ComCall(10, this, "int*", &CountryCode := 0, "HRESULT")
        return CountryCode
    }

    /**
     * The get_TranslationResults method gets the results of a translation operation.
     * @remarks
     * Corresponds to the <b>dwTranslateResults</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a> structure.
     * @returns {Integer} Indicates the information derived from the translation process, which may assist the application in presenting user-interface elements. This value uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateresult--constants">LINETRANSLATERESULT_ Constants</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslationinfo-get_translationresults
     */
    get_TranslationResults() {
        result := ComCall(11, this, "int*", &plResults := 0, "HRESULT")
        return plResults
    }

    Query(iid) {
        if (ITAddressTranslationInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DialableString := CallbackCreate(GetMethod(implObj, "get_DialableString"), flags, 2)
        this.vtbl.get_DisplayableString := CallbackCreate(GetMethod(implObj, "get_DisplayableString"), flags, 2)
        this.vtbl.get_CurrentCountryCode := CallbackCreate(GetMethod(implObj, "get_CurrentCountryCode"), flags, 2)
        this.vtbl.get_DestinationCountryCode := CallbackCreate(GetMethod(implObj, "get_DestinationCountryCode"), flags, 2)
        this.vtbl.get_TranslationResults := CallbackCreate(GetMethod(implObj, "get_TranslationResults"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DialableString)
        CallbackFree(this.vtbl.get_DisplayableString)
        CallbackFree(this.vtbl.get_CurrentCountryCode)
        CallbackFree(this.vtbl.get_DestinationCountryCode)
        CallbackFree(this.vtbl.get_TranslationResults)
    }
}
