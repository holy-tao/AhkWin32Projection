#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a property inside an MI_Instance structure. (MI_BooleanField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_booleanfield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_BooleanField {
    #StructPack 1

    /**
     * A field of type <b>MI_Boolean</b>.
     */
    value : Int8

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
