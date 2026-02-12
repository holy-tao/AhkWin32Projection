#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICalendarIdentifiersStatics.ahk
#Include .\ICalendarIdentifiersStatics2.ahk
#Include .\ICalendarIdentifiersStatics3.ahk
#Include ..\..\Guid.ahk

/**
 * Contains the calendar identifiers for the supported calendars, as static properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class CalendarIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * Gets the identifier for the Gregorian calendar.
     * @remarks
     * The returned identifier is suitable for use anywhere a calendar identifier is required.
     * 
     * 
     * 
     * The Gregorian calendar recognizes two eras: B.C. or B.C.E., and A.D. or C.E. This implementation of the Gregorian calendar system recognizes only the current era (A.D.).
     * 
     * A leap year in the Gregorian calendar is defined as a year that is evenly divisible by four, except if it is divisible by 100. However, years that are divisible by 400 are leap years. For example, the year 1900 was not a leap year, but the year 2000 was. A common year has 365 days and a leap year has 366 days.
     * 
     * The Gregorian calendar has 12 months with 28 to 31 days each: January (31 days), February (28 or 29 days), March (31 days), April (30 days), May (31 days), June (30 days), July (31 days), August (31 days), September (30 days), October (31 days), November (30 days), and December (31 days). February has 29 days during leap years and 28 during common years.
     * 
     * Gregorian calendar strings for day of the week names and month names are localized for all supported locales and hence will appear in the language corresponding to the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.gregorian
     * @type {HSTRING} 
     */
    static Gregorian {
        get => CalendarIdentifiers.get_Gregorian()
    }

    /**
     * Gets the identifier for the Hebrew calendar.
     * @remarks
     * The Hebrew calendar recognizes two eras: B.C.E. (before the common era) and C.E. (current era). This implementation of the Hebrew calendar system recognizes only the current era (C.E.) and the Hebrew years 5343 to 5999 (1583 to 2239 in the [Gregorian](calendaridentifiers_gregorian.md) calendar).
     * 
     * In every 19-year cycle that ends with a year that is evenly divisible by 19, the 3rd, 6th, 8th, 11th, 14th, 17th, and 19th years are leap years. A common year can have from 353 to 355 days, depending on the placement of Jewish holidays. A leap year can have from 383 to 385 days.
     * 
     * The Hebrew calendar has 12 months during common years and 13 months during leap years:
     * 
     * | [MonthAsNumericString](calendar_monthasnumericstring_952914344.md) (common year) | [MonthAsNumericString](calendar_monthasnumericstring_952914344.md) (leap year) | Month | Days in common years | Days in leap years |
     * |---|---|---|---|---|
     * | 1 | 1 | תשרי (Tishrei) | 30 | 30 |
     * | 2 | 2 | חשון (Cheshvan) | 29/30 | 29/30 |
     * | 3 | 3 | כסלו (Kislev) | 29/30 | 29/30 |
     * | 4 | 4 | טבת (Tevet) | 29 | 29 |
     * | 5 | 5 | שבט (Shevat) | 30 | 30 |
     * | 6 | - | אדר (Adar) | 29 | - |
     * | - | 6 | אדר א (Adar Alef) | - | 30 |
     * | - | 7 | אדר ב (Adar Beit) | - | 29 |
     * | 7 | 8 | ניסן (Nissan) | 30 | 30 |
     * | 8 | 9 | אייר (Iyar) | 29 | 29 |
     * | 9 | 10 | סיון (Sivan) | 30 | 30 |
     * | 10 | 11 | תמוז (Tamuz) | 29 | 29 |
     * | 11 | 12 | אב (Av) | 30 | 30 |
     * | 12 | 13 | אלול (Elul) | 29 | 29 |
     * 
     * The days in Cheshvan and Kislev vary depending on the placement of Jewish holidays. During leap years, Adar is replaced by Adar Alef with 30 days and Adar Beit with 29 days. Adar Beit is considered the leap month. The last day of Adar Alef and all the days in Adar Beit are considered leap days.
     * 
     * The date January 1, 2012 A.D. in the Gregorian calendar is equivalent to the sixth day of Tevet in the year 5772 C.E. in the Hebrew calendar.
     * 
     * Hebrew calendar strings for day of the week names and month names are not localized and hence will appear in Hebrew regardless of the current value of the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.hebrew
     * @type {HSTRING} 
     */
    static Hebrew {
        get => CalendarIdentifiers.get_Hebrew()
    }

    /**
     * Gets the identifier for the Hijri calendar.
     * @remarks
     * The Hijri calendar system recognizes one era: A.H. (Latin "Anno Hegirae", which means "the year of the migration", in reference to the migration of Muhammad from Mecca).
     * 
     * In every 30-year cycle that ends with a year that is evenly divisible by 30, the 2nd, 5th, 7th, 10th, 13th, 16th, 18th, 21st, 24th, 26th, and 29th years are leap years. A common year has 354 days and a leap year has 355 days.
     * 
     * The Hijri calendar has 12 months with 29 to 30 days each:<table>
     *    <tr><th>[MonthAsNumericString](calendar_monthasnumericstring_952914344.md)</th><th>Month</th><th>Days in common years</th><th>Days in leap years</th></tr>
     *    <tr><td>1</td><td>محرم (Muharram)</td><td>30</td><td>30</td></tr>
     *    <tr><td>2</td><td>صفر (Safar)</td><td>29</td><td>29</td></tr>
     *    <tr><td>3</td><td>‏ربيع الاول (Rabi I)</td><td>30</td><td>30</td></tr>
     *    <tr><td>4</td><td>‏ربيع الثاني (Rabi II)</td><td>29</td><td>29</td></tr>
     *    <tr><td>5</td><td>جمادى الاولى (Jumada I)</td><td>30</td><td>30</td></tr>
     *    <tr><td>6</td><td>جمادى الثانية (Jumada II)</td><td>29</td><td>29</td></tr>
     *    <tr><td>7</td><td>رجب (Rajab)</td><td>30</td><td>30</td></tr>
     *    <tr><td>8</td><td>شعبان (Shaban)</td><td>29</td><td>29</td></tr>
     *    <tr><td>9</td><td>رمضان (Ramadan)</td><td>30</td><td>30</td></tr>
     *    <tr><td>10</td><td>شوال (Shawwal)</td><td>29</td><td>29</td></tr>
     *    <tr><td>11</td><td>ذو القعدة (Zulkadah)</td><td>30</td><td>30</td></tr>
     *    <tr><td>12</td><td>ذو الحجة (Zulhijjah)</td><td>29</td><td>30</td></tr>
     * </table>
     * 
     * Ramadan, the month of fasting in the Muslim world, officially starts and ends according to a decree that is based on the observation of the new moon. Therefore, the number of days in Shaban and the number of days in Ramadan vary.
     * 
     * The date January 1, 2012 A.D. in the [Gregorian](calendaridentifiers_gregorian.md) calendar is roughly equivalent to the seventh day of Safar in the year 1433 A.H. in the Hijri calendar.
     * 
     * Hijri calendar strings for day of the week names and month names are not localized and hence will appear in Arabic regardless of the current value of the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.hijri
     * @type {HSTRING} 
     */
    static Hijri {
        get => CalendarIdentifiers.get_Hijri()
    }

    /**
     * Gets the identifier for the Japanese calendar.
     * @remarks
     * The Japanese calendar, also known as the Wareki calendar, works exactly like the [Gregorian](calendaridentifiers_gregorian.md) calendar, except that the year and era are different.
     * 
     * The Japanese calendar recognizes one era for every emperor's reign. The current era is the Heisei era, which began in the Gregorian calendar year 1989. The era name is typically displayed before the year. For example, the Gregorian calendar year 2012 is the Japanese calendar year Heisei 24.
     * 
     * The [CalendarIdentifiers](calendaridentifiers.md) class assigns numbers to the Japanese eras as follows:
     * 
     * | [Era](calendar_era.md) value | [EraAsString](calendar_eraasstring_1742852677.md) | Gregorian Dates |
     * |---|---|---|
     * | 4 | 平成 (Heisei) | January 8, 1989 to present |
     * | 3 | 昭和 (Showa) | December 25, 1926 to January 7, 1989 |
     * | 2 | 大正 (Taisho) | July 30, 1912 to December 24, 1926 |
     * | 1 | 明治 (Meiji) | January 1, 1868 to July 29, 1912 |
     * 
     * The [CalendarIdentifiers](calendaridentifiers.md) class handles dates only from the first day of the first month in the year Meiji 1 (January 1, 1868 of the Gregorian calendar). Although the Japanese calendar was switched from a lunar calendar to a solar calendar in the year Meiji 6 (1873 of the Gregorian calendar), this implementation is based on the solar calendar only.
     * 
     * Leap years in the Japanese calendar correspond to the same leap years in the Gregorian calendar. A leap year in the Gregorian calendar is defined as a Gregorian year that is evenly divisible by four, except if it is divisible by 100. However, Gregorian years that are divisible by 400 are leap years. A common year has 365 days and a leap year has 366 days.
     * 
     * The Japanese calendar has 12 months with 28 to 31 days each:
     * 
     * | [MonthAsNumericString](calendar_monthasnumericstring_952914344.md) | Month | English | Days in common years | Days in leap years |
     * |---|---|---|---|---|
     * | 1 | 1月 (Ichigatsu) | January | 31 | 31 |
     * | 2 | 2月 (Nigatsu) | February | 28 | 29 |
     * | 3 | 3月 (Sangatsu) | March | 31 | 31 |
     * | 4 | 4月 (Shigatsu) | April | 30 | 30 |
     * | 5 | 5月 (Gogatsu) | May | 31 | 31 |
     * | 6 | 6月 (Rokugatsu) | June | 30 | 30 |
     * | 7 | 7月 (Shichigatsu) | July | 31 | 31 |
     * | 8 | 8月 (Hachigatsu) | August | 31 | 31 |
     * | 9 | 9月 (Kugatsu) | September | 30 | 30 |
     * | 10 | 10月 (Juugatsu) | October | 31 | 31 |
     * | 11 | 11月 (Juuichigatsu) | November | 30 | 30 |
     * | 12 | 12月 (Juunigatsu) | December | 31 | 31 |
     * 
     * Nigatsu, which is equivalent to the Gregorian calendar month of February, has 29 days during leap years and 28 during common years.
     * 
     * The date January 1, 2012 A.D. in the Gregorian calendar is equivalent to the first day of Ichigatsu in the year Heisei 24 in the Japanese calendar.
     * 
     * Japanese calendar strings for era, day of the week names and month names are not localized and hence will appear in Japanese regardless of the current value of the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.japanese
     * @type {HSTRING} 
     */
    static Japanese {
        get => CalendarIdentifiers.get_Japanese()
    }

    /**
     * Gets the identifier for the Julian calendar.
     * @remarks
     * In 45 B.C., Julius Caesar ordered a calendar reform, which resulted in the calendar called the Julian calendar. The Julian calendar is the predecessor of the [Gregorian](calendaridentifiers_gregorian.md) calendar.
     * 
     * The Julian calendar system recognizes only the current era.
     * 
     * Unlike the Gregorian calendar, the Julian calendar defines a leap year as a year that is evenly divisible by four with no exceptions. Therefore, the calendar is inaccurate by one day every 128 years. A common year has 365 days and a leap year has 366 days.
     * 
     * Like the Gregorian calendar, the Julian calendar has 12 months with 28 to 31 days each: January (31 days), February (28 or 29 days), March (31 days), April (30 days), May (31 days), June (30 days), July (31 days), August (31 days), September (30 days), October (31 days), November (30 days), and December (31 days). February has 29 days during leap years and 28 during common years.
     * 
     * The date January 1, 2012 A.D. in the Gregorian calendar is equivalent to the 19th day of December in the year 2011 in the Julian calendar.
     * 
     * Julian calendar strings for day of the week names and month names are localized for all supported locales and hence will appear in the language corresponding to the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.julian
     * @type {HSTRING} 
     */
    static Julian {
        get => CalendarIdentifiers.get_Julian()
    }

    /**
     * Gets the identifier for the Korean calendar.
     * @remarks
     * The Korean calendar is exactly like the [Gregorian](calendaridentifiers_gregorian.md) calendar, except that the year and era are different.
     * 
     * The Korean calendar system recognizes only the current era.
     * 
     * Leap years in the Korean calendar correspond to the same leap years in the Gregorian calendar. A leap year in the Gregorian calendar is defined as a Gregorian year that is evenly divisible by four, except if it is divisible by 100. However, Gregorian years that are divisible by 400 are leap years. A common year has 365 days and a leap year has 366 days.
     * 
     * The Korean calendar has 12 months with 28 to 31 days each:<table>
     *    <tr><th>[MonthAsNumericString](calendar_monthasnumericstring_952914344.md)</th><th>Month</th><th>Days in common years</th><th>Days in leap years</th></tr>
     *    <tr><td>1</td><td>1월 (January)</td><td>31</td><td>31</td></tr>
     *    <tr><td>2</td><td>2월 (February)</td><td>28</td><td>29</td></tr>
     *    <tr><td>3</td><td>3월 (March)</td><td>31</td><td>31</td></tr>
     *    <tr><td>4</td><td>4월 (April)</td><td>30</td><td>30</td></tr>
     *    <tr><td>5</td><td>5월 (May)</td><td>31</td><td>31</td></tr>
     *    <tr><td>6</td><td>6월 (June)</td><td>30</td><td>30</td></tr>
     *    <tr><td>7</td><td>7월 (July)</td><td>31</td><td>31</td></tr>
     *    <tr><td>8</td><td>8월 (August)</td><td>31</td><td>31</td></tr>
     *    <tr><td>9</td><td>9월 (September)</td><td>30</td><td>30</td></tr>
     *    <tr><td>10</td><td>10월 (October)</td><td>31</td><td>31</td></tr>
     *    <tr><td>11</td><td>11월 (November)</td><td>30</td><td>30</td></tr>
     *    <tr><td>12</td><td>12월 (December)</td><td>31</td><td>31</td></tr>
     * </table>
     * 
     * February has 29 days during leap years and 28 days during common years.
     * 
     * The date January 1, 2012 A.D. in the Gregorian calendar is equivalent to the first day of January in the year 4345 of the current era in the Korean calendar.
     * 
     * Because the Korean calendar corresponds to the Gregorian calendar, Korean calendar strings for day of the week names and month names are localized for all supported locales and hence will appear in the language corresponding to the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.korean
     * @type {HSTRING} 
     */
    static Korean {
        get => CalendarIdentifiers.get_Korean()
    }

    /**
     * Gets the identifier for the Taiwan calendar.
     * @remarks
     * The Taiwan calendar works exactly like the [Gregorian](calendaridentifiers_gregorian.md) calendar, except that the year and era are different. The Taiwan calendar system recognizes only the current era.
     * 
     * Leap years in the Taiwan calendar correspond to the same leap years in the Gregorian calendar. A leap year in the Gregorian calendar is defined as a Gregorian year that is evenly divisible by four, except if it is divisible by 100. However, Gregorian years that are divisible by 400 are leap years. A common year has 365 days and a leap year has 366 days.
     * 
     * The Taiwan calendar has 12 months with 28 to 31 days each:
     * 
     * | [MonthAsNumericString](calendar_monthasnumericstring_952914344.md) | Month | Days in common years | Days in leap years |
     * |---|---|---|---|
     * | 1 | 1月 (January) | 31 | 31 |
     * | 2 | 2月 (February) | 28 | 29 |
     * | 3 | 3月 (March) | 31 | 31 |
     * | 4 | 4月 (April) | 30 | 30 |
     * | 5 | 5月 (May) | 31 | 31 |
     * | 6 | 6月 (June) | 30 | 30 |
     * | 7 | 7月 (July) | 31 | 31 |
     * | 8 | 8月 (August) | 31 | 31 |
     * | 9 | 9月 (September) | 30 | 30 |
     * | 10 | 10月 (October) | 31 | 31 |
     * | 11 | 11月 (November) | 30 | 30 |
     * | 12 | 12月 (December) | 31 | 31 |
     * 
     * February has 29 days during leap years and 28 during common years.
     * 
     * The date January 1, 2012 C.E. in the Gregorian calendar is equivalent to the first day of January in the year 101 of the current era in the Taiwan calendar.
     * 
     * Because the Taiwan calendar corresponds to the Gregorian calendar, Taiwan calendar strings for day of the week names and month names are localized for all supported locales and hence will appear in the language corresponding to the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.taiwan
     * @type {HSTRING} 
     */
    static Taiwan {
        get => CalendarIdentifiers.get_Taiwan()
    }

    /**
     * Gets the identifier for the Thai calendar.
     * @remarks
     * The Thai calendar works exactly like the [Gregorian](calendaridentifiers_gregorian.md) calendar, except that the year and era are different.
     * 
     * The Thai calendar system recognizes only the current era.
     * 
     * Leap years in the Thai calendar correspond to the same leap years in the Gregorian calendar. A leap year in the Gregorian calendar is defined as a Gregorian year that is evenly divisible by four, except if it is divisible by 100. However, Gregorian years that are divisible by 400 are leap years. A common year has 365 days and a leap year has 366 days. The Thai calendar has 12 months with 28 to 31 days each:<table>
     *    <tr><th>[MonthAsNumericString](calendar_monthasnumericstring_952914344.md)</th><th>Month</th><th>Days in common years</th><th>Days in leap years</th></tr>
     *    <tr><td>1</td><td>มกราคม (January)</td><td>31</td><td>31</td></tr>
     *    <tr><td>2</td><td>กุมภาพันธ์ (February)</td><td>28</td><td>29</td></tr>
     *    <tr><td>3</td><td>มีนาคม (March)</td><td>31</td><td>31</td></tr>
     *    <tr><td>4</td><td>เมษายน (April)</td><td>30</td><td>30</td></tr>
     *    <tr><td>5</td><td>พฤษภาคม (May)</td><td>31</td><td>31</td></tr>
     *    <tr><td>6</td><td>มิถุนายน (June)</td><td>30</td><td>30</td></tr>
     *    <tr><td>7</td><td>กรกฎาคม (July)</td><td>31</td><td>31</td></tr>
     *    <tr><td>8</td><td>สิงหาคม (August)</td><td>31</td><td>31</td></tr>
     *    <tr><td>9</td><td>กันยายน (September)</td><td>30</td><td>30</td></tr>
     *    <tr><td>10</td><td>ตุลาคม (October)</td><td>31</td><td>31</td></tr>
     *    <tr><td>11</td><td>พฤศจิกายน (November)</td><td>30</td><td>30</td></tr>
     *    <tr><td>12</td><td>ธันวาคม (December)</td><td>31</td><td>31</td></tr>
     * </table>
     * 
     * February has 29 days during leap years and 28 during common years.
     * 
     * The date January 1, 2012 A.D. in the Gregorian calendar is equivalent to the first day of January in the year 2555 of the current era in the Thai calendar.
     * 
     * Because the Thai calendar corresponds to the Gregorian calendar, Thai calendar strings for day of the week names and month names are localized for all supported locales and hence will appear in the language corresponding to the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.thai
     * @type {HSTRING} 
     */
    static Thai {
        get => CalendarIdentifiers.get_Thai()
    }

    /**
     * Gets the identifier for the Um Al-Qura calendar.
     * @remarks
     * The Um Al-Qura calendar or Saudi Hijri system is nearly identical to the [Hijri](calendaridentifiers_hijri.md) calendar system, except in using a table-based algorithm licensed from the Saudi government to calculate dates, and in supporting dates only for the years 1318 to 1500 (corresponding approximately to Gregorian dates April 30, 1900 through November 16, 2077).
     * 
     * For the Um Al-Qura calendar, each month has either 29 or 30 days, but usually in no discernible order. Whereas the documentation for the Hijri calendar gives a table that shows the corresponding days in each month, no such general table can be produced for the Um Al-Qura calendar.
     * 
     * Like the Hijri calendar, Um Al-Qura calendar strings for day of the week names and month names are not localized and hence will appear in Arabic regardless of the current value of the [ResolvedLanguage](calendar_resolvedlanguage.md) property of the calendar object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.umalqura
     * @type {HSTRING} 
     */
    static UmAlQura {
        get => CalendarIdentifiers.get_UmAlQura()
    }

    /**
     * Gets the identifier for the Persian calendar.
     * @remarks
     * The Persian calendar is used in most countries where Persian is spoken, although some regions use different month names. The Persian calendar is the official calendar of Iran and Afghanistan, and it is one of the alternative calendars in regions such as Kazakhstan and Tajikistan.
     * 
     * Dates in the Persian calendar start from the year of the Hijra, which corresponds to 622 C.E. and is the year when Muhammad (PBUH) migrated from Mecca to Medina. For example, the date March 21, 2002 C.E. corresponds to the first day of the month of Farvardeen in the year 1381 Anno Persico.
     * 
     * The Persian calendar is based on a solar year and is approximately 365 days long. A year cycles through four seasons, and a new year begins when the sun appears to cross the equator from the southern hemisphere to the northern hemisphere as viewed from the center of the Earth. The new year marks the first day of the month of Farvardeen, which is the first day of spring in the northern hemisphere.
     * 
     * Each of the first six months in the Persian calendar has 31 days, each of the next five months has 30 days, and the last month has 29 days in a common year and 30 days in a leap year. A leap year is a year that, when divided by 33, has a remainder of 1, 5, 9, 13, 17, 22, 26, or 30. For example, the year 1370 is a leap year because dividing it by 33 yields a remainder of 17. There are approximately eight leap years in every 33-year cycle.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.persian
     * @type {HSTRING} 
     */
    static Persian {
        get => CalendarIdentifiers.get_Persian()
    }

    /**
     * Gets the identifier for the Chinese lunisolar calendar.
     * @remarks
     * <!--Should I/how much can I adapt from https://msdn.microsoft.com/library/system.globalization.chineselunisolarcalendar ?-->
     * This calendar supports the sexagenary year cycle (which repeats every 60 years) in addition to solar years and lunar months. Each solar year in the calendar is associated with a Sexagenary Year, a Celestial Stem, and a Terrestrial Branch, and these calendars can have leap months after any month of the year. The calendar calculates years based on solar calculations, and months and days based on lunar calculations.
     * 
     * A leap month can occur after any month in a year. For example, when you get a month from this calendar, you get a number between 1 and 13 that indicates the month associated with a specified date. If there is a leap month between the eighth and ninth months of the year, getting the month returns 8 for the eighth month, 9 for the leap eighth month, and 10 for the ninth month.
     * 
     * Currently, this calendar is not used by any of the supported cultures. Therefore, this value can be used only to calculate dates in the Chinese lunisolar calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.chineselunar
     * @type {HSTRING} 
     */
    static ChineseLunar {
        get => CalendarIdentifiers.get_ChineseLunar()
    }

    /**
     * This name is reserved for a future update. Do not access or use this property in your code, as accessing the property will result in errors or exceptions being thrown.
     * 
     * 
     * <!--Gets the identifier for the Japanese lunisolar calendar.-->
     * @remarks
     * <!--Use https://msdn.microsoft.com/library/system.globalization.japaneselunisolarcalendar.aspx ?-->
     * This name is reserved for a future update. Do not access or use this property in your code, as accessing the property will result in errors or exceptions being thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.japaneselunar
     * @type {HSTRING} 
     */
    static JapaneseLunar {
        get => CalendarIdentifiers.get_JapaneseLunar()
    }

    /**
     * This name is reserved for a future update. Do not access or use this property in your code, as accessing the property will result in errors or exceptions being thrown.
     * 
     * 
     * <!--Gets the identifier for the Korean lunisolar calendar.-->
     * @remarks
     * <!--Use https://msdn.microsoft.com/library/system.globalization.koreanlunisolarcalendar(v=vs.110).aspx ?-->
     * This name is reserved for a future update. Do not access or use this property in your code, as accessing the property will result in errors or exceptions being thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.koreanlunar
     * @type {HSTRING} 
     */
    static KoreanLunar {
        get => CalendarIdentifiers.get_KoreanLunar()
    }

    /**
     * This name is reserved for a future update. Do not access or use this property in your code, as accessing the property will result in errors or exceptions being thrown.
     * 
     * 
     * <!--Gets the identifier for the Taiwan lunisolar calendar.-->
     * @remarks
     * <!--Use https://msdn.microsoft.com/library/system.globalization.taiwanlunisolarcalendar(v=vs.110).aspx ?-->
     * This name is reserved for a future update. Do not access or use this property in your code, as accessing the property will result in errors or exceptions being thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.taiwanlunar
     * @type {HSTRING} 
     */
    static TaiwanLunar {
        get => CalendarIdentifiers.get_TaiwanLunar()
    }

    /**
     * This name is reserved for a future update. Do not access or use this property in your code, as accessing the property will result in errors or exceptions being thrown.
     * 
     * 
     * <!--Gets the identifier for the Vietnamese lunisolar calendar.-->
     * @remarks
     * <!--Unlike other new lunar calendars, this has not obvious parallel in the .NET docs...-->
     * This name is reserved for a future update. Do not access or use this property in your code, as accessing the property will result in errors or exceptions being thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.vietnameselunar
     * @type {HSTRING} 
     */
    static VietnameseLunar {
        get => CalendarIdentifiers.get_VietnameseLunar()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Gregorian() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_Gregorian()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Hebrew() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_Hebrew()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Hijri() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_Hijri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Japanese() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_Japanese()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Julian() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_Julian()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Korean() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_Korean()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Taiwan() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_Taiwan()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Thai() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_Thai()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_UmAlQura() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics := ICalendarIdentifiersStatics(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics.get_UmAlQura()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Persian() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics2.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics2 := ICalendarIdentifiersStatics2(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics2.get_Persian()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ChineseLunar() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics3.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics3 := ICalendarIdentifiersStatics3(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics3.get_ChineseLunar()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_JapaneseLunar() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics3.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics3 := ICalendarIdentifiersStatics3(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics3.get_JapaneseLunar()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KoreanLunar() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics3.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics3 := ICalendarIdentifiersStatics3(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics3.get_KoreanLunar()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TaiwanLunar() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics3.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics3 := ICalendarIdentifiersStatics3(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics3.get_TaiwanLunar()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VietnameseLunar() {
        if (!CalendarIdentifiers.HasProp("__ICalendarIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CalendarIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarIdentifiersStatics3.IID)
            CalendarIdentifiers.__ICalendarIdentifiersStatics3 := ICalendarIdentifiersStatics3(factoryPtr)
        }

        return CalendarIdentifiers.__ICalendarIdentifiersStatics3.get_VietnameseLunar()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
