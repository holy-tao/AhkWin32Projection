#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MMC_EXPANDSYNC_STRUCT structure is introduced in MMC 1.1.
 * @remarks
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expandsync">MMCN_EXPANDSYNC</a> notification is sent by MMC when it requires a scope item to be synchronously expanded. Normally, this occurs when a console file is reloaded with a scope item expanded. For more information about handling this notification, see 
 * <b>MMCN_EXPANDSYNC</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_expandsync_struct
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_EXPANDSYNC_STRUCT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value that specifies whether the snap-in has expanded the specified scope item. If this value is <b>TRUE</b>, the snap-in handles <b>MMC_EXPANDSYNC</b>, and consequently MMC does not send a further <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a> notification to the snap-in.
     * 
     * The default value for <b>bHandled</b> is <b>FALSE</b>. If the snap-in does not handle <b>MMC_EXPANDSYNC</b> or sets <b>bHandled</b> to <b>FALSE</b>, MMC sends an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a> notification to the snap-in.
     * @type {BOOL}
     */
    bHandled {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value that specifies whether the snap-in is expanding or collapsing. <b>TRUE</b> if the folder is being expanded. <b>FALSE</b> if the folder is being collapsed.
     * @type {BOOL}
     */
    bExpanding {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The <b>HSCOPEITEM</b> of the item that must be expanded.
     * @type {Pointer}
     */
    hItem {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
