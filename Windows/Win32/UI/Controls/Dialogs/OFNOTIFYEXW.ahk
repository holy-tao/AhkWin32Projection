#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk

/**
 * Contains information about a CDN_INCLUDEITEM notification message. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The commdlg.h header defines OFNOTIFYEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-ofnotifyexw
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset Unicode
 */
class OFNOTIFYEXW extends Win32Struct
{
    static sizeof => 48

    static packingSize => 1

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <b>code</b> member of this structure identifies the notification message being sent.
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
     * A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure containing the values specified when the <b>Open</b> or <b>Save As</b> dialog box was created.
     * @type {Pointer<OPENFILENAMEW>}
     */
    lpOFN {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPVOID</b>
     * 
     * A pointer to the  interface for the folder or shell name-space extension whose items are being enumerated.
     * @type {Pointer<Void>}
     */
    psf {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPVOID</b>
     * 
     * A pointer to an item identifier list that identifies an item in the container identified by the <b>psf</b> member. The item identifier is relative to the <b>psf</b> container.
     * @type {Pointer<Void>}
     */
    pidl {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
