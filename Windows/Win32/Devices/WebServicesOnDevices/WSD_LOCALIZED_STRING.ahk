#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a single localized string.
 * @remarks
 * <a href="https://www.ietf.org/rfc/rfc1766.txt">RFC 1766</a> extends <a href="https://www.unicode.org/onlinedat/languages.html">ISO-639</a>. Dialect extensions to the <a href="https://www.unicode.org/onlinedat/languages.html">ISO-639</a> codes are used for the <i>lang</i> member. For example, "en-US" is used to indicate a string localized for the USA/English dialect.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_localized_string
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_LOCALIZED_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The standard language code used for localization. Valid language codes are specified in <a href="https://www.ietf.org/rfc/rfc1766.txt">RFC 1766</a>.
     * @type {Pointer<Ptr>}
     */
    lang {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The string data in the localized language.
     * @type {Pointer<Ptr>}
     */
    String {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
