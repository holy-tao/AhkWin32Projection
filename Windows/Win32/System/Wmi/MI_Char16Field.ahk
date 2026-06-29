#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a property inside an MI_Instance structure. (MI_Char16Field)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_char16field
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Char16Field {
    #StructPack 2

    /**
     * A field of type <b>MI_Char16</b>.
     */
    value : UInt16

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
