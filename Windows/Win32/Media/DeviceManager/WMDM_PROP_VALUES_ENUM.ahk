#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMDM\_PROP\_VALUES\_ENUM structure contains an enumerated set of valid values for a particular property in a particular property configuration.
 * @remarks
 * This structure is used in the **WMDM\_PROP\_DESC** structure to describe an enumerated set of valid values. An enumerated set of valid values is applicable when WMDM\_ENUM\_PROP\_VALID\_VALUES\_ENUM is selected from the **WMDM\_ENUM\_PROP\_VALID\_VALUES\_FORM** enumeration.
  * 
  * The caller is required to free the memory used by **pValues**. For an example of how to do this, see [**WMDM\_FORMAT\_CAPABILITY**](wmdm-format-capability.md).
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-prop-values-enum
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_PROP_VALUES_ENUM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Count of enumerated values.
     * @type {Integer}
     */
    cEnumValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of values. The size of the array is equal to the value of **cEnumValues**.
     * @type {Pointer<PROPVARIANT>}
     */
    pValues {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
