#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specify the type of biometric unit pool to be used in the session.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-pool-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_POOL extends Win32Enum {

    /**
     * Native name: WINBIO_POOL_SYSTEM
     * @type {Integer (UInt32)}
     */
    static SYSTEM => 1

    /**
     * Native name: WINBIO_POOL_PRIVATE
     * @type {Integer (UInt32)}
     */
    static PRIVATE => 2
}
