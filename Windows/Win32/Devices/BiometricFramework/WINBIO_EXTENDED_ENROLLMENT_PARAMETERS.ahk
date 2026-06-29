#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains additional information that an engine adapter needs to create an enrollment template.
 * @remarks
 * The Windows Biometric Framework passes this structure to the [**EngineAdapterSetEnrollmentParameters**](/windows/desktop/api/Winbio_adapter/nc-winbio_adapter-pibio_engine_set_enrollment_parameters_fn) method during an enrollment operation.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-enrollment-parameters
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_EXTENDED_ENROLLMENT_PARAMETERS {
    #StructPack 8

    /**
     * The size (in bytes) of the **WINBIO\_EXTENDED\_ENROLLMENT\_PARAMETERS** structure.
     */
    Size : IntPtr

    /**
     * One of the [**WINBIO\_BIOMETRIC\_SUBTYPE Constants**](winbio-biometric-subtype-constants.md) values that provides additional information about the enrollment.
     */
    SubFactor : Int8

}
