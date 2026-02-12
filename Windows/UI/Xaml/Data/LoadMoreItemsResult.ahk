#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Wraps the asynchronous results of a [LoadMoreItemsAsync](icollectionview_loadmoreitemsasync_928705393.md) call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.loadmoreitemsresult
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class LoadMoreItemsResult extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The number of items that were actually loaded.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
