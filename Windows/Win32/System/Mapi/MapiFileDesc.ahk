#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A MapiFileDesc structure contains information about a file containing a message attachment stored as a temporary file.
 * @remarks
 * 
  * Simple MAPI works with three kinds of embedded attachments:  
  * 
  * <ul>
  * <li>
  * Data file attachments
  * 
  * </li>
  * <li>
  * Editable OLE object file attachments
  * 
  * </li>
  * <li>
  * Static OLE object file attachments
  * 
  * </li>
  * </ul>
  * Data file attachments are simply data files. OLE object file attachments are OLE objects that are displayed in the message text. If the OLE attachment is editable, the recipient can double-click it and its source application will be started to handle the edit session. If the OLE attachment is static, the object cannot be edited. The flag set in the <b>flFlags</b> member of the <b>MapiFileDesc</b> structure determines the kind of a particular attachment. Embedded messages can be identified by a .MSG extension in the <b>lpszFileName</b> member.
  * 
  * OLE object files are file representations of OLE object streams. The client application can re-create an OLE object from the file by calling the OLE function <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-oleloadfromstream">OleLoadFromStream</a> with an OLESTREAM object that reads the file contents. If an OLE file attachment is included in an outbound message, the OLE object stream should be written directly to the file used as the attachment. 
  * 
  * When using the <b>MapiFileDesc</b> member <b>nPosition</b>, the client application should not place two attachments in the same location. Client applications might not display file attachments at positions beyond the end of the message text.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mapi/ns-mapi-mapifiledesc
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 * @charset ANSI
 */
class MapiFileDesc extends Win32Struct
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
     * Bitmask of option flags. The following flags can be set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_OLE"></a><a id="mapi_ole"></a><dl>
     * <dt><b>MAPI_OLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attachment is an OLE object. If MAPI_OLE_STATIC is also set, the attachment is a static OLE object. If MAPI_OLE_STATIC is not set, the attachment is an embedded OLE object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAPI_OLE_STATIC"></a><a id="mapi_ole_static"></a><dl>
     * <dt><b>MAPI_OLE_STATIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attachment is a static OLE object.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If neither flag is set, the attachment is treated as a data file.
     * @type {Integer}
     */
    flFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An integer used to indicate where in the message text to render the attachment. Attachments replace the character found at a certain position in the message text. That is, attachments replace the character in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapimessage">MapiMessage</a> structure field <b>NoteText</b>[<b>nPosition</b>]. A value of   -1 (0xFFFFFFFF) means the attachment position is not indicated; the client application will have to provide a way for the user to access the attachment.
     * @type {Integer}
     */
    nPosition {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to the fully qualified path of the attached file. This path should include the disk drive letter and directory name.
     * @type {Pointer<Byte>}
     */
    lpszPathName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the attachment filename seen by the recipient, which may differ from the filename in the <b>lpszPathName</b> member if temporary files are being used. If the <b>lpszFileName</b> member is empty or <b>NULL</b>, the filename from <b>lpszPathName</b> is used.
     * @type {Pointer<Byte>}
     */
    lpszFileName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the attachment file type, which can be represented with a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mapi/ns-mapi-mapifiletagext">MapiFileTagExt</a> structure. A value of <b>NULL</b> indicates an unknown file type or a file type determined by the operating system.
     * @type {Pointer<Void>}
     */
    lpFileType {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
