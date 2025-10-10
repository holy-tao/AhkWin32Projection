#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_PropertySet structure. Use the functions with the name prefix &quot;MI_PropertySet_&quot; to manipulate these structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_propertysetft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_PropertySetFT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Gets the number of elements in the specified property set. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_getelementcount">MI_PropertySet_GetElementCount</a>.
     * @type {Pointer}
     */
    GetElementCount {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Determines whether the property list contains the specified property. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_containselement">MI_PropertySet_ContainsElement</a>.
     * @type {Pointer}
     */
    ContainsElement {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Adds a name to the property list. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_addelement">MI_PropertySet_AddElement</a>.
     * @type {Pointer}
     */
    AddElement {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Gets the element of a property set at the specified index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_getelementat">MI_PropertySet_GetElementAt</a>.
     * @type {Pointer}
     */
    GetElementAt {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Removes all names from the property list. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_clear">MI_PropertySet_Clear</a>.
     * @type {Pointer}
     */
    Clear {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Deletes the specified property list that was constructed on the stack. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_destruct">MI_PropertySet_Destruct</a>.
     * @type {Pointer}
     */
    Destruct {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Deletes the specified property list that was constructed on the heap. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_delete">MI_PropertySet_Delete</a>.
     * @type {Pointer}
     */
    Delete {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Creates a copy of the specified property set on the heap. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_propertyset_clone">MI_PropertySet_Clone</a>.
     * @type {Pointer}
     */
    Clone {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
