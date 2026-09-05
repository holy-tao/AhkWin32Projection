#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
class WSManSessionFlags extends Win32Enum {

    /**
     * Native name: WSManFlagUTF8
     * @type {Integer (Int32)}
     */
    static FlagUTF8 => 1

    /**
     * Native name: WSManFlagCredUsernamePassword
     * @type {Integer (Int32)}
     */
    static FlagCredUsernamePassword => 4096

    /**
     * Native name: WSManFlagSkipCACheck
     * @type {Integer (Int32)}
     */
    static FlagSkipCACheck => 8192

    /**
     * Native name: WSManFlagSkipCNCheck
     * @type {Integer (Int32)}
     */
    static FlagSkipCNCheck => 16384

    /**
     * Native name: WSManFlagUseNoAuthentication
     * @type {Integer (Int32)}
     */
    static FlagUseNoAuthentication => 32768

    /**
     * Native name: WSManFlagUseDigest
     * @type {Integer (Int32)}
     */
    static FlagUseDigest => 65536

    /**
     * Native name: WSManFlagUseNegotiate
     * @type {Integer (Int32)}
     */
    static FlagUseNegotiate => 131072

    /**
     * Native name: WSManFlagUseBasic
     * @type {Integer (Int32)}
     */
    static FlagUseBasic => 262144

    /**
     * Native name: WSManFlagUseKerberos
     * @type {Integer (Int32)}
     */
    static FlagUseKerberos => 524288

    /**
     * Native name: WSManFlagNoEncryption
     * @type {Integer (Int32)}
     */
    static FlagNoEncryption => 1048576

    /**
     * Native name: WSManFlagUseClientCertificate
     * @type {Integer (Int32)}
     */
    static FlagUseClientCertificate => 2097152

    /**
     * Native name: WSManFlagEnableSPNServerPort
     * @type {Integer (Int32)}
     */
    static FlagEnableSPNServerPort => 4194304

    /**
     * Native name: WSManFlagUTF16
     * @type {Integer (Int32)}
     */
    static FlagUTF16 => 8388608

    /**
     * Native name: WSManFlagUseCredSsp
     * @type {Integer (Int32)}
     */
    static FlagUseCredSsp => 16777216

    /**
     * Native name: WSManFlagSkipRevocationCheck
     * @type {Integer (Int32)}
     */
    static FlagSkipRevocationCheck => 33554432

    /**
     * Native name: WSManFlagAllowNegotiateImplicitCredentials
     * @type {Integer (Int32)}
     */
    static FlagAllowNegotiateImplicitCredentials => 67108864

    /**
     * Native name: WSManFlagUseSsl
     * @type {Integer (Int32)}
     */
    static FlagUseSsl => 134217728
}
