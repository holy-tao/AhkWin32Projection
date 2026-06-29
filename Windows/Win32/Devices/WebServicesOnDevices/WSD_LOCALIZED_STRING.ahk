#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents a single localized string.
 * @remarks
 * <a href="https://www.ietf.org/rfc/rfc1766.txt">RFC 1766</a> extends <a href="https://www.unicode.org/onlinedat/languages.html">ISO-639</a>. Dialect extensions to the <a href="https://www.unicode.org/onlinedat/languages.html">ISO-639</a> codes are used for the <i>lang</i> member. For example, "en-US" is used to indicate a string localized for the USA/English dialect.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_localized_string
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_LOCALIZED_STRING {
    #StructPack 8

    /**
     * The standard language code used for localization. Valid language codes are specified in <a href="https://www.ietf.org/rfc/rfc1766.txt">RFC 1766</a>.
     */
    lang : PWSTR

    /**
     * The string data in the localized language.
     */
    String : PWSTR

}
