#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LDAP_BERVAL.ahk" { LDAP_BERVAL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Holds data required to perform a modification operation. (ANSI)
 * @remarks
 * Assign values to the fields of the <b>LDAPMod</b> structure before you call a modification function (
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add*</a>, or 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify">ldap_modify*</a>).
 * 
 * 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_s">ldap_modify*</a> with the <b>LDAP_MOD_REPLACE</b> operation does not delete an attribute when passed a null pointer. However, <b>LDAP_MOD_DELETE</b> deletes the entire attribute when <b>mod_vals</b> is set to <b>NULL</b>.
 * 
 * When passing a <b>LDAPMod</b> structure into the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add*</a> functions, only the <b>LDAP_MOD_BVALUES</b> flag is significant. Creating a new object implies adding values to it.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winldap.h header defines LDAPMod as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmoda
 * @namespace Windows.Win32.Networking.Ldap
 * @charset ANSI
 */
export default struct LDAPModA {
    #StructPack 8


    struct _mod_vals {
        modv_strvals : PSTR.Ptr

        static __New() {
            DefineProp(this.Prototype, 'modv_bvals', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    mod_op : UInt32

    /**
     * Pointer to a null-terminated string that specifies the name of  the attribute to modify.
     */
    mod_type : PSTR

    /**
     * Pointer to an array of values, if any, to add, delete, or replace. If <b>mop_op</b> does not include the LDAP_MOD_BVALUES flag, the <b>modv_strvals</b> member is a pointer to an array of null-terminated strings. If <b>mop_op</b> includes LDAP_MOD_BVALUES, the <b>modv_bvals</b> member is a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> pointers, which is useful for specifying binary values.
     */
    mod_vals : LDAPModA._mod_vals

}
