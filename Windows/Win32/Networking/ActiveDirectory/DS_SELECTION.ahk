#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The DS_SELECTION structure contains data about an object the user selected from an object picker dialog box. The DS_SELECTION_LIST structure contains an array of DS_SELECTION structures.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-ds_selection
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_SELECTION {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that contains the object's relative distinguished name (RDN).
     */
    pwzName : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the object's ADsPath. The format of this string depends on the flags specified in the <b>flScope</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_scope_init_info">DSOP_SCOPE_INIT_INFO</a> structure for the scope from which this object was selected.
     */
    pwzADsPath : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the value of the object's objectClass attribute.
     */
    pwzClass : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the object's userPrincipalName attribute value. If the object does not have a userPrincipalName value, <b>pwzUPN</b> points to an empty string (L"").
     */
    pwzUPN : PWSTR

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structures. Each <b>VARIANT</b> contains the value of an attribute of the selected object. The attributes retrieved are determined by the attribute names specified in the <b>apwzAttributeNames</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_init_info">DSOP_INIT_INFO</a> structure passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nf-objsel-idsobjectpicker-initialize">IDsObjectPicker::Initialize</a> method. The order of attributes in the <b>pvarFetchedAttributes</b> array corresponds to the order of attribute names specified in the <b>apwzAttributeNames</b> array.
     * 
     * The object picker dialog box may not be able to retrieve the requested attributes. If the attribute cannot be retrieved, the <b>vt</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure contains <b>VT_EMPTY</b>.
     */
    pvarFetchedAttributes : VARIANT.Ptr

    /**
     * Contains one, or more, of the <b>DSOP_SCOPE_TYPE_*</b> that indicate the type of  scope from which this object was selected.  For more information, and a list of <b>DSOP_SCOPE_TYPE_*</b> flags, see the <b>flType</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_scope_init_info">DSOP_SCOPE_INIT_INFO</a> structure.
     */
    flScopeType : UInt32

}
