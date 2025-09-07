#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_VERSION.ahk

/**
 * Describes the capabilities of a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-unit-schema
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_UNIT_SCHEMA extends Win32Struct
{
    static sizeof => 2592

    static packingSize => 8

    /**
     * A value that identifies the biometric unit.
     * @type {Integer}
     */
    UnitId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    PoolType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value that specifies the type of the biometric unit. Only **WINBIO\_TYPE\_FINGERPRINT** is currently supported.
     * @type {Integer}
     */
    BiometricFactor {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A sensor subtype defined for the biometric type specified by the **BiometricFactor** member. Only fingerprint types (**WINBIO\_TYPE\_FINGERPRINT**) are currently supported. The following subtypes are currently defined for fingerprints:
     * 
     * -   WINBIO\_SENSOR\_SUBTYPE\_UNKNOWN
     * -   WINBIO\_FP\_SENSOR\_SUBTYPE\_SWIPE
     * -   WINBIO\_FP\_SENSOR\_SUBTYPE\_TOUCH
     * @type {Integer}
     */
    SensorSubType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

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
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A string value that contains the device ID. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     * @type {Array<UInt16>}
     */
    DeviceInstanceId{
        get {
            if(!this.HasProp("__DeviceInstanceIdProxyArray"))
                this.__DeviceInstanceIdProxyArray := Win32FixedArray(this.ptr + 20, 2, Primitive, "ushort")
            return this.__DeviceInstanceIdProxyArray
        }
    }

    /**
     * A string value that contains a description of the biometric unit. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     * @type {Array<UInt16>}
     */
    Description{
        get {
            if(!this.HasProp("__DescriptionProxyArray"))
                this.__DescriptionProxyArray := Win32FixedArray(this.ptr + 532, 2, Primitive, "ushort")
            return this.__DescriptionProxyArray
        }
    }

    /**
     * A string value that contains the name of the manufacturer. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     * @type {Array<UInt16>}
     */
    Manufacturer{
        get {
            if(!this.HasProp("__ManufacturerProxyArray"))
                this.__ManufacturerProxyArray := Win32FixedArray(this.ptr + 1044, 2, Primitive, "ushort")
            return this.__ManufacturerProxyArray
        }
    }

    /**
     * A string value that contains the model number of the biometric unit. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     * @type {Array<UInt16>}
     */
    Model{
        get {
            if(!this.HasProp("__ModelProxyArray"))
                this.__ModelProxyArray := Win32FixedArray(this.ptr + 1556, 2, Primitive, "ushort")
            return this.__ModelProxyArray
        }
    }

    /**
     * A **NULL**-terminated Unicode string that contains the serial number of the biometric unit. The string can contain up to 256 Unicode characters including a terminating **NULL** character.
     * @type {Array<UInt16>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 2068, 2, Primitive, "ushort")
            return this.__SerialNumberProxyArray
        }
    }

    /**
     * A [**WINBIO\_VERSION**](winbio-version.md) structure that contains the major and minor version numbers for the biometric unit.
     * @type {WINBIO_VERSION}
     */
    FirmwareVersion{
        get {
            if(!this.HasProp("__FirmwareVersion"))
                this.__FirmwareVersion := WINBIO_VERSION(this.ptr + 2584)
            return this.__FirmwareVersion
        }
    }
}
