#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class CallingConventionKind extends Win32Enum {

    /**
     * Native name: CallingConventionUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: CallingConventionCDecl
     * @type {Integer (Int32)}
     */
    static ConventionCDecl => 1

    /**
     * Native name: CallingConventionFastCall
     * @type {Integer (Int32)}
     */
    static FastCall => 2

    /**
     * Native name: CallingConventionStdCall
     * @type {Integer (Int32)}
     */
    static StdCall => 3

    /**
     * Native name: CallingConventionSysCall
     * @type {Integer (Int32)}
     */
    static SysCall => 4

    /**
     * Native name: CallingConventionThisCall
     * @type {Integer (Int32)}
     */
    static ThisCall => 5
}
