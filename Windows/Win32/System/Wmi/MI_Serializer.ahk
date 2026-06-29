#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An object tied to a specific serialization technique.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_serializer
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Serializer {
    #StructPack 8

    /**
     * Reserved for internals use.
     */
    reserved1 : Int64

    /**
     * Reserved for internals use.
     */
    reserved2 : IntPtr

}
