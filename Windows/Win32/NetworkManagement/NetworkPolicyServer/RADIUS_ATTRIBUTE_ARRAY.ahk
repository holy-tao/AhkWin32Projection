#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RADIUS_ATTRIBUTE_ARRAY structure represents an array of attributes.
 * @remarks
 * The Extension DLL must not modify this structure. Changes to the array of attributes should be made by calling the functions provided as members of this structure.
 * 
 * This structure is used by Extension DLLs that export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a>. The functions that add attributes to the array:
 * 
 * <a href="https://docs.microsoft.com/previous-versions/ms688246(v=vs.85)">Add</a>
 * <a href="https://docs.microsoft.com/previous-versions/ms688296(v=vs.85)">InsertAt</a>
 * copy the contents of the caller-supplied 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> structure. Therefore, Extension DLLs that export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a> need not export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_free_attributes">RadiusExtensionFreeAttributes</a>.
 * 
 * This structure is returned by the functions 
 * <a href="https://docs.microsoft.com/previous-versions/ms688263(v=vs.85)">GetRequest</a> and 
 * <a href="https://docs.microsoft.com/previous-versions/ms688270(v=vs.85)">GetResponse</a>.
 * @see https://learn.microsoft.com/windows/win32/api/authif/ns-authif-radius_attribute_array
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_ATTRIBUTE_ARRAY extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies the size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688246(v=vs.85)">Add</a> function provided by NPS. NPS sets the value of the member.
     * @type {Pointer}
     */
    Add {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688253(v=vs.85)">AttributeAt</a> function provided by NPS. NPS sets the value of the member.
     *    
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688253(v=vs.85)">AttributeAt</a> function returns a const pointer to the specified attribute within the array.
     * @type {Pointer}
     */
    AttributeAt {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688277(v=vs.85)">GetSize</a> function provided by NPS. NPS sets the value of the member.
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688277(v=vs.85)">GetSize</a> function returns the size of the attribute array.
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688277(v=vs.85)">GetSize</a> function returns the size of the attribute array, not the largest index. Because attribute arrays use zero-based indexes, the size of the array is one greater than the largest index.
     * @type {Pointer}
     */
    GetSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688296(v=vs.85)">InsertAt</a> function provided by NPS. NPS sets the value of the member.
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688296(v=vs.85)">InsertAt</a> function inserts the specified attribute at the specified index in the array.
     * 
     * When the 
     * <a href="https://docs.microsoft.com/previous-versions/ms688296(v=vs.85)">InsertAt</a> function inserts a new attribute into the array, it increments the index of the pre-existing attribute at this index. Similarly, it increments the index of any pre-existing attributes at higher indexes.
     * 
     * To append an attribute to the end of the attribute array, use the 
     * <a href="https://docs.microsoft.com/previous-versions/ms688246(v=vs.85)">Add</a> function.
     * @type {Pointer}
     */
    InsertAt {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688452(v=vs.85)">RemoveAt</a> function provided by NPS. NPS sets the value of the member.
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688452(v=vs.85)">RemoveAt</a> function removes the attribute at the specified index in the array.
     * 
     * When the <a href="https://docs.microsoft.com/previous-versions/ms688452(v=vs.85)">RemoveAt</a> function removes an attribute from the array, it decrements the index of any pre-existing attributes at higher indexes.
     * @type {Pointer}
     */
    RemoveAt {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688456(v=vs.85)">SetAt</a> function provided by NPS. NPS sets the value of the member.
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688456(v=vs.85)">SetAt</a> function replaces the attribute at the specified index with the specified attribute.
     * @type {Pointer}
     */
    SetAt {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 56
    }
}
