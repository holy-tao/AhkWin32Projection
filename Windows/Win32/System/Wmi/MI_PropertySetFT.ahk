#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_PropertySet structure. Use the functions with the name prefix &quot;MI_PropertySet_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_propertysetft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_PropertySetFT {
    #StructPack 8

    /**
     * Gets the number of elements in the specified property set. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_getelementcount">MI_PropertySet_GetElementCount</a>.
     */
    GetElementCount : IntPtr

    /**
     * Determines whether the property list contains the specified property. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_containselement">MI_PropertySet_ContainsElement</a>.
     */
    ContainsElement : IntPtr

    /**
     * Adds a name to the property list. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_addelement">MI_PropertySet_AddElement</a>.
     */
    AddElement : IntPtr

    /**
     * Gets the element of a property set at the specified index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_getelementat">MI_PropertySet_GetElementAt</a>.
     */
    GetElementAt : IntPtr

    /**
     * Removes all names from the property list. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_clear">MI_PropertySet_Clear</a>.
     */
    Clear : IntPtr

    /**
     * Deletes the specified property list that was constructed on the stack. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_destruct">MI_PropertySet_Destruct</a>.
     */
    Destruct : IntPtr

    /**
     * Deletes the specified property list that was constructed on the heap. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_delete">MI_PropertySet_Delete</a>.
     */
    Delete : IntPtr

    /**
     * Creates a copy of the specified property set on the heap. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_clone">MI_PropertySet_Clone</a>.
     */
    Clone : IntPtr

}
