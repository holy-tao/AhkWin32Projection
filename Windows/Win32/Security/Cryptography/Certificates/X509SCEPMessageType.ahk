#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509SCEPMessageType extends Win32Enum {

    /**
     * Native name: SCEPMessageUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * Native name: SCEPMessageCertResponse
     * @type {Integer (Int32)}
     */
    static CertResponse => 3

    /**
     * Native name: SCEPMessagePKCSRequest
     * @type {Integer (Int32)}
     */
    static MessagePKCSRequest => 19

    /**
     * Native name: SCEPMessageGetCertInitial
     * @type {Integer (Int32)}
     */
    static GetCertInitial => 20

    /**
     * Native name: SCEPMessageGetCert
     * @type {Integer (Int32)}
     */
    static GetCert => 21

    /**
     * Native name: SCEPMessageGetCRL
     * @type {Integer (Int32)}
     */
    static GetCRL => 22

    /**
     * Native name: SCEPMessageClaimChallengeAnswer
     * @type {Integer (Int32)}
     */
    static ClaimChallengeAnswer => 41
}
