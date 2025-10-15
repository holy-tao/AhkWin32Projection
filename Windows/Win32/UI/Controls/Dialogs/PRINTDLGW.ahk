#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\HGLOBAL.ahk
#Include ..\..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\..\Foundation\HINSTANCE.ahk
#Include ..\..\..\Foundation\LPARAM.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Contains information that the PrintDlg function uses to initialize the Print Dialog Box. After the user closes the dialog box, the system uses this structure to return information about the user's selections.
 * @remarks
 * 
  * If both 
  * 				<b>hDevMode</b> and <b>hDevNames</b> are <b>NULL</b>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> initializes the dialog box using the current default printer. To initialize the dialog box for a different printer, use the <b>wDeviceOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure to specify the name of the printer. 
  * 
  * Note that the <b>dmDeviceName</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>  structure also specifies a printer name. However, <b>dmDeviceName</b> is limited to 32 characters, and the <b>wDeviceOffset</b> name is not. If the <b>wDeviceOffset</b> and <b>dmDeviceName</b> names are not the same, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> initializes the dialog box using the printer specified by <b>wDeviceOffset</b>. 
  * 
  * If the <b>PD_RETURNDEFAULT</b> flag is set and both <b>hDevMode</b> and <b>hDevNames</b> are <b>NULL</b>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> uses the <b>hDevNames</b> and <b>hDevMode</b> members to return information about the current default printer without displaying the dialog box.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The commdlg.h header defines PRINTDLG as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/ns-commdlg-printdlgw
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset Unicode
 */
class PRINTDLGW extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The structure size, in bytes.
     * @type {Integer}
     */
    lStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that owns the dialog box. This member can be any valid window handle, or it can be <b>NULL</b> if the dialog box has no owner.
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(this.ptr + 8)
            return this.__hwndOwner
        }
    }

    /**
     * Type: <b>HGLOBAL</b>
     * 
     * A handle to a movable global memory object that contains a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. If <b>hDevMode</b> is not <b>NULL</b> on input, you must allocate a movable block of memory for the <b>DEVMODE</b> structure and initialize its members. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function uses the input data to initialize the controls in the dialog box. When <b>PrintDlg</b> returns, the <b>DEVMODE</b> members indicate the user's input. 
     * 
     * If <b>hDevMode</b> is <b>NULL</b> on input, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> allocates memory for the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure, initializes its members to indicate the user's input, and returns a handle that identifies it.
     * 
     * If the device driver for the specified printer does not support extended device modes, <b>hDevMode</b> is <b>NULL</b> when <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> returns.
     * 
     * If the device name (specified by the <b>dmDeviceName</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure) does not appear in the [devices] section of WIN.INI, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> returns an error. 
     * 
     * For more information about the <b>hDevMode</b> and <b>hDevNames</b> members, see the Remarks section at the end of this topic.
     * @type {HGLOBAL}
     */
    hDevMode{
        get {
            if(!this.HasProp("__hDevMode"))
                this.__hDevMode := HGLOBAL(this.ptr + 16)
            return this.__hDevMode
        }
    }

    /**
     * Type: <b>HGLOBAL</b>
     * 
     * A handle to a movable global memory object that contains a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure. If <b>hDevNames</b> is not <b>NULL</b> on input, you must allocate a movable block of memory for the <b>DEVNAMES</b> structure and initialize its members. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function uses the input data to initialize the controls in the dialog box. When <b>PrintDlg</b> returns, the <b>DEVNAMES</b> members contain information for the printer chosen by the user. You can use this information to create a device context or an information context. 
     * 
     * The <b>hDevNames</b> member can be <b>NULL</b>, in which case, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> allocates memory for the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure, initializes its members to indicate the user's input, and returns a handle that identifies it. 
     * 
     * For more information about the <b>hDevMode</b> and <b>hDevNames</b> members, see the Remarks section at the end of this topic.
     * @type {HGLOBAL}
     */
    hDevNames{
        get {
            if(!this.HasProp("__hDevNames"))
                this.__hDevNames := HGLOBAL(this.ptr + 24)
            return this.__hDevNames
        }
    }

    /**
     * Type: <b>HDC</b>
     * 
     * A handle to a device context or an information context, depending on whether the <b>Flags</b> member specifies the <b>PD_RETURNDC</b> or <b>PC_RETURNIC</b> flag. If neither flag is specified, the value of this member is undefined. If both flags are specified, <b>PD_RETURNDC</b> has priority.
     * @type {HDC}
     */
    hDC{
        get {
            if(!this.HasProp("__hDC"))
                this.__hDC := HDC(this.ptr + 32)
            return this.__hDC
        }
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The initial value for the starting page edit control. 
     * 
     * When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> returns, <b>nFromPage</b> is the starting page specified by the user. If the <b>Pages</b> radio button is selected when the user clicks the <b>Okay</b> button, <b>PrintDlg</b> sets the <b>PD_PAGENUMS</b> flag and does not return until the user enters a starting page value that is within the minimum to maximum page range. 
     * 
     *  If the input value for either <b>nFromPage</b> or <b>nToPage</b> is outside the minimum/maximum range, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> returns an error only if the <b>PD_PAGENUMS</b> flag is specified; otherwise, it displays the dialog box but changes the out-of-range value to the minimum or maximum value.
     * @type {Integer}
     */
    nFromPage {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The initial value for the ending page edit control. When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> returns, <b>nToPage</b> is the ending page specified by the user. If the <b>Pages</b> radio button is selected when the use clicks the <b>Okay</b> button, <b>PrintDlg</b> sets the <b>PD_PAGENUMS</b> flag and does not return until the user enters an ending page value that is within the minimum to maximum page range.
     * @type {Integer}
     */
    nToPage {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The minimum value for the page range specified in the <b>From</b> and <b>To</b> page edit controls. If <b>nMinPage</b> equals <b>nMaxPage</b>, the <b>Pages</b> radio button and the starting and ending page edit controls are disabled.
     * @type {Integer}
     */
    nMinPage {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The maximum value for the page range specified in the <b>From</b> and <b>To</b> page edit controls.
     * @type {Integer}
     */
    nMaxPage {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The initial number of copies for the	<b>Copies</b> edit control if <b>hDevMode</b> is <b>NULL</b>; otherwise, the	<b>dmCopies</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure contains the initial value. When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> returns, <b>nCopies</b> contains the actual number of copies to print. This value depends on whether the application or the printer driver is responsible for printing multiple copies. If the <b>PD_USEDEVMODECOPIESANDCOLLATE</b> flag is set in the <b>Flags</b> member, <b>nCopies</b> is always 1 on return, and the printer driver is responsible for printing multiple copies. If the flag is not set, the application is responsible for printing the number of copies specified by <b>nCopies</b>. For more information, see the description of the <b>PD_USEDEVMODECOPIESANDCOLLATE</b> flag.
     * @type {Integer}
     */
    nCopies {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * If the <b>PD_ENABLEPRINTTEMPLATE</b> or <b>PD_ENABLESETUPTEMPLATE</b> flag is set in the <b>Flags</b> member, <b>hInstance</b> is a handle to the application or module instance that contains the dialog box template named by the <b>lpPrintTemplateName</b> or <b>lpSetupTemplateName</b> member.
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 56)
            return this.__hInstance
        }
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * Application-defined data that the system passes to the hook procedure identified by the <b>lpfnPrintHook</b> or <b>lpfnSetupHook</b> member. When the system sends the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message to the hook procedure, the message's <i>lParam</i> parameter is a pointer to the <b>PRINTDLG</b> structure specified when the dialog was created. The hook procedure can use this pointer to get the <b>lCustData</b> value.
     * @type {LPARAM}
     */
    lCustData{
        get {
            if(!this.HasProp("__lCustData"))
                this.__lCustData := LPARAM(this.ptr + 64)
            return this.__lCustData
        }
    }

    /**
     * Type: <b>LPPRINTHOOKPROC</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpprinthookproc">PrintHookProc</a> hook procedure that can process messages intended for the <b>Print</b> dialog box. This member is ignored unless the <b>PD_ENABLEPRINTHOOK</b> flag is set in the <b>Flags</b> member.
     * @type {Pointer<LPPRINTHOOKPROC>}
     */
    lpfnPrintHook {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>LPSETUPHOOKPROC</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpsetuphookproc">SetupHookProc</a> hook procedure that can process messages intended for the <b>Print Setup</b> dialog box. This member is ignored unless the <b>PD_ENABLESETUPHOOK</b> flag is set in the <b>Flags</b> member.
     * @type {Pointer<LPSETUPHOOKPROC>}
     */
    lpfnSetupHook {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The name of the dialog box template resource in the module identified by the <b>hInstance</b> member. This template replaces the default <b>Print</b> dialog box template. This member is ignored unless the <b>PD_ENABLEPRINTTEMPLATE</b> flag is set in the <b>Flags</b> member.
     * @type {PWSTR}
     */
    lpPrintTemplateName{
        get {
            if(!this.HasProp("__lpPrintTemplateName"))
                this.__lpPrintTemplateName := PWSTR(this.ptr + 88)
            return this.__lpPrintTemplateName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The name of the dialog box template resource in the module identified by the <b>hInstance</b> member. This template replaces the default <b>Print Setup</b> dialog box template. This member is ignored unless the <b>PD_ENABLESETUPTEMPLATE</b> flag is set in the <b>Flags</b> member.
     * @type {PWSTR}
     */
    lpSetupTemplateName{
        get {
            if(!this.HasProp("__lpSetupTemplateName"))
                this.__lpSetupTemplateName := PWSTR(this.ptr + 96)
            return this.__lpSetupTemplateName
        }
    }

    /**
     * Type: <b>HGLOBAL</b>
     * 
     * If the <b>PD_ENABLEPRINTTEMPLATEHANDLE</b> flag is set in the <b>Flags</b> member, <b>hPrintTemplate</b> is a handle to a memory object containing a dialog box template. This template replaces the default <b>Print</b> dialog box template.
     * @type {HGLOBAL}
     */
    hPrintTemplate{
        get {
            if(!this.HasProp("__hPrintTemplate"))
                this.__hPrintTemplate := HGLOBAL(this.ptr + 104)
            return this.__hPrintTemplate
        }
    }

    /**
     * Type: <b>HGLOBAL</b>
     * 
     * If the <b>PD_ENABLESETUPTEMPLATEHANDLE</b> flag is set in the <b>Flags</b> member, <b>hSetupTemplate</b> is a handle to a memory object containing a dialog box template. This template replaces the default <b>Print Setup</b> dialog box template.
     * @type {HGLOBAL}
     */
    hSetupTemplate{
        get {
            if(!this.HasProp("__hSetupTemplate"))
                this.__hSetupTemplate := HGLOBAL(this.ptr + 112)
            return this.__hSetupTemplate
        }
    }
}
