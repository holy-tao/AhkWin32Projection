#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the attestation status of a key.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptographickeyattestationstatus
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptographicKeyAttestationStatus extends Win32Enum{

    /**
     * The key has no attestation.
     * @type {Integer (Int32)}
     */
    static NoAttestation => 0

    /**
     * The key is a software key on a device without a TPM.
     * @type {Integer (Int32)}
     */
    static SoftwareKeyWithoutTpm => 1

    /**
     * The key is a software key on a device with a TPM.
     * @type {Integer (Int32)}
     */
    static SoftwareKeyWithTpm => 2

    /**
     * The TPM supporting the key has an unknown attestation status.
     * @type {Integer (Int32)}
     */
    static TpmKeyUnknownAttestationStatus => 3

    /**
     * The key is a TPM key on a device that does not have the ability to provide attestation.
     * @type {Integer (Int32)}
     */
    static TpmKeyWithoutAttestationCapability => 4

    /**
     * The key is a TPM key with a temporary attestation failure.
     * @type {Integer (Int32)}
     */
    static TpmKeyWithTemporaryAttestationFailure => 5

    /**
     * The key is a TPM key with a long term attestation failure.
     * @type {Integer (Int32)}
     */
    static TpmKeyWithLongTermAttestationFailure => 6

    /**
     * The key is a TPM key with attestation.
     * @type {Integer (Int32)}
     */
    static TpmKeyWithAttestation => 7
}
