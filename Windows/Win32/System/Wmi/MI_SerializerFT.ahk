#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_ClientFT_V1 structure. Use the functions with the name prefix &quot;MI_Serializer_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_serializerft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_SerializerFT {
    #StructPack 8

    /**
     * Closes a serializer object and frees any internal memory associated with it. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_serializer_close">MI_Serializer_Close</a>.
     */
    Close : IntPtr

    /**
     * Serializes an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> into a buffer in the format 
     *        specified when it was created. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_serializer_serializeclass">MI_Serializer_SerializeClass</a>.
     */
    SerializeClass : IntPtr

    /**
     * Serializes an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> into a buffer in the 
     *        format specified when the serializer was created. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_serializer_serializeinstance">MI_Serializer_SerializeInstance</a>.
     */
    SerializeInstance : IntPtr

}
