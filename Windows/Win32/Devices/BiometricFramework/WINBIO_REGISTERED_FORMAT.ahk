#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a registered data format as an owner/format pair.
 * @remarks
 * Because Windows currently supports only fingerprint readers, the following values should be used in the **WINBIO\_REGISTERED\_FORMAT** structure.
  * 
  * 
  * 
  * | Constant                                    | Meaning                                                                                                               |
  * |---------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
  * | WINBIO\_ANSI\_381\_FORMAT\_OWNER<br/> | InterNational Committee for Information Technology Standards (INCITS) technical committee M1 (biometrics).<br/> |
  * | WINBIO\_ANSI\_381\_FORMAT\_TYPE<br/>  | ANSI INCITS 381 finger image based data interchange format.<br/>                                                |
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-registered-format
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_REGISTERED_FORMAT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * An IBIA (International Biometric Industry Association) assigned owner value.
     * @type {Integer}
     */
    Owner {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * An owner assigned format.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
