#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\Graphics\Gdi\HPALETTE.ahk

/**
 * The PROPSHEETHEADERA_V2 (ANSI) structure defines the frame and pages of a property sheet.
 * @remarks
 * If the user chooses a setting such as Large Fonts, which enlarges the dialog box, the watermark that is painted on the start and finish pages will be enlarged as well. The size and position of the original bitmap will remain the same. The additional area will be filled with the color of the pixel in the upper-left corner of the bitmap.
  * 
  * Note that several members of this structure are only supported for Comctl32.dll versions 4.71 and later. You can enable these members by including one of the following in your header. 
  * 
  *                 
  * 
  * <c>#define _WIN32_IE 0x0400 // For version 4.71</c>
  * 
  * or
  *                 
  * 
  * <c>#define _WIN32_IE 0x0500 // For version 5.80</c>
  * 
  * However, you must initialize the structure with its size. If you use the size of the currently defined structure, the application may not run with the earlier versions of Comctl32.dll, which expect a smaller structure. This includes all systems with Windows 95 or Microsoft Windows NT 4.0 that do not have Internet Explorer 4.0 or later installed. You can run your application on pre-4.71 versions of Comctl32.dll by defining the appropriate <a href="https://docs.microsoft.com/windows/desktop/Controls/common-controls-intro">version number</a>. However, this may cause problems if your application also needs to run on systems with more recent versions.
  * 
  * You can remain compatible with all Comctl32.dll versions by using the current header files and setting the size of the <b>PROPSHEETHEADER</b> structure appropriately. Before you initialize the structure, use the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nc-shlwapi-dllgetversionproc">DllGetVersion</a> function to determine which Comctl32.dll version is installed on the system. If it is version 4.71 or greater, use
  * 
  * <c>psh.dwSize = sizeof(PROPSHEETHEADER);</c>
  * 
  * to initialize the <b>dwSize</b> member. For earlier versions, the size of the pre-4.71 structure is given by the PROPSHEETHEADER_V1_SIZE constant. Use
  * 
  * <c>psh.dwSize = PROPSHEETHEADER_V1_SIZE;</c>
  * 
  * The PSH_WIZARD, PSH_WIZARD97, and PSH_WIZARD_LITE styles are mutually incompatible. Only one of these style flags should be set. PSH_AEROWIZARD should be combined with PSH_WIZARD.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/ns-prsht-propsheetheadera_v2
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPSHEETHEADERA_V2 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(this.ptr + 8)
            return this.__hwndParent
        }
    }

    /**
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 16)
            return this.__hInstance
        }
    }

    /**
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(this.ptr + 24)
            return this.__hIcon
        }
    }

    /**
     * @type {PSTR}
     */
    pszIcon{
        get {
            if(!this.HasProp("__pszIcon"))
                this.__pszIcon := PSTR(this.ptr + 24)
            return this.__pszIcon
        }
    }

    /**
     * @type {PSTR}
     */
    pszCaption{
        get {
            if(!this.HasProp("__pszCaption"))
                this.__pszCaption := PSTR(this.ptr + 32)
            return this.__pszCaption
        }
    }

    /**
     * @type {Integer}
     */
    nPages {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    nStartPage {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {PSTR}
     */
    pStartPage{
        get {
            if(!this.HasProp("__pStartPage"))
                this.__pStartPage := PSTR(this.ptr + 44)
            return this.__pStartPage
        }
    }

    /**
     * @type {Pointer<PROPSHEETPAGEA>}
     */
    ppsp {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<HPROPSHEETPAGE>}
     */
    phpage {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {HBITMAP}
     */
    hbmWatermark{
        get {
            if(!this.HasProp("__hbmWatermark"))
                this.__hbmWatermark := HBITMAP(this.ptr + 64)
            return this.__hbmWatermark
        }
    }

    /**
     * @type {PSTR}
     */
    pszbmWatermark{
        get {
            if(!this.HasProp("__pszbmWatermark"))
                this.__pszbmWatermark := PSTR(this.ptr + 64)
            return this.__pszbmWatermark
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HPALETTE</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80</a> or later. <b>HPALETTE</b> structure used for drawing the watermark bitmap and/or header bitmap. If the <b>dwFlags</b> member does not include PSH_USEHPLWATERMARK, this member is ignored.
     * @type {HPALETTE}
     */
    hplWatermark{
        get {
            if(!this.HasProp("__hplWatermark"))
                this.__hplWatermark := HPALETTE(this.ptr + 72)
            return this.__hplWatermark
        }
    }

    /**
     * @type {HBITMAP}
     */
    hbmHeader{
        get {
            if(!this.HasProp("__hbmHeader"))
                this.__hbmHeader := HBITMAP(this.ptr + 80)
            return this.__hbmHeader
        }
    }

    /**
     * @type {PSTR}
     */
    pszbmHeader{
        get {
            if(!this.HasProp("__pszbmHeader"))
                this.__pszbmHeader := PSTR(this.ptr + 80)
            return this.__pszbmHeader
        }
    }
}
