#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information passed to a WH_CBT hook procedure, CBTProc, before a window is created. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The winuser.h header defines CBT_CREATEWND as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cbt_createwndw
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset Unicode
 */
class CBT_CREATEWNDW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>LPCREATESTRUCT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-createstructa">CREATESTRUCT</a> structure that contains initialization parameters for the window about to be created.
     * @type {Pointer<CREATESTRUCTW>}
     */
    lpcs {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window whose position in the Z order precedes that of the window being created. This member can also be <b>NULL</b>.
     * @type {Pointer<HWND>}
     */
    hwndInsertAfter {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
