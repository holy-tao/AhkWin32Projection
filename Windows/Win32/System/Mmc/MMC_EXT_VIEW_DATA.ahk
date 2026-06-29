#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The MMC_EXT_VIEW_DATA structure is introduced in MMC 2.0.
 * @remarks
 * For an example of the 
 * <b>MMC_EXT_VIEW_DATA</b> structure used in C++ code, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iviewextensioncallback-addview">IViewExtensionCallback::AddView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_ext_view_data
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_EXT_VIEW_DATA {
    #StructPack 8

    /**
     * GUID for the view; this value uniquely identifies the view and is used to restore the view.
     */
    viewID : Guid

    /**
     * URL to the HTML used in the result pane; this typically points to an HTML resource in the snap-in's DLL.
     */
    pszURL : PWSTR

    /**
     * Title of the view extension.
     */
    pszViewTitle : PWSTR

    /**
     * This value is reserved for future use.
     */
    pszTooltipText : PWSTR

    /**
     * If <b>TRUE</b>, the <b>Standard</b> tab does not appear in the tab selector; otherwise, the <b>Standard</b> tab appears. There is usually no need to display the <b>Standard</b> tab if the view extension snap-in displays the list of the primary snap-in.
     */
    bReplacesDefaultView : BOOL

}
