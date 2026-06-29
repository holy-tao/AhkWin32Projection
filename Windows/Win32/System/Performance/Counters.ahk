#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct Counters {
    #StructPack 1

}
