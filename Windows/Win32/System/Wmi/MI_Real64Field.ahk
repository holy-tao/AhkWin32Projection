#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a property inside an MI_Instance structure. (MI_Real64Field)
 * @remarks
 * This type cannot be a key. This differs from the DMTF CIM specification. For more information on keys, see <a href="https://docs.microsoft.com/windows/win32/wmisdk/key-qualifier">https://go.microsoft.com/fwlink/p/?linkid=259738</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_real64field
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Real64Field {
    #StructPack 8

    /**
     * A field of type <b>MI_Real64</b>.
     */
    value : Float64

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
