#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DSOP_UPLEVEL_FILTER_FLAGS.ahk
#Include .\DSOP_FILTER_FLAGS.ahk

/**
 * The DSOP_SCOPE_INIT_INFO structure describes one or more scope types that have the same attributes.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-dsop_scope_init_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSOP_SCOPE_INIT_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags that indicate the scope types described by this structure. You can combine multiple scope types if all specified scopes use the same settings. This member can be a combination of the following flags.
     * @type {Integer}
     */
    flType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Flags that indicate the format used to return ADsPath for objects selected from this scope. The <b>flScope</b> member can also indicate the initial scope displayed in the <b>Look in</b> drop-down list. This member can be a combination of the following flags.
     * 
     * LDAP and Global Catalog (GC) paths can be converted to the WinNT ADsPath Syntax. GC paths can be converted to the LDAP format. WinNT objects having an objectSid attribute can be converted to the LDAP format if you specify the <b>DSOP_SCOPE_FLAG_WANT_SID_PATH</b> or <b>DSOP_SCOPE_FLAG_WANT_PROVIDER_LDAP</b> flags. No other conversions are legal.
     * @type {Integer}
     */
    flScope {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_filter_flags">DSOP_FILTER_FLAGS</a> structure that indicates the types of objects presented to the user for this scope or scopes.
     * @type {DSOP_FILTER_FLAGS}
     */
    FilterFlags{
        get {
            if(!this.HasProp("__FilterFlags"))
                this.__FilterFlags := DSOP_FILTER_FLAGS(this.ptr + 16)
            return this.__FilterFlags
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the name of a domain controller of the domain to which the target computer is joined. This member is used only if the <b>flType</b> member contains the <b>DSOP_SCOPE_TYPE_UPLEVEL_JOINED_DOMAIN</b> flag. If that flag is not set, <b>pwzDcName</b> must be <b>NULL</b>.
     * 
     * This member can be <b>NULL</b> even if the <b>DSOP_SCOPE_TYPE_UPLEVEL_JOINED_DOMAIN</b> flag is specified, in which case, the dialog box looks up the domain controller. This member enables you to name a specific domain controller in a multimaster domain. For example, an administrative application might make changes on a domain controller in a multimaster domain, and then open the object picker dialog box before the changes have been replicated on the other domain controllers.
     * @type {Pointer<Char>}
     */
    pwzDcName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved; must be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    pwzADsPath {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Contains an <b>HRESULT</b> value that indicates the status of the specific scope. If the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nf-objsel-idsobjectpicker-initialize">IDsObjectPicker::Initialize</a> method successfully creates the scope, or scopes, specified by this structure, <b>hr</b> contains <b>S_OK</b>. Otherwise, <b>hr</b> contains an error code.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nf-objsel-idsobjectpicker-initialize">IDsObjectPicker::Initialize</a> returns <b>S_OK</b>, the <b>hr</b> members of all the specified <b>DSOP_SCOPE_INIT_INFO</b> structures also contain <b>S_OK</b>.
     * @type {HRESULT}
     */
    hr {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
