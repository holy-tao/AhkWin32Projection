#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASCONNSTATE{

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_OpenPort => 0

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_PortOpened => 1

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_ConnectDevice => 2

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_DeviceConnected => 3

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_AllDevicesConnected => 4

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_Authenticate => 5

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_AuthNotify => 6

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_AuthRetry => 7

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_AuthCallback => 8

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_AuthChangePassword => 9

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_AuthProject => 10

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_AuthLinkSpeed => 11

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_AuthAck => 12

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_ReAuthenticate => 13

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_Authenticated => 14

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_PrepareForCallback => 15

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_WaitForModemReset => 16

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_WaitForCallback => 17

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_Projected => 18

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_StartAuthentication => 19

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_CallbackComplete => 20

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_LogonNetwork => 21

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_SubEntryConnected => 22

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_SubEntryDisconnected => 23

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_ApplySettings => 24

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_Interactive => 4096

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_RetryAuthentication => 4097

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_CallbackSetByCaller => 4098

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_PasswordExpired => 4099

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_InvokeEapUI => 4100

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_Connected => 8192

    /**
     * @type {Integer (Int32)}
     */
    static RASCS_Disconnected => 8193
}
