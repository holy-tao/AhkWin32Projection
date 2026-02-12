#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the PlayReady-ND feature to which the certificate controls access.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndcertificatefeature
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDCertificateFeature extends Win32Enum{

    /**
     * Entity implements transmitter functionality.
     * @type {Integer (Int32)}
     */
    static Transmitter => 1

    /**
     * Entity implements receiver functionality.
     * @type {Integer (Int32)}
     */
    static Receiver => 2

    /**
     * Entity shares receiver key across multiple devices.
     * @type {Integer (Int32)}
     */
    static SharedCertificate => 3

    /**
     * Device implements SecureClock.
     * @type {Integer (Int32)}
     */
    static SecureClock => 4

    /**
     * Device implements anti-rollback clock.
     * @type {Integer (Int32)}
     */
    static AntiRollBackClock => 5

    /**
     * Entity supports certificate revocation lists.
     * @type {Integer (Int32)}
     */
    static CRLS => 9

    /**
     * Entity supports PlayReady version 3.x features such as per-stream keys.
     * @type {Integer (Int32)}
     */
    static PlayReady3Features => 13
}
