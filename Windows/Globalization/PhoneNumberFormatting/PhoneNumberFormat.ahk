#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Lists phone number formats supported by this API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberformat
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class PhoneNumberFormat extends Win32Enum{

    /**
     * Format specified in International Telecommunication Union (ITU-T) recommendation E.164.
     * @type {Integer (Int32)}
     */
    static E164 => 0

    /**
     * International format as specified in ITU-T recommendation E.123.
     * @type {Integer (Int32)}
     */
    static International => 1

    /**
     * National format as specified in ITU-T recommendation E.123.
     * @type {Integer (Int32)}
     */
    static National => 2

    /**
     * Format specified in RFC 3966, the `tel:` URI for telephone numbers.
     * @type {Integer (Int32)}
     */
    static Rfc3966 => 3
}
