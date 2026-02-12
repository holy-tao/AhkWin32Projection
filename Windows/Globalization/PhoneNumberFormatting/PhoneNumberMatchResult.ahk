#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The result of calling the [PhoneNumberInfo.CheckNumberMatch](phonenumberinfo_checknumbermatch_849235604.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumbermatchresult
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class PhoneNumberMatchResult extends Win32Enum{

    /**
     * The two numbers do not match.
     * @type {Integer (Int32)}
     */
    static NoMatch => 0

    /**
     * The short national significant part (the subscriber number) of the two numbers match.
     * @type {Integer (Int32)}
     */
    static ShortNationalSignificantNumberMatch => 1

    /**
     * The entire national significant part (area code and subscriber number) of the two numbers match.
     * @type {Integer (Int32)}
     */
    static NationalSignificantNumberMatch => 2

    /**
     * The two numbers are an exact match.
     * @type {Integer (Int32)}
     */
    static ExactMatch => 3
}
