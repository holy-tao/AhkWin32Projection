#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags used for setting security access levels.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_security_flags
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_SECURITY_FLAGS{

    /**
     * Enables the account and grants the user read permissions. This is a default access right for all users and corresponds to the Enable Account permission on the Security tab of the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/gloss-w">WMI Control</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/setting-namespace-security-with-the-wmi-control">Setting Namespace Security with the WMI Control</a>.
     * @type {Integer (Int32)}
     */
    static WBEM_ENABLE => 1

    /**
     * Allows the execution of methods. 
 * 
 * 
 *  Providers can perform additional access checks. This is a default access right for all users and corresponds to the Execute Methods permission on the Security tab of the WMI Control.
     * @type {Integer (Int32)}
     */
    static WBEM_METHOD_EXECUTE => 2

    /**
     * Allows a user account to write to classes in the WMI repository as well as instances. A user cannot write to system classes. Only members of the Administrators group have this permission. <b>WBEM_FULL_WRITE_REP</b> corresponds to the Full Write permission on the Security tab of the WMI Control.
     * @type {Integer (Int32)}
     */
    static WBEM_FULL_WRITE_REP => 4

    /**
     * Allows you to write data to instances only, not classes. A user cannot write classes to the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/gloss-w">WMI repository</a>. Only members of the Administrators group have this right. <b>WBEM_PARTIAL_WRITE_REP</b> corresponds to the Partial Write permission on the Security tab of the WMI Control.
     * @type {Integer (Int32)}
     */
    static WBEM_PARTIAL_WRITE_REP => 8

    /**
     * Allows writing classes and instances to providers. Note that providers can do additional access checks when impersonating a user. This is a default access right for all users and corresponds to the Provider Write permission on the Security tab of the WMI Control.
     * @type {Integer (Int32)}
     */
    static WBEM_WRITE_PROVIDER => 16

    /**
     * Allows a user account to remotely perform any operations allowed by the permissions described above. Only members of the Administrators group have this right. <b>WBEM_REMOTE_ACCESS</b> corresponds to the Remote Enable permission on the Security tab of the WMI Control.
     * @type {Integer (Int32)}
     */
    static WBEM_REMOTE_ACCESS => 32

    /**
     * Specifies that a consumer can subscribe to the events delivered to a sink. Used in <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemeventsink-setsinksecurity">IWbemEventSink::SetSinkSecurity</a>.
     * @type {Integer (Int32)}
     */
    static WBEM_RIGHT_SUBSCRIBE => 64

    /**
     * Specifies that the account can  publish events to the instance of <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--eventfilter">__EventFilter</a> that defines the event filter for a permanent consumer. Available in wbemcli.h.
     * @type {Integer (Int32)}
     */
    static WBEM_RIGHT_PUBLISH => 128
}
