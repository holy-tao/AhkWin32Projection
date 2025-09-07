#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_BIR_DATA.ahk

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
 * @version v4.0.30319
 */
class WINBIO_BIR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A [**WINBIO\_BIR\_DATA**](winbio-bir-data.md) structure that contains the size, in bytes, and offset of the BIR header. The header contains information that describes the contents of the information record.
     * @type {WINBIO_BIR_DATA}
     */
    HeaderBlock{
        get {
            if(!this.HasProp("__HeaderBlock"))
                this.__HeaderBlock := WINBIO_BIR_DATA(this.ptr + 0)
            return this.__HeaderBlock
        }
    }

    /**
     * A [**WINBIO\_BIR\_DATA**](winbio-bir-data.md) structure that contains the size, in bytes, and offset of processed or unprocessed biometric information created by the Windows Biometric Framework (WBF).
     * @type {WINBIO_BIR_DATA}
     */
    StandardDataBlock{
        get {
            if(!this.HasProp("__StandardDataBlock"))
                this.__StandardDataBlock := WINBIO_BIR_DATA(this.ptr + 8)
            return this.__StandardDataBlock
        }
    }

    /**
     * A [**WINBIO\_BIR\_DATA**](winbio-bir-data.md) structure that contains the size, in bytes, and offset of processed or unprocessed biometric information provided by vendor sensors and software.
     * @type {WINBIO_BIR_DATA}
     */
    VendorDataBlock{
        get {
            if(!this.HasProp("__VendorDataBlock"))
                this.__VendorDataBlock := WINBIO_BIR_DATA(this.ptr + 16)
            return this.__VendorDataBlock
        }
    }

    /**
     * An optional [**WINBIO\_BIR\_DATA**](winbio-bir-data.md) structure that contains the size, in bytes, and offset of the digital signature message authentication code (MAC) that can be used to verify the integrity of the BIR. If present, the signature or MAC must cover the header and data blocks.
     * @type {WINBIO_BIR_DATA}
     */
    SignatureBlock{
        get {
            if(!this.HasProp("__SignatureBlock"))
                this.__SignatureBlock := WINBIO_BIR_DATA(this.ptr + 24)
            return this.__SignatureBlock
        }
    }
}
