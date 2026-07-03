#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\OLEUIOBJECTPROPSA.ahk" { OLEUIOBJECTPROPSA }

/**
 * Contains information that is used to initialize the Link tab of the Object Properties dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUILINKPROPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuilinkpropsa
 * @namespace Windows.Win32.System.Ole
 * @charset ANSI
 */
export default struct OLEUILINKPROPSA {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cbStruct : UInt32

    /**
     * Contains in/out flags specific to the <b>Links</b> page.
     */
    dwFlags : UInt32

    /**
     * This member is reserved.
     */
    dwReserved1 : UInt32[2]

    /**
     * Pointer to the hook callback (not used in this dialog box).
     */
    lpfnHook : IntPtr

    /**
     * Custom data to pass to hook (not used in this dialog box).
     */
    lCustData : LPARAM

    /**
     * This member is reserved.
     */
    dwReserved2 : UInt32[3]

    __lpOP_ptr : IntPtr
    /**
     * Used internally.
     */
    lpOP {
        get => (addr := this.__lpOP_ptr) ? OLEUIOBJECTPROPSA.At(addr) : unset
        set => this.__lpOP_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
