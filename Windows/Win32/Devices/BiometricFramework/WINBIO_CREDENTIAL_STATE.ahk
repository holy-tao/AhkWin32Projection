#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that specify whether a credential has been associated with the biometric data for an end user.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-state
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_CREDENTIAL_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_CREDENTIAL_NOT_SET => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_CREDENTIAL_SET => 2
}
