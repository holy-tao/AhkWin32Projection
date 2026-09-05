#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Lists the possible sources of policy information for the detection of spoofing for biometric factors.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-policy-source
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_POLICY_SOURCE extends Win32Enum {

    /**
     * Native name: WINBIO_POLICY_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: WINBIO_POLICY_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * Native name: WINBIO_POLICY_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 2

    /**
     * Native name: WINBIO_POLICY_ADMIN
     * @type {Integer (Int32)}
     */
    static ADMIN => 3
}
