#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * These values are returned by IInterval::GetLimits as pairs to specify a range with an upper and lower limit.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-interval_limit_kind
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class INTERVAL_LIMIT_KIND extends Win32Enum{

    /**
     * The value is included in the range. For example, an integer range of numbers that is equal to or greater than 3 and less than or equal to 6 includes both 3 and 6. So the values 3 and 6 would both be returned with <b>ILK_EXPLICIT_INCLUDED</b>.
     * @type {Integer (Int32)}
     */
    static ILK_EXPLICIT_INCLUDED => 0

    /**
     * The value bounds the range but is not included in the range. For example, an integer range that is greater than 3 but less than 6 excludes both 3 and 6. So the values would both be returned with <b>ILK_EXPLICIT_EXCLUDED</b>.
     * @type {Integer (Int32)}
     */
    static ILK_EXPLICIT_EXCLUDED => 1

    /**
     * This is typically used as a lower bound. The specified value is ignored because the range begins (or ends) at negative infinity. For example, an integer range that includes every value less than 6 would have <b>ILK_NEGATIVE_INFINITY</b> for the lower bound and 6 and <b>ILK_EXPLICIT_EXCLUDED</b> for the upper bound.
     * @type {Integer (Int32)}
     */
    static ILK_NEGATIVE_INFINITY => 2

    /**
     * This is typically used as an upper bound. The specified value is ignored because the range begins (or ends) at positive infinity. For example, an integer range that includes every value greater than or equal to 3 would have <b>ILK_EXPLICIT_INCLUDED</b> and 3 for the lower bound and <b>ILK_POSITIVE_INFINITY</b> for the upper bound.
     * @type {Integer (Int32)}
     */
    static ILK_POSITIVE_INFINITY => 3
}
