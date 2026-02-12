#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the possible ways in which elevated users are notified about Automatic Updates events.
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/ne-wuapi-automaticupdatesnotificationlevel
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class AutomaticUpdates extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
