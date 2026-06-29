#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct X509SCEPMessageType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
