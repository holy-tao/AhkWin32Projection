#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specify the type of biometric unit pool to be used in the session.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-pool-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_POOL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_POOL_SYSTEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_POOL_PRIVATE => 2
}
