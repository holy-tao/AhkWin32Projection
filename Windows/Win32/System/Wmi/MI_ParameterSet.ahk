#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ParameterSetFT.ahk" { MI_ParameterSetFT }

/**
 * Holds the method parameters of a class definition.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_parameterset
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ParameterSet {
    #StructPack 8

    /**
     * Reserved for internal use.
     */
    reserved1 : Int64

    /**
     * Reserved for internal use.
     */
    reserved2 : IntPtr

    /**
     * This member is used internally, and it must not be changed.
     */
    ft : MI_ParameterSetFT.Ptr

}
