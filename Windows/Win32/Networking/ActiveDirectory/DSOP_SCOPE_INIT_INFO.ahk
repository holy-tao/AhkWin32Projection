#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DSOP_UPLEVEL_FILTER_FLAGS.ahk" { DSOP_UPLEVEL_FILTER_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DSOP_FILTER_FLAGS.ahk" { DSOP_FILTER_FLAGS }

/**
 * The DSOP_SCOPE_INIT_INFO structure describes one or more scope types that have the same attributes.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-dsop_scope_init_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSOP_SCOPE_INIT_INFO {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Flags that indicate the scope types described by this structure. You can combine multiple scope types if all specified scopes use the same settings. This member can be a combination of the following flags.
     */
    flType : UInt32

    /**
     * Flags that indicate the format used to return ADsPath for objects selected from this scope. The <b>flScope</b> member can also indicate the initial scope displayed in the <b>Look in</b> drop-down list. This member can be a combination of the following flags.
     * 
     * LDAP and Global Catalog (GC) paths can be converted to the WinNT ADsPath Syntax. GC paths can be converted to the LDAP format. WinNT objects having an objectSid attribute can be converted to the LDAP format if you specify the <b>DSOP_SCOPE_FLAG_WANT_SID_PATH</b> or <b>DSOP_SCOPE_FLAG_WANT_PROVIDER_LDAP</b> flags. No other conversions are legal.
     */
    flScope : UInt32

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_filter_flags">DSOP_FILTER_FLAGS</a> structure that indicates the types of objects presented to the user for this scope or scopes.
     */
    FilterFlags : DSOP_FILTER_FLAGS

    /**
     * Pointer to a null-terminated Unicode string that contains the name of a domain controller of the domain to which the target computer is joined. This member is used only if the <b>flType</b> member contains the <b>DSOP_SCOPE_TYPE_UPLEVEL_JOINED_DOMAIN</b> flag. If that flag is not set, <b>pwzDcName</b> must be <b>NULL</b>.
     * 
     * This member can be <b>NULL</b> even if the <b>DSOP_SCOPE_TYPE_UPLEVEL_JOINED_DOMAIN</b> flag is specified, in which case, the dialog box looks up the domain controller. This member enables you to name a specific domain controller in a multimaster domain. For example, an administrative application might make changes on a domain controller in a multimaster domain, and then open the object picker dialog box before the changes have been replicated on the other domain controllers.
     */
    pwzDcName : PWSTR

    /**
     * Reserved; must be <b>NULL</b>.
     */
    pwzADsPath : PWSTR

    /**
     * Contains an <b>HRESULT</b> value that indicates the status of the specific scope. If the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nf-objsel-idsobjectpicker-initialize">IDsObjectPicker::Initialize</a> method successfully creates the scope, or scopes, specified by this structure, <b>hr</b> contains <b>S_OK</b>. Otherwise, <b>hr</b> contains an error code.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nf-objsel-idsobjectpicker-initialize">IDsObjectPicker::Initialize</a> returns <b>S_OK</b>, the <b>hr</b> members of all the specified <b>DSOP_SCOPE_INIT_INFO</b> structures also contain <b>S_OK</b>.
     */
    hr : HRESULT

}
