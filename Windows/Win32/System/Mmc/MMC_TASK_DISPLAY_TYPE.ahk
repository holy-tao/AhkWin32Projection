#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MMC_TASK_DISPLAY_TYPE enumeration is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_task_display_type
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_TASK_DISPLAY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No images specified.
     * @type {Integer (Int32)}
     */
    static MMC_TASK_DISPLAY_UNINITIALIZED => 0

    /**
     * The image displayed for the task or background is the symbol specified by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_symbol">MMC_TASK_DISPLAY_SYMBOL</a> structure.
     * @type {Integer (Int32)}
     */
    static MMC_TASK_DISPLAY_TYPE_SYMBOL => 1

    /**
     * The image displayed for the task or background is a transparent GIF image.
     * 
     * The GIF image is specified by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_bitmap">MMC_TASK_DISPLAY_BITMAP</a> structure.
     * 
     * <div class="alert"><b>Note</b>  There is no difference between <b>MMC_TASK_DISPLAY_TYPE_VANILLA_GIF</b> and <b>MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF</b>.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static MMC_TASK_DISPLAY_TYPE_VANILLA_GIF => 2

    /**
     * The image displayed for the task or background is a transparent GIF image.
     * 
     * The GIF image is specified by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_bitmap">MMC_TASK_DISPLAY_BITMAP</a> structure.
     * 
     * <div class="alert"><b>Note</b>  There is no difference between <b>MMC_TASK_DISPLAY_TYPE_VANILLA_GIF</b> and <b>MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF</b>.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF => 3

    /**
     * The image displayed for the task or background is a nontransparent bitmap image.
     * 
     * The bitmap image is specified by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_bitmap">MMC_TASK_DISPLAY_BITMAP</a> structure.
     * @type {Integer (Int32)}
     */
    static MMC_TASK_DISPLAY_TYPE_BITMAP => 4
}
