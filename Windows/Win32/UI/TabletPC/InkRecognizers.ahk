#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Gets the number of objects or collections contained in a collection. (IInkRecognizers.get_Count)
 * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognizers-get_count
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecognizers extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
