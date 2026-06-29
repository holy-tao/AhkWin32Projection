#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The MMC_EXPANDSYNC_STRUCT structure is introduced in MMC 1.1.
 * @remarks
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expandsync">MMCN_EXPANDSYNC</a> notification is sent by MMC when it requires a scope item to be synchronously expanded. Normally, this occurs when a console file is reloaded with a scope item expanded. For more information about handling this notification, see 
 * <b>MMCN_EXPANDSYNC</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_expandsync_struct
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_EXPANDSYNC_STRUCT {
    #StructPack 8

    /**
     * A value that specifies whether the snap-in has expanded the specified scope item. If this value is <b>TRUE</b>, the snap-in handles <b>MMC_EXPANDSYNC</b>, and consequently MMC does not send a further <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a> notification to the snap-in.
     * 
     * The default value for <b>bHandled</b> is <b>FALSE</b>. If the snap-in does not handle <b>MMC_EXPANDSYNC</b> or sets <b>bHandled</b> to <b>FALSE</b>, MMC sends an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a> notification to the snap-in.
     */
    bHandled : BOOL

    /**
     * A value that specifies whether the snap-in is expanding or collapsing. <b>TRUE</b> if the folder is being expanded. <b>FALSE</b> if the folder is being collapsed.
     */
    bExpanding : BOOL

    /**
     * The <b>HSCOPEITEM</b> of the item that must be expanded.
     */
    hItem : IntPtr

}
