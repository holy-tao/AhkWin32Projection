#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the known VPN management errors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementerrorstatus
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnManagementErrorStatus extends Win32Enum{

    /**
     * No error.
     * @type {Integer (Int32)}
     */
    static Ok => 0

    /**
     * Other
     * @type {Integer (Int32)}
     */
    static Other => 1

    /**
     * Invalid XML syntax
     * @type {Integer (Int32)}
     */
    static InvalidXmlSyntax => 2

    /**
     * The profile name is too long.
     * @type {Integer (Int32)}
     */
    static ProfileNameTooLong => 3

    /**
     * The app id is invalid.
     * @type {Integer (Int32)}
     */
    static ProfileInvalidAppId => 4

    /**
     * Access is denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 5

    /**
     * A specified profile cannot be found.
     * @type {Integer (Int32)}
     */
    static CannotFindProfile => 6

    /**
     * The connection is in the process of being disconnected.
     * @type {Integer (Int32)}
     */
    static AlreadyDisconnecting => 7

    /**
     * The connection already exists.
     * @type {Integer (Int32)}
     */
    static AlreadyConnected => 8

    /**
     * Connection failed during authentication. No further details available.
     * @type {Integer (Int32)}
     */
    static GeneralAuthenticationFailure => 9

    /**
     * EAP authentication has failed.
     * @type {Integer (Int32)}
     */
    static EapFailure => 10

    /**
     * Smart Card authentication has failed.
     * @type {Integer (Int32)}
     */
    static SmartCardFailure => 11

    /**
     * Certificate authentication has failed.
     * @type {Integer (Int32)}
     */
    static CertificateFailure => 12

    /**
     * The server configuration is invalid.
     * @type {Integer (Int32)}
     */
    static ServerConfiguration => 13

    /**
     * No internet connection is available.
     * @type {Integer (Int32)}
     */
    static NoConnection => 14

    /**
     * Can't connect to the server.
     * @type {Integer (Int32)}
     */
    static ServerConnection => 15

    /**
     * User name/password authentication has failed.
     * @type {Integer (Int32)}
     */
    static UserNamePassword => 16

    /**
     * A given hostname was not resolvable through the available DNS.
     * @type {Integer (Int32)}
     */
    static DnsNotResolvable => 17

    /**
     * A given IP address was invalid.
     * @type {Integer (Int32)}
     */
    static InvalidIP => 18
}
