#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class APPDOMAIN_SECURITY_FLAGS extends Win32Enum {

    /**
     * Native name: APPDOMAIN_SECURITY_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: APPDOMAIN_SECURITY_SANDBOXED
     * @type {Integer (Int32)}
     */
    static SANDBOXED => 1

    /**
     * Native name: APPDOMAIN_SECURITY_FORBID_CROSSAD_REVERSE_PINVOKE
     * @type {Integer (Int32)}
     */
    static FORBID_CROSSAD_REVERSE_PINVOKE => 2

    /**
     * Native name: APPDOMAIN_FORCE_TRIVIAL_WAIT_OPERATIONS
     * @type {Integer (Int32)}
     */
    static FORCE_TRIVIAL_WAIT_OPERATIONS => 8
}
