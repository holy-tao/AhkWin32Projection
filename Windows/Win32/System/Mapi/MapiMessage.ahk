#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MapiFileDesc.ahk" { MapiFileDesc }
#Import ".\MapiRecipDesc.ahk" { MapiRecipDesc }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A MapiMessage structure contains information about a message. For Unicode support, use the MapiMessageW structure.
 * @see https://learn.microsoft.com/windows/win32/api/mapi/ns-mapi-mapimessage
 * @namespace Windows.Win32.System.Mapi
 * @charset ANSI
 */
export default struct MapiMessage {
    #StructPack 8

    /**
     * Reserved; must be zero or <b>CP_UTF8</b>. If <b>CP_UTF8</b>, the following are UTF-8 instead of ANSI strings: <b>lpszSubject</b>, <b>lpszNoteText</b>, <b>lpszMessageType</b>, <b>lpszDateReceived</b>, <b>lpszConversationID</b>.
     */
    ulReserved : UInt32

    /**
     * Pointer to the text string describing the message subject, typically limited to 256 characters or less. If this member is empty or <b>NULL</b>, the user has not entered subject text.
     */
    lpszSubject : PSTR

    /**
     * Pointer to a string containing the message text. If this member is empty or <b>NULL</b>, there is no message text.
     */
    lpszNoteText : PSTR

    /**
     * Pointer to a string indicating a non-IPM type of message. Client applications can select message types for their non-IPM messages. Clients that only support IPM messages can ignore the <b>lpszMessageType</b> member when reading messages and set it to empty or <b>NULL</b> when sending messages.
     */
    lpszMessageType : PSTR

    /**
     * Pointer to a string indicating the date when the message was received. The format is YYYY/MM/DD HH:MM, using a 24-hour clock.
     */
    lpszDateReceived : PSTR

    /**
     * Pointer to a string identifying the conversation thread to which the message belongs. Some messaging systems can ignore and not return this member.
     */
    lpszConversationID : PSTR

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
     */
    flFlags : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdesc">MapiRecipDesc</a> structure containing information about the sender of the message.
     */
    lpOriginator : MapiRecipDesc.Ptr

    /**
     * The number of message recipient structures in the array pointed to by the <b>lpRecips</b> member. A value of zero indicates no recipients are included.
     */
    nRecipCount : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdesc">MapiRecipDesc</a> structures, each containing information about a message recipient.
     */
    lpRecips : MapiRecipDesc.Ptr

    /**
     * The number of structures describing file attachments in the array pointed to by the <b>lpFiles</b> member. A value of zero indicates no file attachments are included.
     */
    nFileCount : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiledesc">MapiFileDesc</a> structures, each containing information about a file attachment.
     */
    lpFiles : MapiFileDesc.Ptr

}
