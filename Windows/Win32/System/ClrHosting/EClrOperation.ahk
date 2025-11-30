#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class EClrOperation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OPR_ThreadAbort => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPR_ThreadRudeAbortInNonCriticalRegion => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPR_ThreadRudeAbortInCriticalRegion => 2

    /**
     * @type {Integer (Int32)}
     */
    static OPR_AppDomainUnload => 3

    /**
     * @type {Integer (Int32)}
     */
    static OPR_AppDomainRudeUnload => 4

    /**
     * @type {Integer (Int32)}
     */
    static OPR_ProcessExit => 5

    /**
     * @type {Integer (Int32)}
     */
    static OPR_FinalizerRun => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxClrOperation => 7
}
