#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct X509SCEPProcessMessageFlags {
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
    static SCEPProcessDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCEPProcessSkipCertInstall => 1
}
