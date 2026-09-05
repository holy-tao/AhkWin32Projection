#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that specify whether a credential has been associated with the biometric data for an end user.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-state
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_CREDENTIAL_STATE extends Win32Enum {

    /**
     * Native name: WINBIO_CREDENTIAL_NOT_SET
     * @type {Integer (Int32)}
     */
    static NOT_SET => 1

    /**
     * Native name: WINBIO_CREDENTIAL_SET
     * @type {Integer (Int32)}
     */
    static SET => 2
}
