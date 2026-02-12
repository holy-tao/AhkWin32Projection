#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INumberFormatterOptions.ahk
#Include .\INumberFormatter.ahk
#Include .\INumberFormatter2.ahk
#Include .\INumberParser.ahk
#Include .\ISignificantDigitsOption.ahk
#Include .\INumberRounderOption.ahk
#Include .\ISignedZeroOption.ahk
#Include .\IDecimalFormatterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Formats and parses decimal numbers.
 * @remarks
 * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class DecimalFormatter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INumberFormatterOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INumberFormatterOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [DecimalFormatter](decimalformatter.md) object initialized by a language list and a geographic region.
     * @remarks
     * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the numeral system used by [DecimalFormatter](decimalformatter.md) objects.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, representing the choice of languages. See Remarks.
     * @param {HSTRING} geographicRegion_ The identifier for the geographic region.
     * @returns {DecimalFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.#ctor
     */
    static CreateDecimalFormatter(languages, geographicRegion_) {
        if (!DecimalFormatter.HasProp("__IDecimalFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumberFormatting.DecimalFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDecimalFormatterFactory.IID)
            DecimalFormatter.__IDecimalFormatterFactory := IDecimalFormatterFactory(factoryPtr)
        }

        return DecimalFormatter.__IDecimalFormatterFactory.CreateDecimalFormatter(languages, geographicRegion_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the priority list of language identifiers that is used when formatting and parsing decimal numbers.
     * @remarks
     * If your app passes language tags from this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the numeral system used by [DecimalFormatter](decimalformatter.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.languages
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * Gets the region that is used when formatting and parsing decimal numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.geographicregion
     * @type {HSTRING} 
     */
    GeographicRegion {
        get => this.get_GeographicRegion()
    }

    /**
     * Gets or sets the minimum number of digits to display for the integer part of the number.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.integerdigits
     * @type {Integer} 
     */
    IntegerDigits {
        get => this.get_IntegerDigits()
        set => this.put_IntegerDigits(value)
    }

    /**
     * Gets or sets the minimum number of digits to display for the fraction part of the number.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.fractiondigits
     * @type {Integer} 
     */
    FractionDigits {
        get => this.get_FractionDigits()
        set => this.put_FractionDigits(value)
    }

    /**
     * Gets or sets whether the integer part of the number should be grouped.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.isgrouped
     * @type {Boolean} 
     */
    IsGrouped {
        get => this.get_IsGrouped()
        set => this.put_IsGrouped(value)
    }

    /**
     * Gets or sets whether the decimal point of the number should always be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.isdecimalpointalwaysdisplayed
     * @type {Boolean} 
     */
    IsDecimalPointAlwaysDisplayed {
        get => this.get_IsDecimalPointAlwaysDisplayed()
        set => this.put_IsDecimalPointAlwaysDisplayed(value)
    }

    /**
     * Gets or sets the numbering system that is used to format and parse decimal numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.numeralsystem
     * @type {HSTRING} 
     */
    NumeralSystem {
        get => this.get_NumeralSystem()
        set => this.put_NumeralSystem(value)
    }

    /**
     * Gets the language that was most recently used to format or parse decimal values.
     * @remarks
     * If your app passes language tags from this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the numeral system used by [DecimalFormatter](decimalformatter.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Gets the geographic region that was most recently used to format or parse decimal values.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.resolvedgeographicregion
     * @type {HSTRING} 
     */
    ResolvedGeographicRegion {
        get => this.get_ResolvedGeographicRegion()
    }

    /**
     * Gets or sets the current padding to significant digits when a decimal number is formatted.
     * @remarks
     * Trailing zeros are added to the format until the given number of significant digits is exhausted. If there are more digits, this property does not cause them to be truncated.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.significantdigits
     * @type {Integer} 
     */
    SignificantDigits {
        get => this.get_SignificantDigits()
        set => this.put_SignificantDigits(value)
    }

    /**
     * Gets or sets the current rounding strategy to be used when formatting numbers.
     * @remarks
     * When a **Format** method is called, the appropriate rounding function from the number rounder object manipulates the input prior to it being formatted.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.numberrounder
     * @type {INumberRounder} 
     */
    NumberRounder {
        get => this.get_NumberRounder()
        set => this.put_NumberRounder(value)
    }

    /**
     * Gets or sets whether -0 is formatted as "-0" or "0".
     * @remarks
     * You can set this property to specify that [DecimalFormatter](decimalformatter.md) display negative 0 as "-0". This enables the scenario where you wish to display "-0" when it represents the rounded value of some small negative value (such as -0.00001).
     * 
     * This property defaults to **false** to be consistent with Windows 8 and Windows Server 2012, in which -0 was always formatted as "0".
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.iszerosigned
     * @type {Boolean} 
     */
    IsZeroSigned {
        get => this.get_IsZeroSigned()
        set => this.put_IsZeroSigned(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [DecimalFormatter](decimalformatter.md) object and initializes it to default values.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumberFormatting.DecimalFormatter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_Languages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GeographicRegion() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_GeographicRegion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IntegerDigits() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_IntegerDigits()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IntegerDigits(value) {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.put_IntegerDigits(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FractionDigits() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_FractionDigits()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FractionDigits(value) {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.put_FractionDigits(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGrouped() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_IsGrouped()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGrouped(value) {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.put_IsGrouped(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDecimalPointAlwaysDisplayed() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_IsDecimalPointAlwaysDisplayed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDecimalPointAlwaysDisplayed(value) {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.put_IsDecimalPointAlwaysDisplayed(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumeralSystem() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_NumeralSystem()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NumeralSystem(value) {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.put_NumeralSystem(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_ResolvedLanguage()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedGeographicRegion() {
        if (!this.HasProp("__INumberFormatterOptions")) {
            if ((queryResult := this.QueryInterface(INumberFormatterOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatterOptions := INumberFormatterOptions(outPtr)
        }

        return this.__INumberFormatterOptions.get_ResolvedGeographicRegion()
    }

    /**
     * Returns a string representation of an **Int64** number.
     * @param {Integer} value The **Int64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.format
     */
    FormatInt(value) {
        if (!this.HasProp("__INumberFormatter")) {
            if ((queryResult := this.QueryInterface(INumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter := INumberFormatter(outPtr)
        }

        return this.__INumberFormatter.FormatInt(value)
    }

    /**
     * Returns a string representation of an **Int64** number.
     * @param {Integer} value The **Int64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.format
     */
    FormatUInt(value) {
        if (!this.HasProp("__INumberFormatter")) {
            if ((queryResult := this.QueryInterface(INumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter := INumberFormatter(outPtr)
        }

        return this.__INumberFormatter.FormatUInt(value)
    }

    /**
     * Returns a string representation of an **Int64** number.
     * @param {Float} value The **Int64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.format
     */
    FormatDouble(value) {
        if (!this.HasProp("__INumberFormatter")) {
            if ((queryResult := this.QueryInterface(INumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter := INumberFormatter(outPtr)
        }

        return this.__INumberFormatter.FormatDouble(value)
    }

    /**
     * Returns a string representation of an **Int64** number.
     * @param {Integer} value The **Int64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.formatint
     */
    FormatInt1(value) {
        if (!this.HasProp("__INumberFormatter2")) {
            if ((queryResult := this.QueryInterface(INumberFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter2 := INumberFormatter2(outPtr)
        }

        return this.__INumberFormatter2.FormatInt(value)
    }

    /**
     * Returns a string representation of a **UInt64** number.
     * @param {Integer} value The **UInt64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.formatuint
     */
    FormatUInt1(value) {
        if (!this.HasProp("__INumberFormatter2")) {
            if ((queryResult := this.QueryInterface(INumberFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter2 := INumberFormatter2(outPtr)
        }

        return this.__INumberFormatter2.FormatUInt(value)
    }

    /**
     * Returns a string representation of a **Double** number.
     * @param {Float} value The **Double** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.formatdouble
     */
    FormatDouble1(value) {
        if (!this.HasProp("__INumberFormatter2")) {
            if ((queryResult := this.QueryInterface(INumberFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter2 := INumberFormatter2(outPtr)
        }

        return this.__INumberFormatter2.FormatDouble(value)
    }

    /**
     * Attempts to parse a string representation of an integer.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.parseint
     */
    ParseInt(text) {
        if (!this.HasProp("__INumberParser")) {
            if ((queryResult := this.QueryInterface(INumberParser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberParser := INumberParser(outPtr)
        }

        return this.__INumberParser.ParseInt(text)
    }

    /**
     * Attempts to parse a string representation of an unsigned integer.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.parseuint
     */
    ParseUInt(text) {
        if (!this.HasProp("__INumberParser")) {
            if ((queryResult := this.QueryInterface(INumberParser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberParser := INumberParser(outPtr)
        }

        return this.__INumberParser.ParseUInt(text)
    }

    /**
     * Attempts to parse a string representation of a **Double** number.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.decimalformatter.parsedouble
     */
    ParseDouble(text) {
        if (!this.HasProp("__INumberParser")) {
            if ((queryResult := this.QueryInterface(INumberParser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberParser := INumberParser(outPtr)
        }

        return this.__INumberParser.ParseDouble(text)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignificantDigits() {
        if (!this.HasProp("__ISignificantDigitsOption")) {
            if ((queryResult := this.QueryInterface(ISignificantDigitsOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignificantDigitsOption := ISignificantDigitsOption(outPtr)
        }

        return this.__ISignificantDigitsOption.get_SignificantDigits()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SignificantDigits(value) {
        if (!this.HasProp("__ISignificantDigitsOption")) {
            if ((queryResult := this.QueryInterface(ISignificantDigitsOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignificantDigitsOption := ISignificantDigitsOption(outPtr)
        }

        return this.__ISignificantDigitsOption.put_SignificantDigits(value)
    }

    /**
     * 
     * @returns {INumberRounder} 
     */
    get_NumberRounder() {
        if (!this.HasProp("__INumberRounderOption")) {
            if ((queryResult := this.QueryInterface(INumberRounderOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberRounderOption := INumberRounderOption(outPtr)
        }

        return this.__INumberRounderOption.get_NumberRounder()
    }

    /**
     * 
     * @param {INumberRounder} value 
     * @returns {HRESULT} 
     */
    put_NumberRounder(value) {
        if (!this.HasProp("__INumberRounderOption")) {
            if ((queryResult := this.QueryInterface(INumberRounderOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberRounderOption := INumberRounderOption(outPtr)
        }

        return this.__INumberRounderOption.put_NumberRounder(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZeroSigned() {
        if (!this.HasProp("__ISignedZeroOption")) {
            if ((queryResult := this.QueryInterface(ISignedZeroOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignedZeroOption := ISignedZeroOption(outPtr)
        }

        return this.__ISignedZeroOption.get_IsZeroSigned()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZeroSigned(value) {
        if (!this.HasProp("__ISignedZeroOption")) {
            if ((queryResult := this.QueryInterface(ISignedZeroOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignedZeroOption := ISignedZeroOption(outPtr)
        }

        return this.__ISignedZeroOption.put_IsZeroSigned(value)
    }

;@endregion Instance Methods
}
