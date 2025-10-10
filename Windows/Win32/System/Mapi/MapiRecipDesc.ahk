#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A MapiRecipDesc structure contains information about a message sender or recipient. For Unicode support, use the MapiRecipDescW structure.
 * @see https://docs.microsoft.com/windows/win32/api//mapi/ns-mapi-mapirecipdesc
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 * @charset ANSI
 */
class MapiRecipDesc extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains a numeric value that indicates the type of recipient. Possible values are as follow.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_ORIG"></a><a id="mapi_orig"></a><dl>
     * <dt><b>MAPI_ORIG</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the original sender of the message. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_TO"></a><a id="mapi_to"></a><dl>
     * <dt><b>MAPI_TO</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a primary message recipient. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_CC"></a><a id="mapi_cc"></a><dl>
     * <dt><b>MAPI_CC</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a recipient of a message copy. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_BCC"></a><a id="mapi_bcc"></a><dl>
     * <dt><b>MAPI_BCC</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a recipient of a blind copy. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ulRecipClass {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the display name of the message recipient or sender.
     * @type {Pointer<Byte>}
     */
    lpszName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional pointer to the recipient or sender's address; this address is provider-specific message delivery data. Generally, the messaging system provides such addresses for inbound messages. For outbound messages, the <b>lpszAddress</b> member can point to an address entered by the user for a recipient not in an address book (that is, a custom recipient).
     * 
     * The format of the address is <i>address type</i>:<i>email address</i>. Examples of valid addresses are FAX:206-555-1212 and SMTP:M@X.COM.
     * @type {Pointer<Byte>}
     */
    lpszAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The size, in bytes, of the entry identifier pointed to by the <b>lpEntryID</b> member.
     * @type {Integer}
     */
    ulEIDSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to an opaque entry identifier used by a messaging system service provider to identify the message recipient. Entry identifiers have meaning only for the service provider; client applications will not be able to decipher them. The messaging system uses this member to return valid entry identifiers for all recipients or senders listed in the address book.
     * @type {Pointer<Void>}
     */
    lpEntryID {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
