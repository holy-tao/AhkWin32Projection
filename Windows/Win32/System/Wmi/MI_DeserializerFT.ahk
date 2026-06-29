#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_ClientFT_V1 structure. Use the functions with the name prefix &quot;MI_Deserializer_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_deserializerft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_DeserializerFT {
    #StructPack 8

    /**
     * Deletes the deserializer object and its associated memory. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_close">MI_Deserializer_Close</a>.
     */
    Close : IntPtr

    /**
     * Deserializes a serialized buffer into an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> 
     *        object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_deserializeclass">MI_Deserializer_DeserializeClass</a>.
     */
    DeserializeClass : IntPtr

    /**
     * Gets the class name from a serialized class buffer. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_class_getclassname">MI_Deserializer_Class_GetClassName</a>.
     */
    Class_GetClassName : IntPtr

    /**
     * Gets the parent class name from a serialized class buffer. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_class_getparentclassname">MI_Deserializer_Class_GetParentClassName</a>.
     */
    Class_GetParentClassName : IntPtr

    /**
     * Deserializes a serialized buffer into a 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_deserializeinstance">MI_Deserializer_DeserializeInstance</a>.
     */
    DeserializeInstance : IntPtr

    /**
     * Gets the class name of the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getclassname">MI_Instance_GetClassName</a>.
     */
    Instance_GetClassName : IntPtr

}
