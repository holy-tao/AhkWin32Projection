#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the size, in bytes, and the offset of a block of biometric information.
 * @remarks
 * The use of offsets rather than pointers allows for easy serialization of the BIR and for less complicated translation between 32 and 64-bit environments or between user and kernel mode.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bir-data
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_BIR_DATA {
    #StructPack 4

    /**
     * Size, in bytes, of the biometric information.
     */
    Size : UInt32

    /**
     * Offset, in bytes from the beginning of the [**WINBIO\_BIR**](winbio-bir.md) structure, of the biometric information.
     */
    Offset : UInt32

}
