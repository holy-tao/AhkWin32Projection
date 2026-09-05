#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EMemoryCriticalLevel extends Win32Enum {

    /**
     * Native name: eTaskCritical
     * @type {Integer (Int32)}
     */
    static TaskCritical => 0

    /**
     * Native name: eAppDomainCritical
     * @type {Integer (Int32)}
     */
    static AppDomainCritical => 1

    /**
     * Native name: eProcessCritical
     * @type {Integer (Int32)}
     */
    static ProcessCritical => 2
}
