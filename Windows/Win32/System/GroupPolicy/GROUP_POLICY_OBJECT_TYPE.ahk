#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
class GROUP_POLICY_OBJECT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static GPOTypeLocal => 0

    /**
     * @type {Integer (Int32)}
     */
    static GPOTypeRemote => 1

    /**
     * @type {Integer (Int32)}
     */
    static GPOTypeDS => 2

    /**
     * @type {Integer (Int32)}
     */
    static GPOTypeLocalUser => 3

    /**
     * @type {Integer (Int32)}
     */
    static GPOTypeLocalGroup => 4
}
