#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_BIR_DATA.ahk" { WINBIO_BIR_DATA }

/**
 * Represents a biometric information record (BIR).
 * @remarks
 * The use of offsets rather than pointers allows for easy serialization of the BIR and for less complicated translation between 32 and 64-bit environments or between user and kernel mode.
 * 
 * The BIR is compatible with the Common Biometric Exchange Format Framework (CBEFF) defined by NIST 6529-A.
 * 
 * If this structure contains a *StandardDataBlock* value, the *Type* parameter of the header specified by the *HeaderBlock* parameter must be set to **WINBIO\_ANSI\_381\_FORMAT\_TYPE**. This is the only standard data format supported by the current version of the Windows Biometric Framework.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bir
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_BIR {
    #StructPack 4

    /**
     * A [**WINBIO\_BIR\_DATA**](winbio-bir-data.md) structure that contains the size, in bytes, and offset of the BIR header. The header contains information that describes the contents of the information record.
     */
    HeaderBlock : WINBIO_BIR_DATA

    /**
     * A [**WINBIO\_BIR\_DATA**](winbio-bir-data.md) structure that contains the size, in bytes, and offset of processed or unprocessed biometric information created by the Windows Biometric Framework (WBF).
     */
    StandardDataBlock : WINBIO_BIR_DATA

    /**
     * A [**WINBIO\_BIR\_DATA**](winbio-bir-data.md) structure that contains the size, in bytes, and offset of processed or unprocessed biometric information provided by vendor sensors and software.
     */
    VendorDataBlock : WINBIO_BIR_DATA

    /**
     * An optional [**WINBIO\_BIR\_DATA**](winbio-bir-data.md) structure that contains the size, in bytes, and offset of the digital signature message authentication code (MAC) that can be used to verify the integrity of the BIR. If present, the signature or MAC must cover the header and data blocks.
     */
    SignatureBlock : WINBIO_BIR_DATA

}
