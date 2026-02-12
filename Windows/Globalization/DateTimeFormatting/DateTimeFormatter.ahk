#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDateTimeFormatter.ahk
#Include .\IDateTimeFormatter2.ahk
#Include .\IDateTimeFormatterFactory.ahk
#Include .\IDateTimeFormatterStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Formats dates and times.
 * @remarks
 * > [!NOTE]
 * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
 * 
 * > [!NOTE]
 * > If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * 
 * Some of the constructors for DateTimeFormatter take a *formatTemplate* string parameter that specifies the requested components to be formatted. This parameter can be either a **format template** or a **format pattern**. Format templates are convenient to use and provide formatting which is typical for the language, clock and calendar that you specify. Format patterns provide greater control of output than format templates. If you need formatting that is non-standard, use format patterns instead of templates.
 * 
 * In a format template, you specify the components (time, date, day of week, etc.) that you want to include in the formatted output. The formatter formats the components as appropriate for the specified language, clock and calendar. The order of the components in your template does not matter; the formatter orders the components according to the order shown in the format template language below.
 * 
 * Some commonly-used templates are listed in the following table. In templates with more than one component, the component may be any of the supported component variations and the components may be in any order. For example, "dayofweek.full year month.numeric day" is supported. (See below, after the Examples, for the grammar that defines valid templates.)
 * 
 * > [!IMPORTANT]
 * > You can't arbitrarily combine components and necessarily obtain a valid template. The only valid templates are those defined by the provided grammar.
 * 
 * <table>
 *    <tr><th>Template</th></tr>
 *    <tr><td>longdate</td></tr>
 *    <tr><td>shortdate</td></tr>
 *    <tr><td>longtime</td></tr>
 *    <tr><td>shorttime</td></tr>
 *    <tr><td>dayofweek</td></tr>
 *    <tr><td>dayofweek.full</td></tr>
 *    <tr><td>dayofweek.abbreviated</td></tr>
 *    <tr><td>day</td></tr>
 *    <tr><td>month</td></tr>
 *    <tr><td>month.full</td></tr>
 *    <tr><td>month.abbreviated</td></tr>
 *    <tr><td>month.numeric</td></tr>
 *    <tr><td>year</td></tr>
 *    <tr><td>year.full</td></tr>
 *    <tr><td>year.abbreviated</td></tr>
 *    <tr><td>dayofweek day month year</td></tr>
 *    <tr><td>dayofweek day month</td></tr>
 *    <tr><td>day month year</td></tr>
 *    <tr><td>day month</td></tr>
 *    <tr><td>month year</td></tr>
 *    <tr><td>hour</td></tr>
 *    <tr><td>minute</td></tr>
 *    <tr><td>second</td></tr>
 *    <tr><td>hour minute second</td></tr>
 *    <tr><td>hour minute</td></tr>
 *    <tr><td>timezone</td></tr>
 *    <tr><td>timezone.full</td></tr>
 *    <tr><td>timezone.abbreviated</td></tr>
 *    <tr><td>year month day hour</td></tr>
 * </table>
 * 
 * The following table shows sample output from formatters created with various values of template, language, and clock. The "Equivalent pattern" column provides a pattern that produces the same output as the template.
 * 
 * <table>
 *    <tr><th>Template</th><th>Language</th><th>Clock</th><th>Output</th><th>Equivalent pattern</th></tr>
 *    <tr><td>longdate</td><td>en-US</td><td>&lt;not specified&gt;</td><td>‎Monday‎, ‎September‎ ‎2‎, ‎2013</td><td>‎{dayofweek.full}‎, ‎{month.full}‎ ‎{day.integer}‎, ‎{year.full}</td></tr>
 *    <tr><td>longdate</td><td>fr-FR</td><td>&lt;not specified&gt;</td><td>lundi‎ ‎2‎ ‎septembre‎ ‎2013</td><td>{dayofweek.full}‎ ‎{day.integer}‎ ‎{month.full}‎ ‎{year.full}</td></tr>
 *    <tr><td>shortdate</td><td>en-US</td><td>&lt;not specified&gt;</td><td>9‎/‎2‎/‎2013</td><td>{month.integer}‎/‎{day.integer}‎/‎{year.full}</td></tr>
 *    <tr><td>shortdate</td><td>fr-FR</td><td>&lt;not specified&gt;</td><td>02‎/‎09‎/‎2013</td><td>‎{day.integer(2)}‎/‎{month.integer(2)}‎/‎{year.full}</td></tr>
 *    <tr><td>dayofweek month day</td><td>en-US</td><td>&lt;not specified&gt;</td><td>‎Monday‎, ‎September‎ ‎2</td><td>{dayofweek.full}‎, ‎{month.full}‎ ‎{day.integer}</td></tr>
 *    <tr><td>month day dayofweek</td><td>en-US</td><td>&lt;not specified&gt;</td><td>‎Monday‎, ‎September‎ ‎2</td><td>{dayofweek.full}‎, ‎{month.full}‎ ‎{day.integer}</td></tr>
 *    <tr><td>longtime</td><td>en-US</td><td>&lt;not specified&gt;</td><td>‎6‎:‎01‎:‎24‎ ‎AM</td><td>{hour.integer}‎:‎{minute.integer(2)}‎:‎{second.integer(2)}‎ ‎{period.abbreviated}</td></tr>
 *    <tr><td>longtime</td><td>en-US</td><td>24HourClock</td><td>‎17‎:‎32‎:‎45</td><td>{hour.integer}‎:‎{minute.integer(2)}‎:‎{second.integer(2)}</td></tr>
 *    <tr><td>longtime</td><td>fr-FR</td><td>&lt;not specified&gt;</td><td>17‎:‎32‎:‎45</td><td>{hour.integer(2)}‎:‎{minute.integer(2)}‎:‎{second.integer(2)}</td></tr>
 *    <tr><td>shorttime</td><td>en-US</td><td>&lt;not specified&gt;</td><td>6‎:‎01‎ ‎AM</td><td>{hour.integer}‎:‎{minute.integer(2)}‎ ‎{period.abbreviated}</td></tr>
 *    <tr><td>shorttime</td><td>en-US</td><td>24HourClock</td><td>17‎:‎32</td><td>‎{hour.integer}‎:‎{minute.integer(2)}</td></tr>
 *    <tr><td>shorttime</td><td>fr-FR</td><td>&lt;not specified&gt;</td><td>17‎:‎32</td><td>‎{hour.integer(2)}‎:‎{minute.integer(2)}</td></tr>
 * </table>
 * 
 * **Format patterns** are composed of a literal string with fields delimited by braces, such as "{day.numeric}/{month.numeric}/{year.full}". Some commonly-used fields are listed in the following table. (See below, after the Examples, for the grammar that defines valid patterns.)
 * 
 * > [!IMPORTANT]
 * > You can't arbitrarily combine fields and necessarily obtain a valid pattern. The only valid patterns are those defined by the provided grammar.
 * 
 * <table>
 *    <tr><th>Format pattern field</th></tr>
 *    <tr><td>{openbrace}</td></tr>
 *    <tr><td>{closebrace}</td></tr>
 *    <tr><td>{dayofweek.solo.&lt;type&gt;} where &lt;type&gt; is full / abbreviated / abbreviated(n)</td></tr>
 *    <tr><td>{dayofweek.&lt;type&gt;} where &lt;type&gt; is full / abbreviated / abbreviated(n)</td></tr>
 *    <tr><td>{day.&lt;type&gt;} where &lt;type&gt; is integer / integer(n)</td></tr>
 *    <tr><td>{month.&lt;type&gt;} where &lt;type&gt; is full / abbreviated / abbreviated(n) / integer / integer(n)</td></tr>
 *    <tr><td>{month.solo.&lt;type&gt;} where &lt;type&gt; is full / abbreviated / abbreviated(n)</td></tr>
 *    <tr><td>{year.&lt;type&gt;} where &lt;type&gt; is full / abbreviated / abbreviated(n)</td></tr>
 *    <tr><td>{era.&lt;type&gt;} where &lt;type&gt; is full / abbreviated / abbreviated(n)</td></tr>
 *    <tr><td>{hour.&lt;type&gt;} where &lt;type&gt; is integer / integer(n)</td></tr>
 *    <tr><td>{period.&lt;type&gt;} where &lt;type&gt; is full / abbreviated / abbreviated(n)</td></tr>
 *    <tr><td>{minute.&lt;type&gt;} where &lt;type&gt; is integer / integer(n)</td></tr>
 *    <tr><td>{second.&lt;type&gt;} where &lt;type&gt; is integer / integer(n)</td></tr>
 *    <tr><td>{timezone.&lt;type&gt;} where &lt;type&gt; is full / abbreviated / abbreviated(n)</td></tr>
 * </table>
 * 
 * > [!NOTE]
 * > + Use **{openbrace}** or **{closebrace}** to specify that "{" or "}" appears as part of the literal string.
 * + **solo** specifies the standalone form. For languages with genitive case distinctions, the genitive case is the unmarked case. To get the nominative case, use **solo**.
 * + **integer(2)** for the fifth day of the month (for example) is "05", while **integer(1)** produces "5". **integer** produces the best **n** for a given language/calendar combination.
 * + For years, **full** produces all digits ("2013"). **abbreviated** is synonymous with **abbreviated(2)**, which is the 2-digit year for the gregorian calendar ("13"). (Other calendars may eventually use something else as the default; we have kept **abbreviated** to have the semantics of the best for a given language/calendar combination.) **abbreviated(n)** is truncated to the least significant **n** digits (for example, 2013 with **n** =1 is "3").
 * 
 * The following table shows sample output from formatters created with various values of pattern, language, and clock.
 * 
 * <table>
 *    <tr><th>Pattern</th><th>Language</th><th>Clock</th><th>Output</th></tr>
 *    <tr><td>{dayofweek.full}, ‎{month.full} {day.integer}, ‎{year.full}</td><td>en-US</td><td>&lt;not specified&gt;</td><td>Monday, ‎September 2, ‎2013</td></tr>
 *    <tr><td>{dayofweek.full}, ‎{day.integer(2)} ‎{month.full}, ‎{year.full}</td><td>fr-FR</td><td>&lt;not specified&gt;</td><td>lundi, ‎02 ‎septembre, ‎2013</td></tr>
 *    <tr><td>{month.integer}/‎{day.integer}/{year.full}</td><td>en-US</td><td>&lt;not specified&gt;</td><td>9/‎2/2013</td></tr>
 *    <tr><td>{month.integer}/‎{day.integer}/{year.abbreviated}</td><td>en-US</td><td>&lt;not specified&gt;</td><td>9/‎2/13</td></tr>
 *    <tr><td>{month.integer(2)}/‎{day.integer(2)}/{year.abbreviated}</td><td>en-US</td><td>&lt;not specified&gt;</td><td>09/‎02/13</td></tr>
 *    <tr><td>{hour.integer}:{minute.integer(2)}:{second.integer(2)} {period.abbreviated}</td><td>en-US</td><td>&lt;not specified&gt;</td><td>6:01:24 AM</td></tr>
 *    <tr><td>{hour.integer}:{minute.integer(2)}:{second.integer(2)} {period.abbreviated}</td><td>en-US</td><td>24HourClock</td><td>17:32:45</td></tr>
 * </table>
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class DateTimeFormatter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDateTimeFormatter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDateTimeFormatter.IID

    /**
     * Gets the [DateTimeFormatter](datetimeformatter.md) object that formats dates according to the user's choice of long date pattern.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.longdate
     * @type {DateTimeFormatter} 
     */
    static LongDate {
        get => DateTimeFormatter.get_LongDate()
    }

    /**
     * Gets the [DateTimeFormatter](datetimeformatter.md) object that formats times according to the user's choice of long time pattern.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.longtime
     * @type {DateTimeFormatter} 
     */
    static LongTime {
        get => DateTimeFormatter.get_LongTime()
    }

    /**
     * Gets the [DateTimeFormatter](datetimeformatter.md) object that formats dates according to the user's choice of short date pattern.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.shortdate
     * @type {DateTimeFormatter} 
     */
    static ShortDate {
        get => DateTimeFormatter.get_ShortDate()
    }

    /**
     * Gets the [DateTimeFormatter](datetimeformatter.md) object that formats times according to the user's choice of short time pattern.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.shorttime
     * @type {DateTimeFormatter} 
     */
    static ShortTime {
        get => DateTimeFormatter.get_ShortTime()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [DateTimeFormatter](datetimeformatter.md) object that is initialized by a format template string.
     * @param {HSTRING} formatTemplate A format template string that specifies the requested components. The order of the components is irrelevant. This can also be a format pattern. See the remarks for the [DateTimeFormatter](datetimeformatter.md) class for a list of valid format templates and format patterns.
     * @returns {DateTimeFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.#ctor
     */
    static CreateDateTimeFormatter(formatTemplate) {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterFactory.IID)
            DateTimeFormatter.__IDateTimeFormatterFactory := IDateTimeFormatterFactory(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterFactory.CreateDateTimeFormatter(formatTemplate)
    }

    /**
     * Creates a [DateTimeFormatter](datetimeformatter.md) object that is initialized by a format template string and language list.
     * @remarks
     * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @param {HSTRING} formatTemplate A format template string that specifies the requested components. The order of the components is irrelevant. This can also be a format pattern. See the remarks for the [DateTimeFormatter](datetimeformatter.md) class for a list of valid format templates and format patterns.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, that represent the choice of languages. These identifiers are used for resolving the template to a pattern and for formatting. See Remarks.
     * @returns {DateTimeFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.#ctor
     */
    static CreateDateTimeFormatterLanguages(formatTemplate, languages) {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterFactory.IID)
            DateTimeFormatter.__IDateTimeFormatterFactory := IDateTimeFormatterFactory(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterFactory.CreateDateTimeFormatterLanguages(formatTemplate, languages)
    }

    /**
     * Creates a [DateTimeFormatter](datetimeformatter.md) object that is initialized by a format template string, language list, geographic region, calendar, and clock.
     * @remarks
     * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @param {HSTRING} formatTemplate A format template string that specifies the requested components. The order of the components is irrelevant. This can also be a format pattern. See the remarks for the [DateTimeFormatter](datetimeformatter.md) class for a list of valid format templates and format patterns.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, that represent the choice of languages. These identifiers are used for resolving the template to a pattern, and for formatting. See Remarks.
     * @param {HSTRING} geographicRegion_ The identifier for the geographic region. This identifier is used for resolving the template to a pattern.
     * @param {HSTRING} calendar_ The calendar identifier to use.
     * @param {HSTRING} clock The clock identifier to use.
     * @returns {DateTimeFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.#ctor
     */
    static CreateDateTimeFormatterContext(formatTemplate, languages, geographicRegion_, calendar_, clock) {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterFactory.IID)
            DateTimeFormatter.__IDateTimeFormatterFactory := IDateTimeFormatterFactory(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterFactory.CreateDateTimeFormatterContext(formatTemplate, languages, geographicRegion_, calendar_, clock)
    }

    /**
     * Creates a [DateTimeFormatter](datetimeformatter.md) object that is initialized with year, month, day, and day of week formats.
     * @param {Integer} yearFormat_ The desired year format to include in the template.
     * @param {Integer} monthFormat_ The desired month format to include in the template.
     * @param {Integer} dayFormat_ The desired day format to include in the template.
     * @param {Integer} dayOfWeekFormat_ The desired day of week format to include in the template.
     * @returns {DateTimeFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.#ctor
     */
    static CreateDateTimeFormatterDate(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_) {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterFactory.IID)
            DateTimeFormatter.__IDateTimeFormatterFactory := IDateTimeFormatterFactory(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterFactory.CreateDateTimeFormatterDate(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_)
    }

    /**
     * Creates a [DateTimeFormatter](datetimeformatter.md) object that is initialized with hour, minute, and second formats.
     * @param {Integer} hourFormat_ The desired hour format to include in the template.
     * @param {Integer} minuteFormat_ The desired minute format to include in the template.
     * @param {Integer} secondFormat_ The desired second format to include in the template.
     * @returns {DateTimeFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.#ctor
     */
    static CreateDateTimeFormatterTime(hourFormat_, minuteFormat_, secondFormat_) {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterFactory.IID)
            DateTimeFormatter.__IDateTimeFormatterFactory := IDateTimeFormatterFactory(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterFactory.CreateDateTimeFormatterTime(hourFormat_, minuteFormat_, secondFormat_)
    }

    /**
     * Creates a [DateTimeFormatter](datetimeformatter.md) object that is initialized with year, month, day, day of week, hour, minute, and second formats, and a language list.
     * @remarks
     * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @param {Integer} yearFormat_ The year format to include in the template.
     * @param {Integer} monthFormat_ The month format to include in the template.
     * @param {Integer} dayFormat_ The day format to include in the template.
     * @param {Integer} dayOfWeekFormat_ The day of week format to include in the template.
     * @param {Integer} hourFormat_ The hour format to include in the template.
     * @param {Integer} minuteFormat_ The minute format to include in the template.
     * @param {Integer} secondFormat_ The second format to include in the template.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, that represent the choice of languages. These identifiers are used for resolving the template to a pattern and for formatting. See Remarks.
     * @returns {DateTimeFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.#ctor
     */
    static CreateDateTimeFormatterDateTimeLanguages(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_, hourFormat_, minuteFormat_, secondFormat_, languages) {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterFactory.IID)
            DateTimeFormatter.__IDateTimeFormatterFactory := IDateTimeFormatterFactory(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterFactory.CreateDateTimeFormatterDateTimeLanguages(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_, hourFormat_, minuteFormat_, secondFormat_, languages)
    }

    /**
     * Creates a [DateTimeFormatter](datetimeformatter.md) object with all formats and identifiers specified.
     * @remarks
     * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @param {Integer} yearFormat_ The desired year format to include in the template.
     * @param {Integer} monthFormat_ The desired month format to include in the template.
     * @param {Integer} dayFormat_ The desired day format to include in the template.
     * @param {Integer} dayOfWeekFormat_ The desired day of week format to include in the template.
     * @param {Integer} hourFormat_ The desired hour format to include in the template.
     * @param {Integer} minuteFormat_ The desired minute format to include in the template.
     * @param {Integer} secondFormat_ The desired second format to include in the template.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, that represent the choice of languages. These identifiers are used for resolving the template to a pattern, and for formatting. See Remarks.
     * @param {HSTRING} geographicRegion_ The identifier for the geographic region. This identifier is used for resolving the template to a pattern.
     * @param {HSTRING} calendar_ The calendar identifier to use.
     * @param {HSTRING} clock The clock identifier to use.
     * @returns {DateTimeFormatter} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.#ctor
     */
    static CreateDateTimeFormatterDateTimeContext(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_, hourFormat_, minuteFormat_, secondFormat_, languages, geographicRegion_, calendar_, clock) {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterFactory.IID)
            DateTimeFormatter.__IDateTimeFormatterFactory := IDateTimeFormatterFactory(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterFactory.CreateDateTimeFormatterDateTimeContext(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_, hourFormat_, minuteFormat_, secondFormat_, languages, geographicRegion_, calendar_, clock)
    }

    /**
     * 
     * @returns {DateTimeFormatter} 
     */
    static get_LongDate() {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterStatics.IID)
            DateTimeFormatter.__IDateTimeFormatterStatics := IDateTimeFormatterStatics(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterStatics.get_LongDate()
    }

    /**
     * 
     * @returns {DateTimeFormatter} 
     */
    static get_LongTime() {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterStatics.IID)
            DateTimeFormatter.__IDateTimeFormatterStatics := IDateTimeFormatterStatics(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterStatics.get_LongTime()
    }

    /**
     * 
     * @returns {DateTimeFormatter} 
     */
    static get_ShortDate() {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterStatics.IID)
            DateTimeFormatter.__IDateTimeFormatterStatics := IDateTimeFormatterStatics(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterStatics.get_ShortDate()
    }

    /**
     * 
     * @returns {DateTimeFormatter} 
     */
    static get_ShortTime() {
        if (!DateTimeFormatter.HasProp("__IDateTimeFormatterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.DateTimeFormatting.DateTimeFormatter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeFormatterStatics.IID)
            DateTimeFormatter.__IDateTimeFormatterStatics := IDateTimeFormatterStatics(factoryPtr)
        }

        return DateTimeFormatter.__IDateTimeFormatterStatics.get_ShortTime()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the priority list of language identifiers that is used when formatting dates and times.
     * @remarks
     * Initialize this class with a [BCP-47](https://tools.ietf.org/html/bcp47) language tag. For example, to work with the best current user-preferred language, pass in the top value from [Windows.System.UserProfile.GlobalizationPreferences](../windows.system.userprofile/globalizationpreferences.md).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * 
     * > [!NOTE]
     * > If your app passes language tags from this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.languages
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * Gets or sets the region that is used when formatting dates and times.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.geographicregion
     * @type {HSTRING} 
     */
    GeographicRegion {
        get => this.get_GeographicRegion()
    }

    /**
     * Gets the calendar that is used when formatting dates.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.calendar
     * @type {HSTRING} 
     */
    Calendar {
        get => this.get_Calendar()
    }

    /**
     * Gets the clock that is used when formatting times.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.clock
     * @type {HSTRING} 
     */
    Clock {
        get => this.get_Clock()
    }

    /**
     * Gets or sets the numbering system that is used to format dates and times.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.numeralsystem
     * @type {HSTRING} 
     */
    NumeralSystem {
        get => this.get_NumeralSystem()
        set => this.put_NumeralSystem(value)
    }

    /**
     * Gets the patterns corresponding to this template that are used when formatting dates and times.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.patterns
     * @type {IVectorView<HSTRING>} 
     */
    Patterns {
        get => this.get_Patterns()
    }

    /**
     * Gets a string representation of this format template.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.template
     * @type {HSTRING} 
     */
    Template {
        get => this.get_Template()
    }

    /**
     * Gets the [YearFormat](yearformat.md) in the template.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.includeyear
     * @type {Integer} 
     */
    IncludeYear {
        get => this.get_IncludeYear()
    }

    /**
     * Gets the [MonthFormat](monthformat.md) in the template.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.includemonth
     * @type {Integer} 
     */
    IncludeMonth {
        get => this.get_IncludeMonth()
    }

    /**
     * Gets the [DayOfWeekFormat](dayofweekformat.md) in the template.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.includedayofweek
     * @type {Integer} 
     */
    IncludeDayOfWeek {
        get => this.get_IncludeDayOfWeek()
    }

    /**
     * Gets the [DayFormat](dayformat.md) in the template.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.includeday
     * @type {Integer} 
     */
    IncludeDay {
        get => this.get_IncludeDay()
    }

    /**
     * Gets the [HourFormat](hourformat.md) in the template.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.includehour
     * @type {Integer} 
     */
    IncludeHour {
        get => this.get_IncludeHour()
    }

    /**
     * Gets the [MinuteFormat](minuteformat.md) in the template.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.includeminute
     * @type {Integer} 
     */
    IncludeMinute {
        get => this.get_IncludeMinute()
    }

    /**
     * Gets the [SecondFormat](secondformat.md) in the template.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.includesecond
     * @type {Integer} 
     */
    IncludeSecond {
        get => this.get_IncludeSecond()
    }

    /**
     * Gets the language that was most recently used to format dates and times.
     * @remarks
     * If your app passes language tags from this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * 
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Gets the geographic region that was most recently used to format dates and times.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.resolvedgeographicregion
     * @type {HSTRING} 
     */
    ResolvedGeographicRegion {
        get => this.get_ResolvedGeographicRegion()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_Languages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GeographicRegion() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_GeographicRegion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Calendar() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_Calendar()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Clock() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_Clock()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumeralSystem() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_NumeralSystem()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NumeralSystem(value) {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.put_NumeralSystem(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Patterns() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_Patterns()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Template() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_Template()
    }

    /**
     * Returns a string that represents the given date and time in the given time zone, conforming to the template the formatter is currently using.
     * @remarks
     * > [!NOTE]
     * > If your application supports the Japanese calendar, you should validate that it properly handles the May 2019 Japanese era change. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {DateTime} value 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.format
     */
    Format(value) {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.Format(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeYear() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_IncludeYear()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeMonth() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_IncludeMonth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeDayOfWeek() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_IncludeDayOfWeek()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeDay() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_IncludeDay()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeHour() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_IncludeHour()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeMinute() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_IncludeMinute()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeSecond() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_IncludeSecond()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_ResolvedLanguage()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedGeographicRegion() {
        if (!this.HasProp("__IDateTimeFormatter")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter := IDateTimeFormatter(outPtr)
        }

        return this.__IDateTimeFormatter.get_ResolvedGeographicRegion()
    }

    /**
     * Returns a string representation of the provided date and time.
     * @remarks
     * > [!NOTE]
     * > If your application supports the Japanese calendar, you should validate that it properly handles the May 2019 Japanese era change. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {DateTime} datetime_ 
     * @param {HSTRING} timeZoneId 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.datetimeformatter.format
     */
    FormatUsingTimeZone(datetime_, timeZoneId) {
        if (!this.HasProp("__IDateTimeFormatter2")) {
            if ((queryResult := this.QueryInterface(IDateTimeFormatter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeFormatter2 := IDateTimeFormatter2(outPtr)
        }

        return this.__IDateTimeFormatter2.FormatUsingTimeZone(datetime_, timeZoneId)
    }

;@endregion Instance Methods
}
