#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The MMC_EXT_VIEW_DATA structure is introduced in MMC 2.0.
 * @remarks
 * 
  * For an example of the 
  * <b>MMC_EXT_VIEW_DATA</b> structure used in C++ code, see 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iviewextensioncallback-addview">IViewExtensionCallback::AddView</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-mmc_ext_view_data
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_EXT_VIEW_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * GUID for the view; this value uniquely identifies the view and is used to restore the view.
     * @type {Pointer<Guid>}
     */
    viewID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * URL to the HTML used in the result pane; this typically points to an HTML resource in the snap-in's DLL.
     * @type {PWSTR}
     */
    pszURL{
        get {
            if(!this.HasProp("__pszURL"))
                this.__pszURL := PWSTR(this.ptr + 8)
            return this.__pszURL
        }
    }

    /**
     * Title of the view extension.
     * @type {PWSTR}
     */
    pszViewTitle{
        get {
            if(!this.HasProp("__pszViewTitle"))
                this.__pszViewTitle := PWSTR(this.ptr + 16)
            return this.__pszViewTitle
        }
    }

    /**
     * This value is reserved for future use.
     * @type {PWSTR}
     */
    pszTooltipText{
        get {
            if(!this.HasProp("__pszTooltipText"))
                this.__pszTooltipText := PWSTR(this.ptr + 24)
            return this.__pszTooltipText
        }
    }

    /**
     * If <b>TRUE</b>, the <b>Standard</b> tab does not appear in the tab selector; otherwise, the <b>Standard</b> tab appears. There is usually no need to display the <b>Standard</b> tab if the view extension snap-in displays the list of the primary snap-in.
     * @type {BOOL}
     */
    bReplacesDefaultView{
        get {
            if(!this.HasProp("__bReplacesDefaultView"))
                this.__bReplacesDefaultView := BOOL(this.ptr + 32)
            return this.__bReplacesDefaultView
        }
    }
}
