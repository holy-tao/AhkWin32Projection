#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the capabilities and enrollment requirements of the storage adapter for a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-storage-info
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EXTENDED_STORAGE_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The generic capabilities of the storage component that is connected to a specific biometric unit.
     * @type {Integer}
     */
    GenericStorageCapabilities {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the storage adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the **WINBIO\_EXTENDED\_STORAGE\_INFO** structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Null {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FacialFeatures {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Fingerprint {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Iris {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Voice {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
