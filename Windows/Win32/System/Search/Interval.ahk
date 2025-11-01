#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-interval-restarttype-element
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class Interval extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
