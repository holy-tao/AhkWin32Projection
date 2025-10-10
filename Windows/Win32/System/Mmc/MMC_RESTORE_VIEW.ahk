#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MMC_RESTORE_VIEW structure is introduced in MMC 1.1.
 * @remarks
 * 
  * MMC maintains a navigational history of the result pane. For each item in the history, MMC stores the view type and view options specified by <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> when the result pane was originally displayed during the course of the current console session. When the back or forward buttons are used to navigate the history, MMC sends the snap-in that owns that item an 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-restore-view">MMCN_RESTORE_VIEW</a> notification that has a pointer to an 
  * MMC_RESTORE_VIEW structure as its arg parameter and a pointer to a BOOL as its param parameter. The snap-in should handle that notification by setting the appropriate menu item in the 
  * <b>View</b> context menu, setting its internal view type state, and performing any initialization necessary to display the result pane as it appeared at that point in the view history.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-mmc_restore_view
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_RESTORE_VIEW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A value that specifies the size of the 
     * MMC_RESTORE_VIEW structure. A snap-in can use dwSize to check the version of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies the cookie for the item that will be restored in the scope pane.
     * @type {Pointer}
     */
    cookie {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a string that specifies the view type used to display the result pane for the item specified by cookie. For more information about view types, see the ppViewType parameter for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a>.
     * @type {Pointer<Char>}
     */
    pViewType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A value that specifies the view option settings used to display the result pane for the item specified by cookie. For more information about view options, see the pViewOptions parameter of <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a>.
     * @type {Integer}
     */
    lViewOptions {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
