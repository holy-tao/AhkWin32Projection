#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_Class structure. Use the functions with the name prefix &quot;MI_Class_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_classft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ClassFT {
    #StructPack 8

    GetClassNameA : IntPtr

    /**
     * Retrieves the namespace of the class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getnamespace">MI_Class_GetNameSpace</a>.
     */
    GetNameSpace : IntPtr

    /**
     * Retrieves the server name of the class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getservername">MI_Class_GetServerName</a> .
     */
    GetServerName : IntPtr

    /**
     * Retrieves the number of elements in a class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getelementcount">MI_Class_GetElementCount</a> .
     */
    GetElementCount : IntPtr

    /**
     * Retrieves information about a named class element. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getelement">MI_Class_GetElement</a>.
     */
    GetElement : IntPtr

    /**
     * Retrieves information about a specific class element given the element index (Indexes start from 0). See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getelementat">MI_Class_GetElementAt</a>.
     */
    GetElementAt : IntPtr

    /**
     * Retrieve an object from a class that allows the class qualifiers to be queried. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getclassqualifierset">MI_Class_GetClassQualifierSet</a>.
     */
    GetClassQualifierSet : IntPtr

    /**
     * Retrieves the number of class methods. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getmethodcount">MI_Class_GetMethodCount</a>.
     */
    GetMethodCount : IntPtr

    /**
     * Get method information based on a method index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getmethodat">MI_Class_GetMethodAt</a>.
     */
    GetMethodAt : IntPtr

    /**
     * Get method information based on a method name. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getmethod">MI_Class_GetMethod</a>.
     */
    GetMethod : IntPtr

    /**
     * Get the parent class name of the class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getparentclassname">MI_Class_GetParentClassName</a>.
     */
    GetParentClassName : IntPtr

    /**
     * Get the parent class for the specified class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getparentclass">MI_Class_GetParentClass</a>.
     */
    GetParentClass : IntPtr

    /**
     * Delete an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_delete">MI_Class_Delete</a>.
     */
    Delete : IntPtr

    /**
     * Clones an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_clone">MI_Class_Clone</a>.
     */
    Clone : IntPtr

}
