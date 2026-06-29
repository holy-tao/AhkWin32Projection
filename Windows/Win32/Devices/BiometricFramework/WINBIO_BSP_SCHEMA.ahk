#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_VERSION.ahk" { WINBIO_VERSION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes the capabilities of a biometric service provider.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bsp-schema
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_BSP_SCHEMA {
    #StructPack 4

    /**
     * The type of biometric measurement used by this device. Currently this must be **WINBIO\_TYPE\_FINGERPRINT**.
     */
    BiometricFactor : UInt32

    /**
     * A value that uniquely identifies this biometric service provider component.
     */
    BspId : Guid

    /**
     * A **NULL**-terminated Unicode string that contains a description of the biometric service provider.
     */
    Description : UInt16[256]

    /**
     * A **NULL**-terminated Unicode string that contains the name of the vendor supplying the biometric service provider.
     */
    Vendor : UInt16[256]

    /**
     * A [**WINBIO\_VERSION**](winbio-version.md) structure the contains the software version of the biometric service provider component.
     */
    Version : WINBIO_VERSION

}
