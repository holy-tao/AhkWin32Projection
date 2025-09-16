#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MMC_EXT_VIEW_DATA structure is introduced in MMC 2.0.
 * @remarks
 * For an example of the 
  * <b>MMC_EXT_VIEW_DATA</b> structure used in C++ code, see 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iviewextensioncallback-addview">IViewExtensionCallback::AddView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_ext_view_data
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
     * @type {Pointer<PWSTR>}
     */
    pszURL {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Title of the view extension.
     * @type {Pointer<PWSTR>}
     */
    pszViewTitle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * This value is reserved for future use.
     * @type {Pointer<PWSTR>}
     */
    pszTooltipText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * If <b>TRUE</b>, the <b>Standard</b> tab does not appear in the tab selector; otherwise, the <b>Standard</b> tab appears. There is usually no need to display the <b>Standard</b> tab if the view extension snap-in displays the list of the primary snap-in.
     * @type {Integer}
     */
    bReplacesDefaultView {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
