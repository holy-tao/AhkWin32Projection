#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManSessionFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUTF8 => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagCredUsernamePassword => 4096

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagSkipCACheck => 8192

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagSkipCNCheck => 16384

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUseNoAuthentication => 32768

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUseDigest => 65536

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUseNegotiate => 131072

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUseBasic => 262144

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUseKerberos => 524288

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagNoEncryption => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUseClientCertificate => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagEnableSPNServerPort => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUTF16 => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUseCredSsp => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagSkipRevocationCheck => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagAllowNegotiateImplicitCredentials => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagUseSsl => 134217728
}
