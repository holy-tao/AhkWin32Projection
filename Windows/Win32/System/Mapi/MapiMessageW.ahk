#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A MapiMessageW structure contains information about a message.
 * @see https://learn.microsoft.com/windows/win32/api/mapi/ns-mapi-mapimessagew
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 * @charset Unicode
 */
class MapiMessageW extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * Reserved; must be zero.
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to the text string describing the message subject, typically limited to 256 characters or less.
     * 
     * If this member is empty or <b>NULL</b>, there is no subject text.
     * @type {Pointer<Char>}
     */
    lpszSubject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string containing the message text.
     * 
     * If this member is empty or <b>NULL</b>, there is no message text.
     * @type {Pointer<Char>}
     */
    lpszNoteText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string that indicates the message type of when the message is not an IPM.
     * 
     * If your Client supports Interpersonal Messages (IPMs) exclusively, set the <b>lpszMessageType</b> member to empty or <b>NULL</b> when sending messages and ignore the member when reading messages.
     * @type {Pointer<Char>}
     */
    lpszMessageType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string indicating the date when the message was received. The format is <i>YYYY</i>/<i>MM</i>/<i>DD</i><i>HH</i>:<i>MM</i>, using a 24-hour clock.
     * @type {Pointer<Char>}
     */
    lpszDateReceived {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string identifying the conversation thread to which the message belongs. Some messaging systems ignore this member.
     * @type {Pointer<Char>}
     */
    lpszConversationID {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>FLAGS</b>
     * 
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
     * <dt>0x00000002</dt>
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
     * <dt>0x00000004</dt>
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
     * <dt>0x00000001</dt>
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
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">lpMapiRecipDescW</a></b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">MapiRecipDescW</a> structure containing information about the sender of the message.
     * @type {Pointer<MapiRecipDescW>}
     */
    lpOriginator {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The number of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">MapiRecipDescW</a> structures in the array pointed to by the <b>lpRecips</b> member.
     * 
     * If this member is zero, there are no recipients.
     * @type {Integer}
     */
    nRecipCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">lpMapiRecipDescW</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">MapiRecipDescW</a> structures. Each structure contains information about one recipient.
     * @type {Pointer<MapiRecipDescW>}
     */
    lpRecips {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The number of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiledescw">MapiFileDescW</a> structures in the array pointed to by the <b>lpFiles</b> member.
     * 
     * If this member is zero, there are no file attachments.
     * @type {Integer}
     */
    nFileCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiledescw">lpMapiFileDescW</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiledescw">MapiFileDescW</a> structures. Each structure contains information about one file attachment.
     * @type {Pointer<MapiFileDescW>}
     */
    lpFiles {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
