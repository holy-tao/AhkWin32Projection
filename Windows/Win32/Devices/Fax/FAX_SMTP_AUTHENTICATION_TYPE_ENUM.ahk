#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_SMTP_AUTHENTICATION_TYPE_ENUM enumeration defines the configuration options for delivery receipts sent through email.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_smtp_authentication_type_enum
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_SMTP_AUTHENTICATION_TYPE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
