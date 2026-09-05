#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the reason for locking the System Monitor.
 * @see https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-sysmonbatchreason
 * @namespace Windows.Win32.System.Performance
 */
class SysmonBatchReason extends Win32Enum {

    /**
     * Use to free all locks. Typically, you call <a href="https://docs.microsoft.com/windows/desktop/SysMon/systemmonitor-batchinglock">SystemMonitor.BatchingLock</a> with the same reason you used to gain the lock. For example, if you gained the lock using SysmonBatchAddFiles, you would use SysmonBatchAddFiles when releasing the lock.
     * Native name: sysmonBatchNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Prevents the System Monitor from sampling the file immediately when you use <a href="https://docs.microsoft.com/windows/desktop/SysMon/systemmonitor-logfiles-add">ILogFiles.Add</a> to add a log file to the 
     * collection.
     * Native name: sysmonBatchAddFiles
     * @type {Integer (Int32)}
     */
    static AddFiles => 1

    /**
     * Prevents the System Monitor from sampling the counter immediately when you use <a href="https://docs.microsoft.com/windows/desktop/SysMon/counters-add">ICounters.Add</a> to add a counter to the collection.
     * Native name: sysmonBatchAddCounters
     * @type {Integer (Int32)}
     */
    static AddCounters => 2

    /**
     * TBD
     * Native name: sysmonBatchAddFilesAutoCounters
     * @type {Integer (Int32)}
     */
    static AddFilesAutoCounters => 3
}
