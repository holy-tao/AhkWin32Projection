#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\NMHDR.ahk

/**
 * Contains information about a WM_NOTIFY message sent to an OFNHookProc hook procedure for an Open or Save As dialog box. The lParam parameter of the WM_NOTIFY message is a pointer to an OFNOTIFY structure. (Unicode)
 * @remarks
 * Not all of the <b>Open</b> and <b>Save As</b> notification messages use the <b>OFNOTIFY</b> structure. The <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-includeitem">CDN_INCLUDEITEM</a> notification message uses the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-ofnotifyexa">OFNOTIFYEX</a> structure. 
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The commdlg.h header defines OFNOTIFY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-ofnotifyw
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset Unicode
 */
class OFNOTIFYW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <b>code</b> member of this structure can be one of the following notification messages that identify the message being sent: <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-fileok">CDN_FILEOK</a>, <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-folderchange">CDN_FOLDERCHANGE</a>, <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-help">CDN_HELP</a>, <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-initdone">CDN_INITDONE</a>, <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-selchange">CDN_SELCHANGE</a>, <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-shareviolation">CDN_SHAREVIOLATION</a>, <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-typechange">CDN_TYPECHANGE</a>.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b>LPOPENFILENAME</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure that was specified when the <b>Open</b> or <b>Save As</b> dialog box was created. For some of the notification messages, this structure contains additional information about the event that caused the notification.
     * @type {Pointer<OPENFILENAMEW>}
     */
    lpOFN {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * The file name for which a network sharing violation has occurred. This member is valid only with the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-shareviolation">CDN_SHAREVIOLATION</a> notification message.
     * @type {Pointer<Char>}
     */
    pszFile {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
