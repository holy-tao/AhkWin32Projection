#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509SCEPMessageType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCEPMessageUnknown => -1

    /**
     * @type {Integer (Int32)}
     */
    static SCEPMessageCertResponse => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCEPMessagePKCSRequest => 19

    /**
     * @type {Integer (Int32)}
     */
    static SCEPMessageGetCertInitial => 20

    /**
     * @type {Integer (Int32)}
     */
    static SCEPMessageGetCert => 21

    /**
     * @type {Integer (Int32)}
     */
    static SCEPMessageGetCRL => 22

    /**
     * @type {Integer (Int32)}
     */
    static SCEPMessageClaimChallengeAnswer => 41
}
