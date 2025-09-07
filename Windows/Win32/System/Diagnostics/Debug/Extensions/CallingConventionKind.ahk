#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class CallingConventionKind{

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionCDecl => 1

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionFastCall => 2

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionStdCall => 3

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionSysCall => 4

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionThisCall => 5
}
