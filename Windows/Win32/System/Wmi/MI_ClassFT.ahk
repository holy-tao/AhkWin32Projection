#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_Class structure. Use the functions with the name prefix &quot;MI_Class_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_classft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ClassFT extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    GetClassNameA {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Retrieves the namespace of the class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getnamespace">MI_Class_GetNameSpace</a>.
     * @type {Pointer}
     */
    GetNameSpace {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Retrieves the server name of the class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getservername">MI_Class_GetServerName</a> .
     * @type {Pointer}
     */
    GetServerName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Retrieves the number of elements in a class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getelementcount">MI_Class_GetElementCount</a> .
     * @type {Pointer}
     */
    GetElementCount {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Retrieves information about a named class element. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getelement">MI_Class_GetElement</a>.
     * @type {Pointer}
     */
    GetElement {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Retrieves information about a specific class element given the element index (Indexes start from 0). See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getelementat">MI_Class_GetElementAt</a>.
     * @type {Pointer}
     */
    GetElementAt {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Retrieve an object from a class that allows the class qualifiers to be queried. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getclassqualifierset">MI_Class_GetClassQualifierSet</a>.
     * @type {Pointer}
     */
    GetClassQualifierSet {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Retrieves the number of class methods. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getmethodcount">MI_Class_GetMethodCount</a>.
     * @type {Pointer}
     */
    GetMethodCount {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Get method information based on a method index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getmethodat">MI_Class_GetMethodAt</a>.
     * @type {Pointer}
     */
    GetMethodAt {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Get method information based on a method name. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getmethod">MI_Class_GetMethod</a>.
     * @type {Pointer}
     */
    GetMethod {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Get the parent class name of the class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getparentclassname">MI_Class_GetParentClassName</a>.
     * @type {Pointer}
     */
    GetParentClassName {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Get the parent class for the specified class. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_getparentclass">MI_Class_GetParentClass</a>.
     * @type {Pointer}
     */
    GetParentClass {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Delete an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_delete">MI_Class_Delete</a>.
     * @type {Pointer}
     */
    Delete {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Clones an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_class_clone">MI_Class_Clone</a>.
     * @type {Pointer}
     */
    Clone {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
