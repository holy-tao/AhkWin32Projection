#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_Instance structure. Use the functions with the name prefix MI_Instance_ to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_instanceft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_InstanceFT {
    #StructPack 8

    /**
     * Creates a copy of the specified instance on the heap. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_clone">MI_Instance_Clone</a>.
     */
    Clone : IntPtr

    /**
     * Deletes an instance that was created on the stack. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_destruct">MI_Instance_Destruct</a>.
     */
    Destruct : IntPtr

    /**
     * Deletes an instance that was created on the heap. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_delete">MI_Instance_Delete</a>.
     */
    Delete : IntPtr

    /**
     * Determines if the instance self is an instance of the class given by classDecl. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_isa">MI_Instance_IsA</a>.
     */
    IsA : IntPtr

    GetClassNameA : IntPtr

    /**
     * Sets the namespace name of the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_setnamespace">MI_Instance_SetNameSpace</a>.
     */
    SetNameSpace : IntPtr

    /**
     * Gets the namespace name of the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getnamespace">MI_Instance_GetNameSpace</a>.
     */
    GetNameSpace : IntPtr

    /**
     * Gets the number of elements in an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getelementcount">MI_Instance_GetElementCount</a>.
     */
    GetElementCount : IntPtr

    /**
     * Adds a new property to a dynamic instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_addelement">MI_Instance_AddElement</a>.
     */
    AddElement : IntPtr

    /**
     * Set the value of the property with the given name in the given instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_setelement">MI_Instance_SetElement</a>.
     */
    SetElement : IntPtr

    /**
     * Set the value of the property at the given index of an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_setelementat">MI_Instance_SetElementAt</a>.
     */
    SetElementAt : IntPtr

    /**
     * Gets the value of the named element (CIM property). See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getelement">MI_Instance_GetElement</a>.
     */
    GetElement : IntPtr

    /**
     * Gets the value of the element (CIM property) at the specified index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getelementat">MI_Instance_GetElementAt</a>.
     */
    GetElementAt : IntPtr

    /**
     * Clears the value of the named element (CIM property) and sets it to Null. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_clearelement">MI_Instance_ClearElement</a>.
     */
    ClearElement : IntPtr

    /**
     * Clears the value of the element (CIM property) at the specified index and sets it to Null. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_clearelementat">MI_Instance_ClearElementAt</a>.
     */
    ClearElementAt : IntPtr

    /**
     * Gets the server name from the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getservername">MI_Instance_GetServerName</a>.
     */
    GetServerName : IntPtr

    /**
     * Sets the server name of the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_setservername">MI_Instance_SetServerName</a>.
     */
    SetServerName : IntPtr

    /**
     * Gets the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> associated with an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getclass">MI_Instance_GetClass</a>.
     */
    GetClass : IntPtr

}
