#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the storage location of a certificate that is used in signing.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_certificate_embedding_option
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct OPC_CERTIFICATE_EMBEDDING_OPTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The certificate is stored in a part specific to the certificate.
     * @type {Integer (Int32)}
     */
    static OPC_CERTIFICATE_IN_CERTIFICATE_PART => 0

    /**
     * The certificate is encoded within the signature markup in the Signature part.
     * @type {Integer (Int32)}
     */
    static OPC_CERTIFICATE_IN_SIGNATURE_PART => 1

    /**
     * The certificate is not stored in the package.
     * 
     * <div class="alert"><b>Important</b>  The certificate is contextual and understood between the signer and the verifier.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static OPC_CERTIFICATE_NOT_EMBEDDED => 2
}
