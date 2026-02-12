#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Adds an image or images to an image list. (ImageList_Add)
 * @remarks
 * The <b>ImageList_Add</b> function copies the bitmap to an internal data structure. Be sure to use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function to delete 
 * 				<i>hbmImage</i> and 
 * 				<i>hbmMask</i> after the function returns.
 * @see https://learn.microsoft.com/windows/win32/api//content/commctrl/nf-commctrl-imagelist_add
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class ImageList extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
