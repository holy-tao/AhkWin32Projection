#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\HGLOBAL.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include ..\..\..\Foundation\RECT.ahk
#Include ..\..\..\Foundation\HINSTANCE.ahk

/**
 * Contains information the PageSetupDlg function uses to initialize the Page Setup dialog box. After the user closes the dialog box, the system returns information about the user-defined page parameters in this structure.
 * @remarks
 * 
  * If the <b>PSD_INHUNDREDTHSOFMILLIMETERS</b> and <b>PSD_INTHOUSANDTHSOFINCHES</b> flags are not specified, the system queries the <b>LOCALE_IMEASURE</b> value of the default user locale to determine the unit of measure (either hundredths of millimeters or thousandths of inches) for the margin widths and paper size. 
  * 
  * If both <b>hDevNames</b> and <b>hDevMode</b> have valid handles and the printer name specified by the 
  * 				<b>wDeviceOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure is not the same as the name specified by the <b>dmDeviceName</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure, the system uses the name specified by <b>wDeviceOffset</b> by default. 
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The commdlg.h header defines PAGESETUPDLG as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/ns-commdlg-pagesetupdlga
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset ANSI
 */
class PAGESETUPDLGA extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of this structure.
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
                this.__hwndOwner := HWND(8, this)
            return this.__hwndOwner
        }
    }

    /**
     * Type: <b>HGLOBAL</b>
     * 
     * A handle to a global memory object that contains a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. On input, if a handle is specified, the values in the corresponding <b>DEVMODE</b> structure are used to initialize the controls in the dialog box. On output, the dialog box sets <b>hDevMode</b> to a global memory handle to a <b>DEVMODE</b> structure that contains values specifying the user's selections. If the user's selections are not available, the dialog box sets <b>hDevMode</b> to <b>NULL</b>.
     * @type {HGLOBAL}
     */
    hDevMode{
        get {
            if(!this.HasProp("__hDevMode"))
                this.__hDevMode := HGLOBAL(16, this)
            return this.__hDevMode
        }
    }

    /**
     * Type: <b>HGLOBAL</b>
     * 
     * A handle to a global memory object that contains a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure. This structure contains three strings that specify the driver name, the printer name, and the output port name. On input, if a handle is specified, the strings in the corresponding <b>DEVNAMES</b> structure are used to initialize controls in the dialog box. On output, the dialog box sets 
     * 					<b>hDevNames</b> to a global memory handle to a <b>DEVNAMES</b> structure that contains strings specifying the user's selections. If the user's selections are not available, the dialog box sets <b>hDevNames</b> to <b>NULL</b>.
     * @type {HGLOBAL}
     */
    hDevNames{
        get {
            if(!this.HasProp("__hDevNames"))
                this.__hDevNames := HGLOBAL(24, this)
            return this.__hDevNames
        }
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * The dimensions of the paper selected by the user. The <b>PSD_INTHOUSANDTHSOFINCHES</b> or <b>PSD_INHUNDREDTHSOFMILLIMETERS</b> flag indicates the units of measurement.
     * @type {POINT}
     */
    ptPaperSize{
        get {
            if(!this.HasProp("__ptPaperSize"))
                this.__ptPaperSize := POINT(40, this)
            return this.__ptPaperSize
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The minimum allowable widths for the left, top, right, and bottom margins. The system ignores this member if the <b>PSD_MINMARGINS</b> flag is not set. These values must be less than or equal to the values specified in the <b>rtMargin</b> member. The <b>PSD_INTHOUSANDTHSOFINCHES</b> or <b>PSD_INHUNDREDTHSOFMILLIMETERS</b> flag indicates the units of measurement.
     * @type {RECT}
     */
    rtMinMargin{
        get {
            if(!this.HasProp("__rtMinMargin"))
                this.__rtMinMargin := RECT(48, this)
            return this.__rtMinMargin
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The widths of the left, top, right, and bottom margins. If you set the <b>PSD_MARGINS</b> flag, <b>rtMargin</b> specifies the initial margin values. When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646937(v=vs.85)">PageSetupDlg</a> returns, <b>rtMargin</b> contains the margin widths selected by the user. The <b>PSD_INHUNDREDTHSOFMILLIMETERS</b> or <b>PSD_INTHOUSANDTHSOFINCHES</b> flag indicates the units of measurement.
     * @type {RECT}
     */
    rtMargin{
        get {
            if(!this.HasProp("__rtMargin"))
                this.__rtMargin := RECT(64, this)
            return this.__rtMargin
        }
    }

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * If the <b>PSD_ENABLEPAGESETUPTEMPLATE</b> flag is set in the <b>Flags</b> member, <b>hInstance</b> is a handle to the application or module instance that contains the dialog box template named by the <b>lpPageSetupTemplateName</b> member.
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(80, this)
            return this.__hInstance
        }
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * Application-defined data that the system passes to the hook procedure identified by the <b>lpfnPageSetupHook</b> member. When the system sends the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message to the hook procedure, the message's <i>lParam</i> parameter is a pointer to the <b>PAGESETUPDLG</b> structure specified when the dialog was created. The hook procedure can use this pointer to get the <b>lCustData</b> value.
     * @type {LPARAM}
     */
    lCustData {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b>LPPAGESETUPHOOK</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lppagesetuphook">PageSetupHook</a> hook procedure that can process messages intended for the dialog box. This member is ignored unless the <b>PSD_ENABLEPAGESETUPHOOK</b> flag is set in the <b>Flags</b> member.
     * @type {Pointer<LPPAGESETUPHOOK>}
     */
    lpfnPageSetupHook {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b>LPPAGEPAINTHOOK</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lppagepainthook">PagePaintHook</a> hook procedure that receives <b>WM_PSD_*</b> messages from the dialog box whenever the sample page is redrawn. By processing the messages, the hook procedure can customize the appearance of the sample page. This member is ignored unless the <b>PSD_ENABLEPAGEPAINTHOOK</b> flag is set in the <b>Flags</b> member.
     * @type {Pointer<LPPAGEPAINTHOOK>}
     */
    lpfnPagePaintHook {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The name of the dialog box template resource in the module identified by the <b>hInstance</b> member. This template is substituted for the standard dialog box template. For numbered dialog box resources, <b>lpPageSetupTemplateName</b> can be a value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. This member is ignored unless the <b>PSD_ENABLEPAGESETUPTEMPLATE</b> flag is set in the <b>Flags</b> member.
     * @type {PSTR}
     */
    lpPageSetupTemplateName {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Type: <b>HGLOBAL</b>
     * 
     * If the <b>PSD_ENABLEPAGESETUPTEMPLATEHANDLE</b> flag is set in the <b>Flags</b> member, <b>hPageSetupTemplate</b> is a handle to a memory object containing a dialog box template.
     * @type {HGLOBAL}
     */
    hPageSetupTemplate{
        get {
            if(!this.HasProp("__hPageSetupTemplate"))
                this.__hPageSetupTemplate := HGLOBAL(120, this)
            return this.__hPageSetupTemplate
        }
    }
}
