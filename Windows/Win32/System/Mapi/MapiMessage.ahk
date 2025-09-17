#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A MapiMessage structure contains information about a message. For Unicode support, use the MapiMessageW structure.
 * @see https://learn.microsoft.com/windows/win32/api/mapi/ns-mapi-mapimessage
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 * @charset ANSI
 */
class MapiMessage extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Reserved; must be zero or <b>CP_UTF8</b>. If <b>CP_UTF8</b>, the following are UTF-8 instead of ANSI strings: <b>lpszSubject</b>, <b>lpszNoteText</b>, <b>lpszMessageType</b>, <b>lpszDateReceived</b>, <b>lpszConversationID</b>.
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the text string describing the message subject, typically limited to 256 characters or less. If this member is empty or <b>NULL</b>, the user has not entered subject text.
     * @type {Pointer<Byte>}
     */
    lpszSubject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string containing the message text. If this member is empty or <b>NULL</b>, there is no message text.
     * @type {Pointer<Byte>}
     */
    lpszNoteText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a string indicating a non-IPM type of message. Client applications can select message types for their non-IPM messages. Clients that only support IPM messages can ignore the <b>lpszMessageType</b> member when reading messages and set it to empty or <b>NULL</b> when sending messages.
     * @type {Pointer<Byte>}
     */
    lpszMessageType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a string indicating the date when the message was received. The format is YYYY/MM/DD HH:MM, using a 24-hour clock.
     * @type {Pointer<Byte>}
     */
    lpszDateReceived {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a string identifying the conversation thread to which the message belongs. Some messaging systems can ignore and not return this member.
     * @type {Pointer<Byte>}
     */
    lpszConversationID {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Bitmask of message status flags. The following flags can be set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_RECEIPT_REQUESTED"></a><a id="mapi_receipt_requested"></a><dl>
     * <dt><b>MAPI_RECEIPT_REQUESTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A receipt notification is requested. Client applications set this flag when sending a message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_SENT"></a><a id="mapi_sent"></a><dl>
     * <dt><b>MAPI_SENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message has been sent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_UNREAD"></a><a id="mapi_unread"></a><dl>
     * <dt><b>MAPI_UNREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message has not been read.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdesc">MapiRecipDesc</a> structure containing information about the sender of the message.
     * @type {Pointer<MapiRecipDesc>}
     */
    lpOriginator {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The number of message recipient structures in the array pointed to by the <b>lpRecips</b> member. A value of zero indicates no recipients are included.
     * @type {Integer}
     */
    nRecipCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdesc">MapiRecipDesc</a> structures, each containing information about a message recipient.
     * @type {Pointer<MapiRecipDesc>}
     */
    lpRecips {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The number of structures describing file attachments in the array pointed to by the <b>lpFiles</b> member. A value of zero indicates no file attachments are included.
     * @type {Integer}
     */
    nFileCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiledesc">MapiFileDesc</a> structures, each containing information about a file attachment.
     * @type {Pointer<MapiFileDesc>}
     */
    lpFiles {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
