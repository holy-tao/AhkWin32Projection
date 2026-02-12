#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentAddress.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class represents an address that is used in the Payment Request API. This class reflects the [W3C PaymentAddress interface](https://aka.ms/prapi#paymentaddress-interface).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentAddress extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentAddress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentAddress.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The country. Values must be from the [CLDR](https://cldr.unicode.org/) standard.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.country
     * @type {HSTRING} 
     */
    Country {
        get => this.get_Country()
        set => this.put_Country(value)
    }

    /**
     * The address lines.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.addresslines
     * @type {IVectorView<HSTRING>} 
     */
    AddressLines {
        get => this.get_AddressLines()
        set => this.put_AddressLines(value)
    }

    /**
     * The region of a country.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.region
     * @type {HSTRING} 
     */
    Region {
        get => this.get_Region()
        set => this.put_Region(value)
    }

    /**
     * The city.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.city
     * @type {HSTRING} 
     */
    City {
        get => this.get_City()
        set => this.put_City(value)
    }

    /**
     * The dependent locality within a city.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.dependentlocality
     * @type {HSTRING} 
     */
    DependentLocality {
        get => this.get_DependentLocality()
        set => this.put_DependentLocality(value)
    }

    /**
     * The address postal code.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.postalcode
     * @type {HSTRING} 
     */
    PostalCode {
        get => this.get_PostalCode()
        set => this.put_PostalCode(value)
    }

    /**
     * The sorting code.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.sortingcode
     * @type {HSTRING} 
     */
    SortingCode {
        get => this.get_SortingCode()
        set => this.put_SortingCode(value)
    }

    /**
     * Language code for the address. Values must be valid IETF language tags as specified by the BCP-47 standard.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.languagecode
     * @type {HSTRING} 
     */
    LanguageCode {
        get => this.get_LanguageCode()
        set => this.put_LanguageCode(value)
    }

    /**
     * Organization in the address.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.organization
     * @type {HSTRING} 
     */
    Organization {
        get => this.get_Organization()
        set => this.put_Organization(value)
    }

    /**
     * The name of the recipient.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.recipient
     * @type {HSTRING} 
     */
    Recipient {
        get => this.get_Recipient()
        set => this.put_Recipient(value)
    }

    /**
     * The phone number of the recipient.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.phonenumber
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
        set => this.put_PhoneNumber(value)
    }

    /**
     * This field is used to allow extensions to the class. It is not present in the W3C definition.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentaddress.properties
     * @type {ValueSet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new PaymentAddress object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentAddress")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Country() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_Country()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Country(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_Country(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AddressLines() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_AddressLines()
    }

    /**
     * 
     * @param {IVectorView<HSTRING>} value 
     * @returns {HRESULT} 
     */
    put_AddressLines(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_AddressLines(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Region() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_Region()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Region(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_Region(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_City() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_City()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_City(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_City(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DependentLocality() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_DependentLocality()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DependentLocality(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_DependentLocality(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostalCode() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_PostalCode()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PostalCode(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_PostalCode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SortingCode() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_SortingCode()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SortingCode(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_SortingCode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LanguageCode() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_LanguageCode()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LanguageCode(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_LanguageCode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Organization() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_Organization()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Organization(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_Organization(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Recipient() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_Recipient()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Recipient(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_Recipient(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_PhoneNumber()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PhoneNumber(value) {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.put_PhoneNumber(value)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Properties() {
        if (!this.HasProp("__IPaymentAddress")) {
            if ((queryResult := this.QueryInterface(IPaymentAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAddress := IPaymentAddress(outPtr)
        }

        return this.__IPaymentAddress.get_Properties()
    }

;@endregion Instance Methods
}
