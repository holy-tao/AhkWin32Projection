#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class SCRIPTUICHANDLING extends Win32Enum {

    /**
     * Native name: SCRIPTUICHANDLING_ALLOW
     * @type {Integer (Int32)}
     */
    static ALLOW => 0

    /**
     * Native name: SCRIPTUICHANDLING_NOUIERROR
     * @type {Integer (Int32)}
     */
    static NOUIERROR => 1

    /**
     * Native name: SCRIPTUICHANDLING_NOUIDEFAULT
     * @type {Integer (Int32)}
     */
    static NOUIDEFAULT => 2
}
