#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the type of authentication used by the network.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkauthenticationtype
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkAuthenticationType extends Win32Enum{

    /**
     * No authentication enabled.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Authentication method unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Open authentication over 802.11 wireless. Devices are authenticated and can connect to an access point, but communication with the network requires a matching Wired Equivalent Privacy (WEP) key.
     * @type {Integer (Int32)}
     */
    static Open80211 => 2

    /**
     * Specifies an IEEE 802.11 Shared Key authentication algorithm that requires the use of a pre-shared Wired Equivalent Privacy (WEP) key for the 802.11 authentication.
     * @type {Integer (Int32)}
     */
    static SharedKey80211 => 3

    /**
     * Specifies a Wi-Fi Protected Access (WPA) algorithm. IEEE 802.1X port authorization is performed by the supplicant, authenticator, and authentication server. Cipher keys are dynamically derived through the authentication process.
     * @type {Integer (Int32)}
     */
    static Wpa => 4

    /**
     * Specifies a Wi-Fi Protected Access (WPA) algorithm that uses pre-shared keys (PSK). IEEE 802.1X port authorization is performed by the supplicant and authenticator. Cipher keys are dynamically derived through a pre-shared key that is used on both the supplicant and authenticator.
     * @type {Integer (Int32)}
     */
    static WpaPsk => 5

    /**
     * Wi-Fi Protected Access.
     * @type {Integer (Int32)}
     */
    static WpaNone => 6

    /**
     * Specifies an IEEE 802.11i Robust Security Network Association (RSNA) algorithm. IEEE 802.1X port authorization is performed by the supplicant, authenticator, and authentication server. Cipher keys are dynamically derived through the authentication process.
     * @type {Integer (Int32)}
     */
    static Rsna => 7

    /**
     * Specifies an IEEE 802.11i RSNA algorithm that uses PSK. IEEE 802.1X port authorization is performed by the supplicant and authenticator. Cipher keys are dynamically derived through a pre-shared key that is used on both the supplicant and authenticator.
     * @type {Integer (Int32)}
     */
    static RsnaPsk => 8

    /**
     * Specifies an authentication type defined by an independent hardware vendor (IHV).
     * @type {Integer (Int32)}
     */
    static Ihv => 9

    /**
     * Wherever possible you should use the name *Wpa3Enterprise192Bits* in your code in preference to *Wpa3*. Both names have the same integer value of 10, and both have the same meaning to Windows. But *Wpa3Enterprise192Bits* is a clearer and more accurate name, and you should use it. See *Wpa3Enterprise192Bits* for a description.
     * @type {Integer (Int32)}
     */
    static Wpa3 => 10

    /**
     * Specifies a 192-bit encryption mode for Wi-Fi Protected Access 3 Enterprise (WPA3-Enterprise) networks. It imposes higher security requirements on top of *Wpa3Enterprise*, such as allowing only EAP-TLS authentication method, Gcmp256 as the cipher, and usage of 384-bit prime modulus curve P-384.
     * 
     * *Wpa3Enterprise192Bits* has the same value and meaning as *Wpa3* does, but you should prefer *Wpa3Enterprise192Bits* because it's a more explicit name.
     * @type {Integer (Int32)}
     */
    static Wpa3Enterprise192Bits => 10

    /**
     * Specifies a Wi-Fi Protected Access 3 Simultaneous Authentication of Equals (WPA3 SAE) algorithm. WPA3 SAE is the consumer version of WPA3. Simultaneous Authentication of Equals (SAE) is a secure key establishment protocol between devices; it provides synchronous authentication, and stronger protections for users against password-guessing attempts by third parties.
     * @type {Integer (Int32)}
     */
    static Wpa3Sae => 11

    /**
     * Specifies an opportunistic wireless encryption (OWE) algorithm. OWE provides opportunistic encryption over 802.11 wireless, where cipher keys are dynamically derived through a Diffie-Hellman key exchange; enabling data protection without authentication.
     * @type {Integer (Int32)}
     */
    static Owe => 12

    /**
     * Specifies a Wi-Fi Protected Access 3 Enterprise (WPA3-Enterprise) algorithm. WPA3-Enterprise uses IEEE 802.1X in a similar way as RSNA, but provides increased security through the use of mandatory certificate validation and protected management frames.
     * @type {Integer (Int32)}
     */
    static Wpa3Enterprise => 13
}
