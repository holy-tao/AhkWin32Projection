#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneNumberInfo.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IPhoneNumberInfoStatics.ahk
#Include .\IPhoneNumberInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Information about a phone number.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class PhoneNumberInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneNumberInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneNumberInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Static method that attempts to parse a given input string as a phone number (using a given region code) and creates a [PhoneNumberInfo](phonenumberinfo.md) encapsulating it.
     * @param {HSTRING} input_ A phone number, in string form.
     * @param {Pointer<PhoneNumberInfo>} phoneNumber On success, this object encapsulates the given phone number.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.tryparse
     */
    static TryParse(input_, phoneNumber) {
        if (!PhoneNumberInfo.HasProp("__IPhoneNumberInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.PhoneNumberFormatting.PhoneNumberInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneNumberInfoStatics.IID)
            PhoneNumberInfo.__IPhoneNumberInfoStatics := IPhoneNumberInfoStatics(factoryPtr)
        }

        return PhoneNumberInfo.__IPhoneNumberInfoStatics.TryParse(input_, phoneNumber)
    }

    /**
     * Static method that attempts to parse a given input string as a phone number, and creates a [PhoneNumberInfo](phonenumberinfo.md) encapsulating it.
     * @param {HSTRING} input_ A phone number, in string form.
     * @param {HSTRING} regionCode 
     * @param {Pointer<PhoneNumberInfo>} phoneNumber On success, this object encapsulates the given phone number.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.tryparse
     */
    static TryParseWithRegion(input_, regionCode, phoneNumber) {
        if (!PhoneNumberInfo.HasProp("__IPhoneNumberInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.PhoneNumberFormatting.PhoneNumberInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneNumberInfoStatics.IID)
            PhoneNumberInfo.__IPhoneNumberInfoStatics := IPhoneNumberInfoStatics(factoryPtr)
        }

        return PhoneNumberInfo.__IPhoneNumberInfoStatics.TryParseWithRegion(input_, regionCode, phoneNumber)
    }

    /**
     * Constructor.
     * @param {HSTRING} number_ A phone number that the created object will encapsulate.
     * @returns {PhoneNumberInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.#ctor
     */
    static Create(number_) {
        if (!PhoneNumberInfo.HasProp("__IPhoneNumberInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.PhoneNumberFormatting.PhoneNumberInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneNumberInfoFactory.IID)
            PhoneNumberInfo.__IPhoneNumberInfoFactory := IPhoneNumberInfoFactory(factoryPtr)
        }

        return PhoneNumberInfo.__IPhoneNumberInfoFactory.Create(number_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the two-letter country code for this phone number.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.countrycode
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
    }

    /**
     * Gets the phone number.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.phonenumber
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CountryCode() {
        if (!this.HasProp("__IPhoneNumberInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberInfo := IPhoneNumberInfo(outPtr)
        }

        return this.__IPhoneNumberInfo.get_CountryCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        if (!this.HasProp("__IPhoneNumberInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberInfo := IPhoneNumberInfo(outPtr)
        }

        return this.__IPhoneNumberInfo.get_PhoneNumber()
    }

    /**
     * Gets the length in characters of the geographical area code.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.getlengthofgeographicalareacode
     */
    GetLengthOfGeographicalAreaCode() {
        if (!this.HasProp("__IPhoneNumberInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberInfo := IPhoneNumberInfo(outPtr)
        }

        return this.__IPhoneNumberInfo.GetLengthOfGeographicalAreaCode()
    }

    /**
     * Gets the national significant number of this object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.getnationalsignificantnumber
     */
    GetNationalSignificantNumber() {
        if (!this.HasProp("__IPhoneNumberInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberInfo := IPhoneNumberInfo(outPtr)
        }

        return this.__IPhoneNumberInfo.GetNationalSignificantNumber()
    }

    /**
     * Gets the length, in characters, of the national destination code.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.getlengthofnationaldestinationcode
     */
    GetLengthOfNationalDestinationCode() {
        if (!this.HasProp("__IPhoneNumberInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberInfo := IPhoneNumberInfo(outPtr)
        }

        return this.__IPhoneNumberInfo.GetLengthOfNationalDestinationCode()
    }

    /**
     * Heuristically predicts what kind of number is represented in this object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.predictnumberkind
     */
    PredictNumberKind() {
        if (!this.HasProp("__IPhoneNumberInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberInfo := IPhoneNumberInfo(outPtr)
        }

        return this.__IPhoneNumberInfo.PredictNumberKind()
    }

    /**
     * Gets the geographic region code for this number.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.getgeographicregioncode
     */
    GetGeographicRegionCode() {
        if (!this.HasProp("__IPhoneNumberInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberInfo := IPhoneNumberInfo(outPtr)
        }

        return this.__IPhoneNumberInfo.GetGeographicRegionCode()
    }

    /**
     * Compares two [PhoneNumberInfo](phonenumberinfo.md) objects.
     * @param {PhoneNumberInfo} otherNumber The number to be compared to this object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.checknumbermatch
     */
    CheckNumberMatch(otherNumber) {
        if (!this.HasProp("__IPhoneNumberInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberInfo := IPhoneNumberInfo(outPtr)
        }

        return this.__IPhoneNumberInfo.CheckNumberMatch(otherNumber)
    }

    /**
     * Renders the phone number as a string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberinfo.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}
