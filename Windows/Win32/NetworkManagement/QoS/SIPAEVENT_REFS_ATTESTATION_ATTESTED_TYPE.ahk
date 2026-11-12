#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
class SIPAEVENT_REFS_ATTESTATION_ATTESTED_TYPE extends Win32BitflagEnum {

    /**
     * Native name: SIPAEVENT_REFS_ATTESTATION_ATTESTED_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SIPAEVENT_REFS_ATTESTATION_ATTESTED_TYPE_CERTIFICATE
     * @type {Integer (Int32)}
     */
    static CERTIFICATE => 1

    /**
     * Native name: SIPAEVENT_REFS_ATTESTATION_ATTESTED_TYPE_TPM
     * @type {Integer (Int32)}
     */
    static TPM => 2

    /**
     * Native name: SIPAEVENT_REFS_ATTESTATION_ATTESTED_TYPE_KEY_RING
     * @type {Integer (Int32)}
     */
    static KEY_RING => 4
}
