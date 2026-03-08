#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Apis.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * Retrieves a pointer to an IImageList or IImageList2 object that corresponds to the image list's HIMAGELIST handle.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-himagelist_queryinterface
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HIMAGELIST extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    Free(){
        Controls.ImageList_Destroy(this.Value)
        this.Value := -1
    }
}
