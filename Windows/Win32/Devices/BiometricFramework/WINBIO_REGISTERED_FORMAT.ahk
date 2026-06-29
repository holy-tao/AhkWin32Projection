#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct WINBIO_REGISTERED_FORMAT {
    #StructPack 2

    /**
     * An IBIA (International Biometric Industry Association) assigned owner value.
     */
    Owner : UInt16

    /**
     * An owner assigned format.
     */
    Type : UInt16

}
