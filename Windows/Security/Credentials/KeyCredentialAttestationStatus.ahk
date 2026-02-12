#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents key credential attestation statuses.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialattestationstatus
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialAttestationStatus extends Win32Enum{

    /**
     * The operation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The operation encountered an unknown error.
     * @type {Integer (Int32)}
     */
    static UnknownError => 1

    /**
     * The operation was not supported.
     * @type {Integer (Int32)}
     */
    static NotSupported => 2

    /**
     * The operation temporarily failed.
     * @type {Integer (Int32)}
     */
    static TemporaryFailure => 3
}
