#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\OLEUIOBJECTPROPSA.ahk" { OLEUIOBJECTPROPSA }

/**
 * Initializes the General tab of the Object Properties dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUIGNRLPROPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuignrlpropsa
 * @namespace Windows.Win32.System.Ole
 * @charset ANSI
 */
export default struct OLEUIGNRLPROPSA {
    #StructPack 8

    /**
     * The size of the structure, in bytes. This field must be filled on input.
     */
    cbStruct : UInt32

    /**
     * Currently no flags associated with this member. It should be set to 0 (zero).
     */
    dwFlags : UInt32

    /**
     * This member is reserved.
     */
    dwReserved1 : UInt32[2]

    /**
     * Pointer to a hook function that processes messages intended for the dialog box. The hook function must return zero to pass a message that it didn't process back to the dialog box procedure in the library. The hook function must return a nonzero value to prevent the library's dialog box procedure from processing a message it has already processed.
     */
    lpfnHook : IntPtr

    /**
     * Application-defined data that the library passes to the hook function pointed to by the <b>lpfnHook</b> member during WM_INITDIALOG.
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
