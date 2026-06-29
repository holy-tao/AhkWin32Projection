#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MapiFileDescW.ahk" { MapiFileDescW }
#Import ".\MapiRecipDescW.ahk" { MapiRecipDescW }

/**
 * A MapiMessageW structure contains information about a message.
 * @see https://learn.microsoft.com/windows/win32/api/mapi/ns-mapi-mapimessagew
 * @namespace Windows.Win32.System.Mapi
 * @charset Unicode
 */
export default struct MapiMessageW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * Reserved; must be zero.
     */
    ulReserved : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to the text string describing the message subject, typically limited to 256 characters or less.
     * 
     * If this member is empty or <b>NULL</b>, there is no subject text.
     */
    lpszSubject : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string containing the message text.
     * 
     * If this member is empty or <b>NULL</b>, there is no message text.
     */
    lpszNoteText : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string that indicates the message type of when the message is not an IPM.
     * 
     * If your Client supports Interpersonal Messages (IPMs) exclusively, set the <b>lpszMessageType</b> member to empty or <b>NULL</b> when sending messages and ignore the member when reading messages.
     */
    lpszMessageType : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string indicating the date when the message was received. The format is <i>YYYY</i>/<i>MM</i>/<i>DD</i><i>HH</i>:<i>MM</i>, using a 24-hour clock.
     */
    lpszDateReceived : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string identifying the conversation thread to which the message belongs. Some messaging systems ignore this member.
     */
    lpszConversationID : PWSTR

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
     */
    flFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">lpMapiRecipDescW</a></b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">MapiRecipDescW</a> structure containing information about the sender of the message.
     */
    lpOriginator : MapiRecipDescW.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The number of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">MapiRecipDescW</a> structures in the array pointed to by the <b>lpRecips</b> member.
     * 
     * If this member is zero, there are no recipients.
     */
    nRecipCount : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">lpMapiRecipDescW</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapirecipdescw">MapiRecipDescW</a> structures. Each structure contains information about one recipient.
     */
    lpRecips : MapiRecipDescW.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The number of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiledescw">MapiFileDescW</a> structures in the array pointed to by the <b>lpFiles</b> member.
     * 
     * If this member is zero, there are no file attachments.
     */
    nFileCount : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiledescw">lpMapiFileDescW</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiledescw">MapiFileDescW</a> structures. Each structure contains information about one file attachment.
     */
    lpFiles : MapiFileDescW.Ptr

}
