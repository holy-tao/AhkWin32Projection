#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent attribute names as defined by the [Internet Printing Protocol (IPP) specification](https://tools.ietf.org/html/rfc8011).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevaluekind
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppAttributeValueKind extends Win32Enum{

    /**
     * Represents the `unsupported` attribute value.
     * @type {Integer (Int32)}
     */
    static Unsupported => 0

    /**
     * Represents the `unknown` attribute value.
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Represents the `no-value` attribute value.
     * @type {Integer (Int32)}
     */
    static NoValue => 2

    /**
     * Represents the `integer` attribute value.
     * @type {Integer (Int32)}
     */
    static Integer => 3

    /**
     * Represents the `boolean` attribute value.
     * @type {Integer (Int32)}
     */
    static Boolean => 4

    /**
     * Represents the `enum` attribute value.
     * @type {Integer (Int32)}
     */
    static Enum => 5

    /**
     * Represents the `octetString` attribute value.
     * @type {Integer (Int32)}
     */
    static OctetString => 6

    /**
     * Represents the `dateTime` attribute value.
     * @type {Integer (Int32)}
     */
    static DateTime => 7

    /**
     * Represents the `resolution` attribute value.
     * @type {Integer (Int32)}
     */
    static Resolution => 8

    /**
     * Represents the `rangeOfInteger` attribute value.
     * @type {Integer (Int32)}
     */
    static RangeOfInteger => 9

    /**
     * Represents the `collection` attribute value.
     * @type {Integer (Int32)}
     */
    static Collection => 10

    /**
     * Represents the `textWithLanguage` attribute value.
     * @type {Integer (Int32)}
     */
    static TextWithLanguage => 11

    /**
     * Represents the `nameWithLanguage` attribute value.
     * @type {Integer (Int32)}
     */
    static NameWithLanguage => 12

    /**
     * Represents the `textWithoutLanguage` attribute value.
     * @type {Integer (Int32)}
     */
    static TextWithoutLanguage => 13

    /**
     * Represents the `nameWithoutLanguage` attribute value.
     * @type {Integer (Int32)}
     */
    static NameWithoutLanguage => 14

    /**
     * Represents the `keyword` attribute value.
     * @type {Integer (Int32)}
     */
    static Keyword => 15

    /**
     * Represents the `uri` attribute value.
     * @type {Integer (Int32)}
     */
    static Uri => 16

    /**
     * Represents the `uriScheme` attribute value.
     * @type {Integer (Int32)}
     */
    static UriSchema => 17

    /**
     * Represents the `charset` attribute value.
     * @type {Integer (Int32)}
     */
    static Charset => 18

    /**
     * Represents the `naturalLanguage` attribute value.
     * @type {Integer (Int32)}
     */
    static NaturalLanguage => 19

    /**
     * Represents the `mimeMediaType` attribute value.
     * @type {Integer (Int32)}
     */
    static MimeMediaType => 20
}
