#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\DVTARGETDEVICE.ahk" { DVTARGETDEVICE }
#Import "..\Com\FORMATETC.ahk" { FORMATETC }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * An array of entries to be specified in the OLEUIPASTESPECIAL structure for the Paste Special dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUIPASTEENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuipasteentrya
 * @namespace Windows.Win32.System.Ole
 * @charset ANSI
 */
export default struct OLEUIPASTEENTRYA {
    #StructPack 8

    /**
     * Format that is acceptable. The <b>Paste Special</b> dialog box checks if this format is offered by the object on the clipboard and if so, offers it for selection to the user.
     */
    fmtetc : FORMATETC

    /**
     * Pointer to the string that represents the format to the user. Any %s in this string is replaced by the FullUserTypeName of the object on the clipboard and the resulting string is placed in the list box of the dialog box. Only one %s is allowed. The presence or absence of %s specifies whether the result-text is to indicate that data is being pasted or that an object that can be activated by an application is being pasted. If %s is present, the resulting text says that an object is being pasted. Otherwise, it says that data is being pasted.
     */
    lpstrFormatName : PSTR

    /**
     * Pointer to the string used to customize the resulting text of the dialog box when the user selects the format corresponding to this entry. Any %s in this string is replaced by the application name or FullUserTypeName of the object on the clipboard. Only one %s is allowed.
     */
    lpstrResultText : PSTR

    /**
     * Values from <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/ne-oledlg-oleuipasteflag">OLEUIPASTEFLAG</a> enumeration.
     */
    dwFlags : UInt32

    /**
     * Scratch space available to routines that loop through an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> to mark if the PasteEntry format is available. This field can be left uninitialized.
     */
    dwScratchSpace : UInt32

}
