#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a property inside an MI_Instance structure. (MI_Real32Field)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_real32field
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Real32Field {
    #StructPack 4

    /**
     * A field of type <b>MI_Real32</b>.
     */
    value : Float32

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
