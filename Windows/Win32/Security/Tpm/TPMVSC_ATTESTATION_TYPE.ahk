#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Tpm
 * @version v4.0.30319
 */
class TPMVSC_ATTESTATION_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static TPMVSC_ATTESTATION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TPMVSC_ATTESTATION_AIK_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static TPMVSC_ATTESTATION_AIK_AND_CERTIFICATE => 2
}
