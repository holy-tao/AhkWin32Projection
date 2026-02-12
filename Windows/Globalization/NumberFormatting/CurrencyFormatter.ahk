#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICurrencyFormatter.ahk
#Include .\INumberParser.ahk
#Include .\INumberFormatter2.ahk
#Include .\INumberFormatter.ahk
#Include .\INumberFormatterOptions.ahk
#Include .\ICurrencyFormatter2.ahk
#Include .\ISignificantDigitsOption.ahk
#Include .\INumberRounderOption.ahk
#Include .\ISignedZeroOption.ahk
#Include .\ICurrencyFormatterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Formats and parses currencies.
 * @remarks
 * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class CurrencyFormatter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICurrencyFormatter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICurrencyFormatter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [CurrencyFormatter](currencyformatter.md) object that is initialized with a currency identifier.
     * @param {HSTRING} currencyCode The currency identifier to use when formatting and parsing currency values.
     * @returns {CurrencyFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.#ctor
     */
    static CreateCurrencyFormatterCode(currencyCode) {
        if (!CurrencyFormatter.HasProp("__ICurrencyFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumberFormatting.CurrencyFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyFormatterFactory.IID)
            CurrencyFormatter.__ICurrencyFormatterFactory := ICurrencyFormatterFactory(factoryPtr)
        }

        return CurrencyFormatter.__ICurrencyFormatterFactory.CreateCurrencyFormatterCode(currencyCode)
    }

    /**
     * Creates a [CurrencyFormatter](currencyformatter.md) object initialized with a currency identifier, language list, and geographic region.
     * @remarks
     * In the case that the symbol for the provided currency is the same symbol as that of a different currency in the provided region (or the home region if none is provided), formatting may use a currency code even if the [Mode](currencyformatter_mode.md) property is **UseSymbol**. This is to avoid ambiguity. For example, CurrencyFormatter ("USD", ["en"], "CA") creates a formatter that formats 3 as 3 CAD, even if the [Mode](currencyformatter_mode.md) property is **UseSymbol**. Similarly, CurrencyFormatter ("CAD", ["en"], "US") creates a formatter that formats 3 as 3 USD.
     * 
     * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the numeral system used by [CurrencyFormatter](currencyformatter.md) objects.
     * @param {HSTRING} currencyCode The currency identifier to use when formatting and parsing currency values.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, representing the choice of languages. See Remarks.
     * @param {HSTRING} geographicRegion_ The identifier for the geographic region.
     * @returns {CurrencyFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.#ctor
     */
    static CreateCurrencyFormatterCodeContext(currencyCode, languages, geographicRegion_) {
        if (!CurrencyFormatter.HasProp("__ICurrencyFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumberFormatting.CurrencyFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyFormatterFactory.IID)
            CurrencyFormatter.__ICurrencyFormatterFactory := ICurrencyFormatterFactory(factoryPtr)
        }

        return CurrencyFormatter.__ICurrencyFormatterFactory.CreateCurrencyFormatterCodeContext(currencyCode, languages, geographicRegion_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Currency may be read-only for releases after Windows 8.1. Instead, use a new [CurrencyFormatter](currencyformatter.md).
     * 
     * Gets the identifier for the currency to be used for formatting and parsing currency values.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.currency
     * @type {HSTRING} 
     */
    Currency {
        get => this.get_Currency()
        set => this.put_Currency(value)
    }

    /**
     * Gets the priority list of language identifiers that is used when formatting and parsing currency values.
     * @remarks
     * If your app passes language tags from this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the numeral system used by [CurrencyFormatter](currencyformatter.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.languages
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * Gets the region that is used when formatting and parsing currency values.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.geographicregion
     * @type {HSTRING} 
     */
    GeographicRegion {
        get => this.get_GeographicRegion()
    }

    /**
     * Gets or sets the minimum number of digits to display for the integer part of the currency value.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.integerdigits
     * @type {Integer} 
     */
    IntegerDigits {
        get => this.get_IntegerDigits()
        set => this.put_IntegerDigits(value)
    }

    /**
     * Gets or sets the minimum number of digits to display for the fraction part of the currency value.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.fractiondigits
     * @type {Integer} 
     */
    FractionDigits {
        get => this.get_FractionDigits()
        set => this.put_FractionDigits(value)
    }

    /**
     * Gets or sets whether the integer part of the currency value should be grouped. The default value is `false`.
     * @remarks
     * The default value for this property is `false`. That's different from the behavior of currency formatting in .NET, where the default behavior is to group the integer part.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.isgrouped
     * @type {Boolean} 
     */
    IsGrouped {
        get => this.get_IsGrouped()
        set => this.put_IsGrouped(value)
    }

    /**
     * Gets or sets whether the decimal point of the currency value should always be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.isdecimalpointalwaysdisplayed
     * @type {Boolean} 
     */
    IsDecimalPointAlwaysDisplayed {
        get => this.get_IsDecimalPointAlwaysDisplayed()
        set => this.put_IsDecimalPointAlwaysDisplayed(value)
    }

    /**
     * Gets or sets the numbering system that is used to format and parse currency values.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.numeralsystem
     * @type {HSTRING} 
     */
    NumeralSystem {
        get => this.get_NumeralSystem()
        set => this.put_NumeralSystem(value)
    }

    /**
     * Gets the language that was most recently used to format or parse currency values.
     * @remarks
     * If your app passes language tags from this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the numeral system used by [CurrencyFormatter](currencyformatter.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Gets the geographic region that was most recently used to format or parse currency values.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.resolvedgeographicregion
     * @type {HSTRING} 
     */
    ResolvedGeographicRegion {
        get => this.get_ResolvedGeographicRegion()
    }

    /**
     * Gets or sets whether the currency is formatted with the currency symbol or currency code.
     * @remarks
     * See the remarks for [CurrencyFormatter((String, IIterable(String), String))](currencyformatter_currencyformatter_1781948400.md) for an explanation of how the currency code may be displayed when the currency symbol is ambiguous even if the Mode property is **UseSymbol**.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets or sets the current padding to significant digits when a currency amount is formatted.
     * @remarks
     * Trailing zeros are added to the format until the given number of significant digits is exhausted. If there are more digits, this property does not cause them to be truncated.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.significantdigits
     * @type {Integer} 
     */
    SignificantDigits {
        get => this.get_SignificantDigits()
        set => this.put_SignificantDigits(value)
    }

    /**
     * Gets or sets the current rounding strategy to be used when formatting currency amounts.
     * @remarks
     * When a **Format** method is called, the appropriate rounding function from the number rounder object manipulates the input prior to it being formatted.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.numberrounder
     * @type {INumberRounder} 
     */
    NumberRounder {
        get => this.get_NumberRounder()
        set => this.put_NumberRounder(value)
    }

    /**
     * Gets or sets whether -0 is formatted using the conventions for negative numbers or for positive numbers. (In the Latin numeral system, the choice is "-0" or "0".)
     * @remarks
     * You can set this property to specify that [CurrencyFormatter](currencyformatter.md) display negative 0 as "-0". This enables the scenario where you wish to display "-0" when it represents the rounded value of some small negative value (such as -0.00001).
     * 
     * This property defaults to **false** to be consistent with Windows 8 and Windows Server 2012, in which -0 was always formatted as "0".
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.iszerosigned
     * @type {Boolean} 
     */
    IsZeroSigned {
        get => this.get_IsZeroSigned()
        set => this.put_IsZeroSigned(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Currency() {
        if (!this.HasProp("__ICurrencyFormatter")) {
            if ((queryResult := this.QueryInterface(ICurrencyFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrencyFormatter := ICurrencyFormatter(outPtr)
        }

        return this.__ICurrencyFormatter.get_Currency()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Currency(value) {
        if (!this.HasProp("__ICurrencyFormatter")) {
            if ((queryResult := this.QueryInterface(ICurrencyFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrencyFormatter := ICurrencyFormatter(outPtr)
        }

        return this.__ICurrencyFormatter.put_Currency(value)
    }

    /**
     * Attempts to parse a string representation of an integer currency value.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.parseint
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
     * Attempts to parse a string representation of an unsigned integer currency value.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.parseuint
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
     * Attempts to parse a string representation of a **Double** currency value.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.parsedouble
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
     * Returns a string representation of an **Int64** currency value.
     * @param {Integer} value The **Int64** currency value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.formatint
     */
    FormatInt(value) {
        if (!this.HasProp("__INumberFormatter2")) {
            if ((queryResult := this.QueryInterface(INumberFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter2 := INumberFormatter2(outPtr)
        }

        return this.__INumberFormatter2.FormatInt(value)
    }

    /**
     * Returns a string representation of a **UInt64** currency value.
     * @param {Integer} value The **UInt64** currency value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.formatuint
     */
    FormatUInt(value) {
        if (!this.HasProp("__INumberFormatter2")) {
            if ((queryResult := this.QueryInterface(INumberFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter2 := INumberFormatter2(outPtr)
        }

        return this.__INumberFormatter2.FormatUInt(value)
    }

    /**
     * Returns a string representation of a **Double** currency value.
     * @param {Float} value The **Double** currency value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.formatdouble
     */
    FormatDouble(value) {
        if (!this.HasProp("__INumberFormatter2")) {
            if ((queryResult := this.QueryInterface(INumberFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter2 := INumberFormatter2(outPtr)
        }

        return this.__INumberFormatter2.FormatDouble(value)
    }

    /**
     * Returns a string representation of an **Int64** currency value.
     * @remarks
     * See the remarks for [CurrencyFormatter((String, IIterable(String), String))](currencyformatter_currencyformatter_1781948400.md) for an explanation of how the currency code may be displayed when the currency symbol is ambiguous.
     * @param {Integer} value The **Int64** currency value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.format
     */
    FormatInt1(value) {
        if (!this.HasProp("__INumberFormatter")) {
            if ((queryResult := this.QueryInterface(INumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter := INumberFormatter(outPtr)
        }

        return this.__INumberFormatter.FormatInt(value)
    }

    /**
     * Returns a string representation of an **Int64** currency value.
     * @remarks
     * See the remarks for [CurrencyFormatter((String, IIterable(String), String))](currencyformatter_currencyformatter_1781948400.md) for an explanation of how the currency code may be displayed when the currency symbol is ambiguous.
     * @param {Integer} value The **Int64** currency value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.format
     */
    FormatUInt1(value) {
        if (!this.HasProp("__INumberFormatter")) {
            if ((queryResult := this.QueryInterface(INumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter := INumberFormatter(outPtr)
        }

        return this.__INumberFormatter.FormatUInt(value)
    }

    /**
     * Returns a string representation of an **Int64** currency value.
     * @remarks
     * See the remarks for [CurrencyFormatter((String, IIterable(String), String))](currencyformatter_currencyformatter_1781948400.md) for an explanation of how the currency code may be displayed when the currency symbol is ambiguous.
     * @param {Float} value The **Int64** currency value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.format
     */
    FormatDouble1(value) {
        if (!this.HasProp("__INumberFormatter")) {
            if ((queryResult := this.QueryInterface(INumberFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberFormatter := INumberFormatter(outPtr)
        }

        return this.__INumberFormatter.FormatDouble(value)
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
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__ICurrencyFormatter2")) {
            if ((queryResult := this.QueryInterface(ICurrencyFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrencyFormatter2 := ICurrencyFormatter2(outPtr)
        }

        return this.__ICurrencyFormatter2.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__ICurrencyFormatter2")) {
            if ((queryResult := this.QueryInterface(ICurrencyFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrencyFormatter2 := ICurrencyFormatter2(outPtr)
        }

        return this.__ICurrencyFormatter2.put_Mode(value)
    }

    /**
     * Applies the specified rounding algorithm to the [CurrencyFormatter](currencyformatter.md).
     * @remarks
     * ApplyRoundingForCurrency initializes [NumberRounder](currencyformatter_numberrounder.md) to an [IncrementNumberRounder](incrementnumberrounder.md) object whose increment is set such that the inputs to [Format](currencyformatter_format_339880429.md) will be rounded to the number of fraction digits established by [Currency](currencyformatter_currency.md). The number of fraction digits can be obtained from the default value of the [FractionDigits](currencyformatter_fractiondigits.md) property.
     * @param {Integer} roundingAlgorithm_ A value of the [RoundingAlgorithm](roundingalgorithm.md) enumeration.
     * 
     * > [!NOTE]
     * > [RoundingAlgorithm.None](roundingalgorithm.md) is not a valid value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformatter.applyroundingforcurrency
     */
    ApplyRoundingForCurrency(roundingAlgorithm_) {
        if (!this.HasProp("__ICurrencyFormatter2")) {
            if ((queryResult := this.QueryInterface(ICurrencyFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrencyFormatter2 := ICurrencyFormatter2(outPtr)
        }

        return this.__ICurrencyFormatter2.ApplyRoundingForCurrency(roundingAlgorithm_)
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
