#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_RUNS_IN_PROCESS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_RUNS_IN_NON_SYSTEM_OR_NOT_RUNNING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_RUNS_IN_SYSTEM_PROCESS => 1
}
