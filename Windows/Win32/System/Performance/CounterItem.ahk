#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Use this class to retrieve the path and value of a counter and to specify the color used to graph the counter. To retrieve this object, call Counters.Item.
 * @remarks
 * The **CounterItem** object has these types of members:
 * 
 * -   [Methods](#methods)
 * -   [Properties](#properties)
 * 
 * 
 * [**Value**](counteritem-value.md) is the default property of **CounterItem**.
 * @see https://learn.microsoft.com/windows/win32/SysMon/counteritem
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class CounterItem extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
