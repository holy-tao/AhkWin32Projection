#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the current state of the security product that is made available to Windows Security Center.
 * @see https://docs.microsoft.com/windows/win32/api//iwscapi/ne-iwscapi-wsc_security_product_state
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class WSC_SECURITY_PRODUCT_STATE extends Win32Enum{

    /**
     * The security product software is turned on and protecting the user.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_STATE_ON => 0

    /**
     * The security product software is turned off and protection is disabled.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_STATE_OFF => 1

    /**
     * The security product software is in the snoozed state, temporarily off,  and not actively protecting the computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_STATE_SNOOZED => 2

    /**
     * The security product software has expired and is no longer actively protecting the computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_STATE_EXPIRED => 3
}
