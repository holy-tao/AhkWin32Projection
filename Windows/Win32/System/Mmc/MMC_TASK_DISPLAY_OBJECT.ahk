#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MMC_TASK_DISPLAY_BITMAP.ahk
#Include .\MMC_TASK_DISPLAY_SYMBOL.ahk

/**
 * Specifies the type of image and all the data required to use that image to display a task or the background on a taskpad.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_task_display_object
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_TASK_DISPLAY_OBJECT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Value of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_task_display_type">MMC_TASK_DISPLAY_TYPE</a> that specifies the type of image displayed as the background. The image can be one of three types: symbol, GIF, or bitmap.
     * @type {Integer}
     */
    eDisplayType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {MMC_TASK_DISPLAY_BITMAP}
     */
    uBitmap{
        get {
            if(!this.HasProp("__uBitmap"))
                this.__uBitmap := MMC_TASK_DISPLAY_BITMAP(this.ptr + 8)
            return this.__uBitmap
        }
    }

    /**
     * @type {MMC_TASK_DISPLAY_SYMBOL}
     */
    uSymbol{
        get {
            if(!this.HasProp("__uSymbol"))
                this.__uSymbol := MMC_TASK_DISPLAY_SYMBOL(this.ptr + 8)
            return this.__uSymbol
        }
    }
}
