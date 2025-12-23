#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Use this class to manage the collection of CounterItem objects. To retrieve this object, call SystemMonitor.Counters.
 * @remarks
 * The **Counters** collection has these types of members:
 * 
 * -   [Methods](#methods)
 * -   [Properties](#properties)
 * 
 * 
 * The **Counters** object is the default property of the [**SystemMonitor**](systemmonitor.md) object.
 * 
 * Add to this collection those counters that you want to graph. SYSMON retrieves the counter values either from the system or from a log file depending on the [**data source**](systemmonitor-datasourcetype.md) that you specify.
 * @see https://learn.microsoft.com/windows/win32/SysMon/counters
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class Counters extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
