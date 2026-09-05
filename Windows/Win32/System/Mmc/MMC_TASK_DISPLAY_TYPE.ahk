#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_TASK_DISPLAY_TYPE enumeration is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_task_display_type
 * @namespace Windows.Win32.System.Mmc
 */
class MMC_TASK_DISPLAY_TYPE extends Win32Enum {

    /**
     * No images specified.
     * Native name: MMC_TASK_DISPLAY_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static UNINITIALIZED => 0

    /**
     * The image displayed for the task or background is the symbol specified by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_symbol">MMC_TASK_DISPLAY_SYMBOL</a> structure.
     * Native name: MMC_TASK_DISPLAY_TYPE_SYMBOL
     * @type {Integer (Int32)}
     */
    static SYMBOL => 1

    /**
     * The image displayed for the task or background is a transparent GIF image.
     * 
     * The GIF image is specified by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_bitmap">MMC_TASK_DISPLAY_BITMAP</a> structure.
     * 
     * <div class="alert"><b>Note</b>  There is no difference between <b>MMC_TASK_DISPLAY_TYPE_VANILLA_GIF</b> and <b>MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF</b>.</div>
     * <div> </div>
     * Native name: MMC_TASK_DISPLAY_TYPE_VANILLA_GIF
     * @type {Integer (Int32)}
     */
    static VANILLA_GIF => 2

    /**
     * The image displayed for the task or background is a transparent GIF image.
     * 
     * The GIF image is specified by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_bitmap">MMC_TASK_DISPLAY_BITMAP</a> structure.
     * 
     * <div class="alert"><b>Note</b>  There is no difference between <b>MMC_TASK_DISPLAY_TYPE_VANILLA_GIF</b> and <b>MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF</b>.</div>
     * <div> </div>
     * Native name: MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF
     * @type {Integer (Int32)}
     */
    static CHOCOLATE_GIF => 3

    /**
     * The image displayed for the task or background is a nontransparent bitmap image.
     * 
     * The bitmap image is specified by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_bitmap">MMC_TASK_DISPLAY_BITMAP</a> structure.
     * Native name: MMC_TASK_DISPLAY_TYPE_BITMAP
     * @type {Integer (Int32)}
     */
    static BITMAP => 4
}
