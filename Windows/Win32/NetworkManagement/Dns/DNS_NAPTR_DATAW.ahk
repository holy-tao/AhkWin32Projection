#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_NAPTR_DATA structure represents a Naming Authority Pointer (NAPTR) DNS Resource Record (RR) as specified in RFC 2915. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The windns.h header defines DNS_NAPTR_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_naptr_dataw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset Unicode
 */
class DNS_NAPTR_DATAW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A value that determines the NAPTR RR processing order as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     * @type {Integer}
     */
    wOrder {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A value that determines the NAPTR RR processing  order  for records with the same <b>wOrder</b> value as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     * @type {Integer}
     */
    wPreference {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A pointer to a string  that represents a set of NAPTR RR flags which determine the interpretation and processing of NAPTR record fields as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     * @type {PWSTR}
     */
    pFlags {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a string that represents the available services in this rewrite path as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     * @type {PWSTR}
     */
    pService {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a string that represents a substitution expression as defined in sections 2 and 3 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     * @type {PWSTR}
     */
    pRegularExpression {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a string that represents the next NAPTR query name as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     * @type {PWSTR}
     */
    pReplacement {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
