#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of credentials that can be requested by the VPN platform.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncredentialtype
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCredentialType extends Win32Enum{

    /**
     * Represents a credential of type Username and Password.
     * @type {Integer (Int32)}
     */
    static UsernamePassword => 0

    /**
     * Represents a credential type of username, and a PIN or OTP.
     * @type {Integer (Int32)}
     */
    static UsernameOtpPin => 1

    /**
     * Represents a credential type of username, password, and PIN.
     * @type {Integer (Int32)}
     */
    static UsernamePasswordAndPin => 2

    /**
     * Represents a password change. The current password, new password, and a confirmation of the new password will be collected.
     * @type {Integer (Int32)}
     */
    static UsernamePasswordChange => 3

    /**
     * Represents a credential type of smart card.
     * @type {Integer (Int32)}
     */
    static SmartCard => 4

    /**
     * Represents a credential type of a protected certificate.
     * @type {Integer (Int32)}
     */
    static ProtectedCertificate => 5

    /**
     * Represents a credential type of a certificate.
     * @type {Integer (Int32)}
     */
    static UnProtectedCertificate => 6
}
