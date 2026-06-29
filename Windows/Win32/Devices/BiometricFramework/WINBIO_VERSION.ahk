#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the software version number of a biometric service provider component.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-version
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_VERSION {
    #StructPack 4

    /**
     * A **DWORD** that contains the major version number.
     */
    MajorVersion : UInt32

    /**
     * A **DWORD** that contains the minor version number.
     */
    MinorVersion : UInt32

}
