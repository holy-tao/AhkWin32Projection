#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type and purpose of a PlayReady-ND transmitter license.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndcertificatetype
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDCertificateType extends Win32Enum{

    /**
     * An unknown certificate type. Apps should never use this value.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * A leaf level certificate used by the PC client.
     * @type {Integer (Int32)}
     */
    static PC => 1

    /**
     * A leaf level certificate used by a device.
     * @type {Integer (Int32)}
     */
    static Device => 2

    /**
     * A leaf level certificate used by a PC or a device when a member of a domain.
     * @type {Integer (Int32)}
     */
    static Domain => 3

    /**
     * Can be an issuer of certificates for either an issuer or a leaf certificate.
     * @type {Integer (Int32)}
     */
    static Issuer => 4

    /**
     * A leaf level certificate used to sign CRLs issued by Microsoft.
     * @type {Integer (Int32)}
     */
    static CrlSigner => 5

    /**
     * A leaf level certificate used by services such as Secure Clock. Reserved for future use.
     * @type {Integer (Int32)}
     */
    static Service => 6

    /**
     * A leaf level certificate for a Silverlight client.
     * @type {Integer (Int32)}
     */
    static Silverlight => 7

    /**
     * A leaf level certificate for a PlayReady client.
     * @type {Integer (Int32)}
     */
    static Application => 8

    /**
     * A leaf level certificate used by digital rights management clients to encrypt metering data sent to a PlayReady SDK server.
     * @type {Integer (Int32)}
     */
    static Metering => 9

    /**
     * A leaf level certificate used by the cryptography server to sign the key file.
     * @type {Integer (Int32)}
     */
    static KeyFileSigner => 10

    /**
     * A leaf level certificate used by the PlayReady server.
     * @type {Integer (Int32)}
     */
    static Server => 11

    /**
     * A certificate used by a license signer.
     * @type {Integer (Int32)}
     */
    static LicenseSigner => 12
}
