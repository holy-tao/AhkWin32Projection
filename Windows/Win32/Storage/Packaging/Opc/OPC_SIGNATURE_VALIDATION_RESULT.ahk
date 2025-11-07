#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the status of the signature.
 * @see https://docs.microsoft.com/windows/win32/api//msopc/ne-msopc-opc_signature_validation_result
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class OPC_SIGNATURE_VALIDATION_RESULT{

    /**
     * The signature is valid.
     * 
     * Signature validation using the provided certificate succeeded; signed package components have not been altered.
     * 
     * <div class="alert"><b>Important</b>  Signature trust decisions must be based on the validity of the signature  as well as other format- and application-specific factors, including:  validation of the identity of the package originator, signing policy, certificate quality, and possibly the existence of a valid time stamp.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static OPC_SIGNATURE_VALID => 0

    /**
     * The signature is not valid.
     * 
     * Signature markup or signed package components might have been altered. Alternatively, the signature might not exist in the current package.
     * @type {Integer (Int32)}
     */
    static OPC_SIGNATURE_INVALID => -1
}
