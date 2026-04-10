#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Tpm
 */
class TPMVSC_ATTESTATION_TYPE extends Win32Enum {

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
