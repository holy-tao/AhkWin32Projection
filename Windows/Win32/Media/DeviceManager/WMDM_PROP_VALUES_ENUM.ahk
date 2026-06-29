#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }

/**
 * The WMDM\_PROP\_VALUES\_ENUM structure contains an enumerated set of valid values for a particular property in a particular property configuration.
 * @remarks
 * This structure is used in the **WMDM\_PROP\_DESC** structure to describe an enumerated set of valid values. An enumerated set of valid values is applicable when WMDM\_ENUM\_PROP\_VALID\_VALUES\_ENUM is selected from the **WMDM\_ENUM\_PROP\_VALID\_VALUES\_FORM** enumeration.
 * 
 * The caller is required to free the memory used by **pValues**. For an example of how to do this, see [**WMDM\_FORMAT\_CAPABILITY**](wmdm-format-capability.md).
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-prop-values-enum
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_PROP_VALUES_ENUM {
    #StructPack 8

    /**
     * Count of enumerated values.
     */
    cEnumValues : UInt32

    /**
     * Pointer to an array of values. The size of the array is equal to the value of **cEnumValues**.
     */
    pValues : PROPVARIANT.Ptr

}
