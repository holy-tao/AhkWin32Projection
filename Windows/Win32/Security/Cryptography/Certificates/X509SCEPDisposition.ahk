#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the resulting disposition of a request to process a response message.
 * @see https://learn.microsoft.com/windows/win32/api/certpol/ne-certpol-x509scepdisposition
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct X509SCEPDisposition {
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
    static SCEPDispositionUnknown => -1

    /**
     * The request was successful.
     * @type {Integer (Int32)}
     */
    static SCEPDispositionSuccess => 0

    /**
     * The request failed.
     * @type {Integer (Int32)}
     */
    static SCEPDispositionFailure => 2

    /**
     * The request has not completed yet.
     * @type {Integer (Int32)}
     */
    static SCEPDispositionPending => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCEPDispositionPendingChallenge => 11
}
