#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MMC_TASK_DISPLAY_SYMBOL.ahk" { MMC_TASK_DISPLAY_SYMBOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MMC_TASK_DISPLAY_TYPE.ahk" { MMC_TASK_DISPLAY_TYPE }
#Import ".\MMC_TASK_DISPLAY_BITMAP.ahk" { MMC_TASK_DISPLAY_BITMAP }

/**
 * Specifies the type of image and all the data required to use that image to display a task or the background on a taskpad.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_task_display_object
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_TASK_DISPLAY_OBJECT {
    #StructPack 8

    /**
     * Value of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_task_display_type">MMC_TASK_DISPLAY_TYPE</a> that specifies the type of image displayed as the background. The image can be one of three types: symbol, GIF, or bitmap.
     */
    eDisplayType : MMC_TASK_DISPLAY_TYPE

    uBitmap : MMC_TASK_DISPLAY_BITMAP

    static __New() {
        DefineProp(this.Prototype, 'uSymbol', { type: MMC_TASK_DISPLAY_SYMBOL, offset: 8 })
        this.DeleteProp("__New")
    }
}
