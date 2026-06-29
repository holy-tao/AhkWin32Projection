#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Deserialization object as created from MI_Application_NewDeserializer. The object itself should not be manually used or changed as it is used internally.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_deserializer
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Deserializer {
    #StructPack 8

    /**
     * Reserved for internal use.
     */
    reserved1 : Int64

    /**
     * Reserved for internal use.
     */
    reserved2 : IntPtr

}
