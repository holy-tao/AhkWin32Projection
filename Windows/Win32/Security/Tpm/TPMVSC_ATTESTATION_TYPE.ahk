#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Tpm
 */
class TPMVSC_ATTESTATION_TYPE extends Win32Enum {

    /**
     * Native name: TPMVSC_ATTESTATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: TPMVSC_ATTESTATION_AIK_ONLY
     * @type {Integer (Int32)}
     */
    static AIK_ONLY => 1

    /**
     * Native name: TPMVSC_ATTESTATION_AIK_AND_CERTIFICATE
     * @type {Integer (Int32)}
     */
    static AIK_AND_CERTIFICATE => 2
}
