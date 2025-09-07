#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * SILO_INFO structure contains information that identifies and describes the silo.
 * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/ns-ehstorapi-silo_info
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class SILO_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Silo Type Identifier for the silo assigned by IEEE 1667 Working Group.
     * @type {Integer}
     */
    ulSTID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Major version of the specification implemented in the silo.
     * @type {Integer}
     */
    SpecificationMajor {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Minor version of the specification implemented in the silo.
     * @type {Integer}
     */
    SpecificationMinor {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Major version of the firmware implemented in the silo.
     * @type {Integer}
     */
    ImplementationMajor {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * Minor version of the firmware implemented in the silo.
     * @type {Integer}
     */
    ImplementationMinor {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * Type of the silo.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Capabilities of the silo.
     * @type {Integer}
     */
    capabilities {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }
}
