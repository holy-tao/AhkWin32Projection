#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the software version number of a biometric service provider component.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-version
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_VERSION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A **DWORD** that contains the major version number.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A **DWORD** that contains the minor version number.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
