#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FAX_SMTP_AUTHENTICATION_TYPE_ENUM enumeration defines the configuration options for delivery receipts sent through email.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_smtp_authentication_type_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_SMTP_AUTHENTICATION_TYPE_ENUM extends Win32Enum{

    /**
     * The server sends fax transmission receipts using a nonauthenticated SMTP protocol.
     * @type {Integer (Int32)}
     */
    static fsatANONYMOUS => 0

    /**
     * The server sends fax transmission receipts using a basic (plain text) authenticated SMTP protocol.
     * @type {Integer (Int32)}
     */
    static fsatBASIC => 1

    /**
     * The server sends fax transmission receipts using an NTLM-authenticated SMTP protocol.
     * @type {Integer (Int32)}
     */
    static fsatNTLM => 2
}
