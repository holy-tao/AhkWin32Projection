#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the reason for locking the System Monitor.
 * @see https://docs.microsoft.com/windows/win32/api//isysmon/ne-isysmon-sysmonbatchreason
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class SysmonBatchReason{

    /**
     * Use to free all locks. Typically, you call <a href="https://docs.microsoft.com/windows/desktop/SysMon/systemmonitor-batchinglock">SystemMonitor.BatchingLock</a> with the same reason you used to gain the lock. For example, if you gained the lock using SysmonBatchAddFiles, you would use SysmonBatchAddFiles when releasing the lock.
     * @type {Integer (Int32)}
     */
    static sysmonBatchNone => 0

    /**
     * Prevents the System Monitor from sampling the file immediately when you use <a href="https://docs.microsoft.com/windows/desktop/SysMon/systemmonitor-logfiles-add">ILogFiles.Add</a> to add a log file to the 
     * collection.
     * @type {Integer (Int32)}
     */
    static sysmonBatchAddFiles => 1

    /**
     * Prevents the System Monitor from sampling the counter immediately when you use <a href="https://docs.microsoft.com/windows/desktop/SysMon/counters-add">ICounters.Add</a> to add a counter to the collection.
     * @type {Integer (Int32)}
     */
    static sysmonBatchAddCounters => 2

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static sysmonBatchAddFilesAutoCounters => 3
}
