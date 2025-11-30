#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ASSOCIATION_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_assoc_state_zero => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_assoc_state_unauth_unassoc => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_assoc_state_auth_unassoc => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_assoc_state_auth_assoc => 3
}
