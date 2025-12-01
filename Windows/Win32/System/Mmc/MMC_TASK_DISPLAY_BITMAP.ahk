#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MMC_TASK_DISPLAY_BITMAP structure is introduced in MMC 1.1.
 * @remarks
 * Allocate the <b>szMouseOverBitmap</b> and <b>szMouseOffBitmap</b> strings used in the structure with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release them.
 * 
 * If both <b>szMouseOverBitmap</b> and <b>szMouseOffBitmap</b> point to a <b>NULL</b> string, the task does not appear on the taskpad. If one of these strings is <b>NULL</b>, the other string is used for both.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_task_display_bitmap
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_TASK_DISPLAY_BITMAP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a null-terminated string that contains the resource path to the image file for the image displayed for the task when the user moves the mouse over the task's image or text area.
     * 
     * The string should have the following form:
     * 
     * "res://<i>filepath</i>/<i>imgpath</i>"
     * 
     * where <i>filepath</i> is the full path to the snap-in's DLL that stores the image file as a resource, and <i>imgpath</i> is the resource path of the image file with the snap-in DLL.
     * 
     * For example, the following string specifies that the snap-in DLL (snapin.dll) has a path of "c:\windows\system32\snapin.dll" and that the resource path is img/mon.gif: "res://c:\\windows\\system32\\snapin.dll/img/mon.bmp".
     * 
     * If <i>szMouseOverBitmap</i> points to a <b>NULL</b> string, <i>szMouseOffBitmap</i> must be a valid string that contains the location of a valid image. If one of these strings is <b>NULL</b>, the other string is used for both. If both mouse image locations are <b>NULL</b>, the task is not displayed.
     * @type {PWSTR}
     */
    szMouseOverBitmap {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that contains the resource path to the image file for the image displayed for the task when the mouse is not in the task's image or text area.
     * 
     * See <b>szMouseOverBitmap</b> for the format of the string.
     * 
     * If <b>szMouseOffBitmap</b> points to a <b>NULL</b> string, <b>szMouseOverBitmap</b> must be a valid string that contains the location of a valid image. If one of these strings is <b>NULL</b>, the other string is used for both. If both mouse image locations are <b>NULL</b>, the task is not displayed.
     * @type {PWSTR}
     */
    szMouseOffBitmap {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
