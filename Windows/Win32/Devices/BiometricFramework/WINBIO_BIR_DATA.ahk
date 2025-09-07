#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the size, in bytes, and the offset of a block of biometric information.
 * @remarks
 * The use of offsets rather than pointers allows for easy serialization of the BIR and for less complicated translation between 32 and 64-bit environments or between user and kernel mode.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bir-data
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_BIR_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Size, in bytes, of the biometric information.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Offset, in bytes from the beginning of the [**WINBIO\_BIR**](winbio-bir.md) structure, of the biometric information.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
