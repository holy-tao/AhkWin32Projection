#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_Instance structure. Use the functions with the name prefix MI_Instance_ to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_instanceft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_InstanceFT extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Creates a copy of the specified instance on the heap. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_clone">MI_Instance_Clone</a>.
     * @type {Pointer}
     */
    Clone {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Deletes an instance that was created on the stack. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_destruct">MI_Instance_Destruct</a>.
     * @type {Pointer}
     */
    Destruct {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Deletes an instance that was created on the heap. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_delete">MI_Instance_Delete</a>.
     * @type {Pointer}
     */
    Delete {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Determines if the instance self is an instance of the class given by classDecl. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_isa">MI_Instance_IsA</a>.
     * @type {Pointer}
     */
    IsA {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    GetClassNameA {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Sets the namespace name of the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_setnamespace">MI_Instance_SetNameSpace</a>.
     * @type {Pointer}
     */
    SetNameSpace {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Gets the namespace name of the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getnamespace">MI_Instance_GetNameSpace</a>.
     * @type {Pointer}
     */
    GetNameSpace {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Gets the number of elements in an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getelementcount">MI_Instance_GetElementCount</a>.
     * @type {Pointer}
     */
    GetElementCount {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Adds a new property to a dynamic instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_addelement">MI_Instance_AddElement</a>.
     * @type {Pointer}
     */
    AddElement {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Set the value of the property with the given name in the given instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_setelement">MI_Instance_SetElement</a>.
     * @type {Pointer}
     */
    SetElement {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Set the value of the property at the given index of an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_setelementat">MI_Instance_SetElementAt</a>.
     * @type {Pointer}
     */
    SetElementAt {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Gets the value of the named element (CIM property). See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getelement">MI_Instance_GetElement</a>.
     * @type {Pointer}
     */
    GetElement {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Gets the value of the element (CIM property) at the specified index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getelementat">MI_Instance_GetElementAt</a>.
     * @type {Pointer}
     */
    GetElementAt {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Clears the value of the named element (CIM property) and sets it to Null. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_clearelement">MI_Instance_ClearElement</a>.
     * @type {Pointer}
     */
    ClearElement {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Clears the value of the element (CIM property) at the specified index and sets it to Null. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_clearelementat">MI_Instance_ClearElementAt</a>.
     * @type {Pointer}
     */
    ClearElementAt {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Gets the server name from the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getservername">MI_Instance_GetServerName</a>.
     * @type {Pointer}
     */
    GetServerName {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Sets the server name of the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_setservername">MI_Instance_SetServerName</a>.
     * @type {Pointer}
     */
    SetServerName {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Gets the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> associated with an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getclass">MI_Instance_GetClass</a>.
     * @type {Pointer}
     */
    GetClass {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }
}
