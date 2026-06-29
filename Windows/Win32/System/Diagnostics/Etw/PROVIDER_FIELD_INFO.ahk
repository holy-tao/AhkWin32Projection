#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the field information.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-provider_field_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PROVIDER_FIELD_INFO {
    #StructPack 8

    /**
     * Offset to the null-terminated Unicode string that contains the name of the field, in English only.
     */
    NameOffset : UInt32

    /**
     * Offset to the null-terminated Unicode string that contains the localized description of the field. The value is zero if the description does not exist.
     */
    DescriptionOffset : UInt32

    /**
     * Field value.
     */
    Value : Int64

}
