#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneNumberFormatter.ahk
#Include .\IPhoneNumberFormatterStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Formats phone numbers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class PhoneNumberFormatter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneNumberFormatter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneNumberFormatter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Attempts to create a [PhoneNumberFormatter](phonenumberformatter.md) for a given region code, and doesn't throw on failure.
     * @remarks
     * The following code snippet demonstrates how to use this method to create a [PhoneNumberFormatter](phonenumberformatter.md) for the "BR" region.
     * 
     * ```csharp
     * 
     *     using Windows.Globalization.PhoneNumberFormatting;
     * 
     *     PhoneNumberFormatter currentFormatter = null;
     * 
     *     PhoneNumberFormatter.TryCreate("BR", out currentFormatter);
     *     if (currentFormatter != null)
     *     {
     *         // use the formatter 
     *     }  
     *     else
     *     {
     *         // formatter could not be created for the given region. 
     *         // put your fallback logic here.
     *     }
     * 
     * ```
     * @param {HSTRING} regionCode The region code of the new [PhoneNumberFormatter](phonenumberformatter.md).
     * @param {Pointer<PhoneNumberFormatter>} phoneNumber On success, a new [PhoneNumberFormatter](phonenumberformatter.md) for the requested region code.
     * 
     * On failure, this value is **null**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.trycreate
     */
    static TryCreate(regionCode, phoneNumber) {
        if (!PhoneNumberFormatter.HasProp("__IPhoneNumberFormatterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneNumberFormatterStatics.IID)
            PhoneNumberFormatter.__IPhoneNumberFormatterStatics := IPhoneNumberFormatterStatics(factoryPtr)
        }

        return PhoneNumberFormatter.__IPhoneNumberFormatterStatics.TryCreate(regionCode, phoneNumber)
    }

    /**
     * Static method that returns the country code for a given region code.
     * @param {HSTRING} regionCode The two-letter ISO region code.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.getcountrycodeforregion
     */
    static GetCountryCodeForRegion(regionCode) {
        if (!PhoneNumberFormatter.HasProp("__IPhoneNumberFormatterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneNumberFormatterStatics.IID)
            PhoneNumberFormatter.__IPhoneNumberFormatterStatics := IPhoneNumberFormatterStatics(factoryPtr)
        }

        return PhoneNumberFormatter.__IPhoneNumberFormatterStatics.GetCountryCodeForRegion(regionCode)
    }

    /**
     * Static method that returns the national direct dialing prefix for the given region.
     * @param {HSTRING} regionCode The region code of interest.
     * @param {Boolean} stripNonDigit When **true**, all non-digit characters are stripped from the returned string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.getnationaldirectdialingprefixforregion
     */
    static GetNationalDirectDialingPrefixForRegion(regionCode, stripNonDigit) {
        if (!PhoneNumberFormatter.HasProp("__IPhoneNumberFormatterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneNumberFormatterStatics.IID)
            PhoneNumberFormatter.__IPhoneNumberFormatterStatics := IPhoneNumberFormatterStatics(factoryPtr)
        }

        return PhoneNumberFormatter.__IPhoneNumberFormatterStatics.GetNationalDirectDialingPrefixForRegion(regionCode, stripNonDigit)
    }

    /**
     * Wraps a string with Unicode Left to Right (LTR) markers.
     * @param {HSTRING} number_ The string to be surrounded with LTR markers.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.wrapwithlefttorightmarkers
     */
    static WrapWithLeftToRightMarkers(number_) {
        if (!PhoneNumberFormatter.HasProp("__IPhoneNumberFormatterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneNumberFormatterStatics.IID)
            PhoneNumberFormatter.__IPhoneNumberFormatterStatics := IPhoneNumberFormatterStatics(factoryPtr)
        }

        return PhoneNumberFormatter.__IPhoneNumberFormatterStatics.WrapWithLeftToRightMarkers(number_)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Creates a PhoneNumberFormatter object, using the current default region.
     * @remarks
     * Note that you can also create PhoneNumberFormatter objects using [PhoneNumberFormatter.TryCreate](phonenumberformatter_trycreate_1887286499.md), which takes a two-letter ISO region name as an argument and attempts to create a PhoneNumberFormatter for the given region.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Returns a string representing the given phone number, using the given format.
     * @param {PhoneNumberInfo} number_ The phone number to be formatted. The [PhoneNumberInfo](phonenumberinfo.md) specifies not just the subscriber number, but also other relevant information such as country code.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.format
     */
    Format(number_) {
        if (!this.HasProp("__IPhoneNumberFormatter")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberFormatter := IPhoneNumberFormatter(outPtr)
        }

        return this.__IPhoneNumberFormatter.Format(number_)
    }

    /**
     * Returns a string representation of the provided phone number.
     * @param {PhoneNumberInfo} number_ The phone number to be formatted. The [PhoneNumberInfo](phonenumberinfo.md) specifies not just the subscriber number, but also other relevant information such as country code.
     * @param {Integer} numberFormat 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.format
     */
    FormatWithOutputFormat(number_, numberFormat) {
        if (!this.HasProp("__IPhoneNumberFormatter")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberFormatter := IPhoneNumberFormatter(outPtr)
        }

        return this.__IPhoneNumberFormatter.FormatWithOutputFormat(number_, numberFormat)
    }

    /**
     * Returns a string representing the formatted partial phone number given.
     * 
     * Use this method to format phone numbers as they are being entered by a user, to help the user visualize the complete, formatted number.
     * @remarks
     * The following table shows the results of repeatedly calling this method as a user enters digits from a phone number, using a formatter set to the "US" region.
     * 
     * <table>
     *    <tr><th>Digits passed to FormatPartialString</th><th>Formatted output</th></tr>
     *    <tr><td>1</td><td>1</td></tr>
     *    <tr><td>14</td><td>14</td></tr>
     *    <tr><td>142</td><td>142</td></tr>
     *    <tr><td>1425</td><td>1 425</td></tr>
     *    <tr><td>1425555</td><td>1 425-555</td></tr>
     *    <tr><td>14255558</td><td>1 425-555-8</td></tr>
     *    <tr><td>14255558080</td><td>1 425-555-8080</td></tr>
     * </table>
     * 
     * The following code snippet demonstrates a TextChanged event handler that updates a TextBlock with the formatted partial number whenever the number typed into the event handler's TextBox changes.
     * 
     * ```csharp
     * 
     * using Windows.Globalization.PhoneNumberFormatting;
     * 
     * PhoneNumberFormatter currentFormatter;
     * 
     * public MainPage()
     * {
     *     this.InitializeComponent();
     * 
     *     // Using the current default region
     *     currentFormatter = new PhoneNumberFormatter();
     * }
     * 
     * private void gradualInput_TextChanged(object sender, TextChangedEventArgs e)
     * {
     *     outBlock.Text = currentFormatter.FormatPartialString(gradualInput.Text);
     * }
     * 
     * ```
     * @param {HSTRING} number_ A string representing a partial phone number.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.formatpartialstring
     */
    FormatPartialString(number_) {
        if (!this.HasProp("__IPhoneNumberFormatter")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberFormatter := IPhoneNumberFormatter(outPtr)
        }

        return this.__IPhoneNumberFormatter.FormatPartialString(number_)
    }

    /**
     * Returns the input string, formatted as a phone number.
     * @param {HSTRING} number_ The input string to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.formatstring
     */
    FormatString(number_) {
        if (!this.HasProp("__IPhoneNumberFormatter")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberFormatter := IPhoneNumberFormatter(outPtr)
        }

        return this.__IPhoneNumberFormatter.FormatString(number_)
    }

    /**
     * Returns the input string, formatted as a phone number, surrounded by Unicode Left to Right (LTR) markers.
     * @remarks
     * Use this method when rendering a phone number for display and the current region settings specify a Right to Left (RTL) language. Phone numbers should still be rendered Left to Right, even when rendered in RTL languages.
     * @param {HSTRING} number_ The input string to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformatter.formatstringwithlefttorightmarkers
     */
    FormatStringWithLeftToRightMarkers(number_) {
        if (!this.HasProp("__IPhoneNumberFormatter")) {
            if ((queryResult := this.QueryInterface(IPhoneNumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNumberFormatter := IPhoneNumberFormatter(outPtr)
        }

        return this.__IPhoneNumberFormatter.FormatStringWithLeftToRightMarkers(number_)
    }

;@endregion Instance Methods
}
