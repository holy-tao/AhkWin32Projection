#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines all the services that are monitored by Windows Security Center (WSC).
 * @remarks
 * > [!NOTE]
 * > [WSC_SECURITY_PROVIDER::WSC_SECURITY_PROVIDER_ANTISPYWARE](/windows/desktop/api/wscapi/ne-wscapi-wsc_security_provider) should be used only in operating systems prior to Windows 10, version 1607. As of Windows 10, version 1607, WSC continues to track the status for antivirus, but not for anti-spyware.
 * @see https://learn.microsoft.com/windows/win32/api/wscapi/ne-wscapi-wsc_security_provider
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class WSC_SECURITY_PROVIDER extends Win32Enum{

    /**
     * The aggregation of all firewalls for this computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_FIREWALL => 1

    /**
     * The automatic update settings for this computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_AUTOUPDATE_SETTINGS => 2

    /**
     * The aggregation of all antivirus products for this computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_ANTIVIRUS => 4

    /**
     * The aggregation of all anti-spyware products for this computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_ANTISPYWARE => 8

    /**
     * The settings that restrict the access of web sites in each of the Internet zones for this computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_INTERNET_SETTINGS => 16

    /**
     * The User Account Control (UAC) settings for this computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_USER_ACCOUNT_CONTROL => 32

    /**
     * The running state of the WSC service on this computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_SERVICE => 64

    /**
     * None of the items that WSC monitors.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_NONE => 0

    /**
     * All of the items that the WSC monitors.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_ALL => 127
}
