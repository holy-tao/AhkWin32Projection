#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GROUP_POLICY_HINT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GPHintUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static GPHintMachine => 1

    /**
     * @type {Integer (Int32)}
     */
    static GPHintSite => 2

    /**
     * @type {Integer (Int32)}
     */
    static GPHintDomain => 3

    /**
     * @type {Integer (Int32)}
     */
    static GPHintOrganizationalUnit => 4
}
