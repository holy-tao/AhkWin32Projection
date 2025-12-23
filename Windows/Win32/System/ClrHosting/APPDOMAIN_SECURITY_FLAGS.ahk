#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class APPDOMAIN_SECURITY_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static APPDOMAIN_SECURITY_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static APPDOMAIN_SECURITY_SANDBOXED => 1

    /**
     * @type {Integer (Int32)}
     */
    static APPDOMAIN_SECURITY_FORBID_CROSSAD_REVERSE_PINVOKE => 2

    /**
     * @type {Integer (Int32)}
     */
    static APPDOMAIN_FORCE_TRIVIAL_WAIT_OPERATIONS => 8
}
