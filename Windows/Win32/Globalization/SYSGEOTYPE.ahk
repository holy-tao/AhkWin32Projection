#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of geographical location information requested in the GetGeoInfo or GetGeoInfoEx function.
 * @see https://learn.microsoft.com/windows/win32/api/winnls/ne-winnls-sysgeotype
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SYSGEOTYPE extends Win32Enum{

    /**
     * The geographical location identifier (GEOID) of a nation. This value is stored in a long integer.
     * 
     * <b>Starting with Windows 10, version 1709:</b> This value is not supported for the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getgeoinfoex">GetGeoInfoEx</a> function, and should not be used.
     * @type {Integer (Int32)}
     */
    static GEO_NATION => 1

    /**
     * The latitude of the location. This value is stored in a floating-point number.
     * @type {Integer (Int32)}
     */
    static GEO_LATITUDE => 2

    /**
     * The longitude of the location. This value is stored in a floating-point number.
     * @type {Integer (Int32)}
     */
    static GEO_LONGITUDE => 3

    /**
     * The ISO 2-letter country/region code. This value is stored in a string.
     * @type {Integer (Int32)}
     */
    static GEO_ISO2 => 4

    /**
     * The ISO 3-letter country/region code. This value is stored in a string.
     * @type {Integer (Int32)}
     */
    static GEO_ISO3 => 5

    /**
     * The name for a string, compliant with RFC 4646 (starting with Windows Vista), that is derived from the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getgeoinfoa">GetGeoInfo</a> parameters <i>language</i> and <i>GeoId</i>.
     * 
     * <b>Starting with Windows 10, version 1709:</b> This value is not supported for the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getgeoinfoex">GetGeoInfoEx</a> function, and should not be used.
     * @type {Integer (Int32)}
     */
    static GEO_RFC1766 => 6

    /**
     * A locale identifier derived using <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getgeoinfoa">GetGeoInfo</a>.
     * 
     * <b>Starting with Windows 10, version 1709:</b> This value is not supported for the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getgeoinfoex">GetGeoInfoEx</a> function, and should not be used.
     * @type {Integer (Int32)}
     */
    static GEO_LCID => 7

    /**
     * The friendly name of the nation, for example, Germany. This value is stored in a string.
     * @type {Integer (Int32)}
     */
    static GEO_FRIENDLYNAME => 8

    /**
     * The official name of the nation, for example, Federal Republic of Germany. This value is stored in a string.
     * @type {Integer (Int32)}
     */
    static GEO_OFFICIALNAME => 9

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static GEO_TIMEZONES => 10

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static GEO_OFFICIALLANGUAGES => 11

    /**
     * <b>Starting with Windows 8:</b> The ISO 3-digit country/region code. This value is stored in a string.
     * @type {Integer (Int32)}
     */
    static GEO_ISO_UN_NUMBER => 12

    /**
     * <b>Starting with Windows 8:</b> The geographical location identifier of the parent region of a country/region. This value is stored in a string.
     * @type {Integer (Int32)}
     */
    static GEO_PARENT => 13

    /**
     * <b>Starting with Windows 10, version 1709:</b> The dialing code to use with telephone numbers in the geographic location.  For example, 1 for the United States.
     * @type {Integer (Int32)}
     */
    static GEO_DIALINGCODE => 14

    /**
     * <b>Starting with Windows 10, version 1709:</b> The three-letter code for the currency that the geographic location uses.  For example, USD for United States dollars.
     * @type {Integer (Int32)}
     */
    static GEO_CURRENCYCODE => 15

    /**
     * <b>Starting with Windows 10, version 1709:</b> The symbol for the currency that the geographic location uses.  For example, the dollar sign ($).
     * @type {Integer (Int32)}
     */
    static GEO_CURRENCYSYMBOL => 16

    /**
     * <b>Starting with Windows 10, version 1709:</b> The two-letter International Organization for Standardization (ISO) 3166-1 code or numeric United Nations (UN) Series M, Number 49  (M.49) code for the geographic region.
     * 
     * For information about two-letter ISO 3166-1 codes, see <a href="https://www.iso.org/iso-3166-country-codes.html">Country Codes - ISO 3166</a>.  For information about numeric UN M.49 codes, see <a href="https://unstats.un.org/unsd/methodology/m49/">Standard country or area codes for statistical use (M49)</a>.
     * @type {Integer (Int32)}
     */
    static GEO_NAME => 17

    /**
     * <b>Starting with Windows 10, version 1709:</b> The Windows geographical location identifiers (GEOID) for the region. This value is provided for backward compatibility.  Do not use this value in new applications, but use <b>GEO_NAME</b> instead.
     * @type {Integer (Int32)}
     */
    static GEO_ID => 18
}
