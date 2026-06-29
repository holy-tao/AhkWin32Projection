#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import ".\OPENFILENAMEA.ahk" { OPENFILENAMEA }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information about a CDN_INCLUDEITEM notification message. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commdlg.h header defines OFNOTIFYEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-ofnotifyexa
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct OFNOTIFYEXA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <b>code</b> member of this structure identifies the notification message being sent.
     */
    hdr : NMHDR

    /**
     * Type: <b>LPOPENFILENAME</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure containing the values specified when the <b>Open</b> or <b>Save As</b> dialog box was created.
     */
    lpOFN : OPENFILENAMEA.Ptr

    /**
     * Type: <b>LPVOID</b>
     * 
     * A pointer to the  interface for the folder or shell name-space extension whose items are being enumerated.
     */
    psf : IntPtr

    /**
     * Type: <b>LPVOID</b>
     * 
     * A pointer to an item identifier list that identifies an item in the container identified by the <b>psf</b> member. The item identifier is relative to the <b>psf</b> container.
     */
    pidl : IntPtr

}
