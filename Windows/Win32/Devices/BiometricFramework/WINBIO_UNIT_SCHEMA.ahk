#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_VERSION.ahk" { WINBIO_VERSION }

/**
 * Describes the capabilities of a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-unit-schema
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_UNIT_SCHEMA {
    #StructPack 4

    /**
     * A value that identifies the biometric unit.
     */
    UnitId : UInt32

    /**
     * A **ULONG** value that specifies the type of the biometric unit. This can be one of the following values:
     * 
     * 
     * 
     * | Value                                                                                                                                                                            | Meaning                                                                                                    |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
     * | <span id="WINBIO_POOL_UNKNOWN"></span><span id="winbio_pool_unknown"></span><dl> <dt>**WINBIO\_POOL\_UNKNOWN**</dt> </dl> | The type is unknown.<br/>                                                                            |
     * | <span id="WINBIO_POOL_SYSTEM"></span><span id="winbio_pool_system"></span><dl> <dt>**WINBIO\_POOL\_SYSTEM**</dt> </dl>    | The session connects to a shared collection of biometric units managed by the service provider.<br/> |
     * | <span id="WINBIO_POOL_PRIVATE"></span><span id="winbio_pool_private"></span><dl> <dt>**WINBIO\_POOL\_PRIVATE**</dt> </dl> | The session connects to a collection of biometric units that are managed by the caller.<br/>         |
     */
    PoolType : UInt32

    /**
     * A value that specifies the type of the biometric unit. Only **WINBIO\_TYPE\_FINGERPRINT** is currently supported.
     */
    BiometricFactor : UInt32

    /**
     * A sensor subtype defined for the biometric type specified by the **BiometricFactor** member. Only fingerprint types (**WINBIO\_TYPE\_FINGERPRINT**) are currently supported. The following subtypes are currently defined for fingerprints:
     * 
     * -   WINBIO\_SENSOR\_SUBTYPE\_UNKNOWN
     * -   WINBIO\_FP\_SENSOR\_SUBTYPE\_SWIPE
     * -   WINBIO\_FP\_SENSOR\_SUBTYPE\_TOUCH
     */
    SensorSubType : UInt32

    /**
     * A bitmask of the biometric sensor capabilities. This can be a bitwise **OR** of the following values:
     * 
     * -   WINBIO\_CAPABILITY\_SENSOR
     * -   WINBIO\_CAPABILITY\_MATCHING
     * -   WINBIO\_CAPABILITY\_DATABASE
     * -   WINBIO\_CAPABILITY\_PROCESSING
     * -   WINBIO\_CAPABILITY\_ENCRYPTION
     * -   WINBIO\_CAPABILITY\_NAVIGATION
     * -   WINBIO\_CAPABILITY\_INDICATOR
     * -   WINBIO\_CAPABILITY\_VIRTUAL\_SENSOR
     *     > [!Note]  
     *     > The **WINBIO\_CAPABILITY\_VIRTUAL\_SENSOR** constant applies only for Windows 10 and later.
     */
    Capabilities : UInt32

    /**
     * A string value that contains the device ID. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     */
    DeviceInstanceId : UInt16[256]

    /**
     * A string value that contains a description of the biometric unit. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     */
    Description : UInt16[256]

    /**
     * A string value that contains the name of the manufacturer. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     */
    Manufacturer : UInt16[256]

    /**
     * A string value that contains the model number of the biometric unit. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     */
    Model : UInt16[256]

    /**
     * A **NULL**-terminated Unicode string that contains the serial number of the biometric unit. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     */
    SerialNumber : UInt16[256]

    /**
     * A [**WINBIO\_VERSION**](winbio-version.md) structure that contains the major and minor version numbers for the biometric unit.
     */
    FirmwareVersion : WINBIO_VERSION

}
