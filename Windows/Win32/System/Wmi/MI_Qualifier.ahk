#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a CIM qualifier.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_qualifier
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Qualifier {
    #StructPack 8

    /**
     * Name of this qualifier.
     */
    name : IntPtr

    /**
     * Type of this qualifier.
     */
    type : UInt32

    /**
     * Flavor of this qualifier.
     */
    flavor : UInt32

    /**
     * Value of this qualifier.
     */
    value : IntPtr

}
