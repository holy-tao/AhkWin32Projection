#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Identifies an object type element in a hierarchy of object types.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-object_type_list
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class OBJECT_TYPE_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the level of the object type in the hierarchy of an object and its subobjects. Level zero indicates the object itself. Level one indicates a subobject of the object, such as a property set. Level two indicates a subobject of the level one subobject, such as a property. There can be a maximum of five levels numbered zero through four. 
     * 
     * 
     * 
     * 
     * Directory service objects use the following level values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_OBJECT_GUID"></a><a id="access_object_guid"></a><dl>
     * <dt><b>ACCESS_OBJECT_GUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the object itself at level zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_PROPERTY_SET_GUID"></a><a id="access_property_set_guid"></a><dl>
     * <dt><b>ACCESS_PROPERTY_SET_GUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a property set at level one.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_PROPERTY_GUID"></a><a id="access_property_guid"></a><dl>
     * <dt><b>ACCESS_PROPERTY_GUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a property at level two.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Should be zero. Reserved for future use.
     * @type {Integer}
     */
    Sbz {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A pointer to the GUID for the object or subobject.
     * @type {Pointer<Guid>}
     */
    ObjectType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
