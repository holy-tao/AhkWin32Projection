#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * Identifies an object type element in a hierarchy of object types.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-object_type_list
 * @namespace Windows.Win32.Security
 */
export default struct OBJECT_TYPE_LIST {
    #StructPack 8

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
     */
    Level : UInt16

    /**
     * Should be zero. Reserved for future use.
     */
    Sbz : UInt16

    /**
     * A pointer to the GUID for the object or subobject.
     */
    ObjectType : Guid.Ptr

}
