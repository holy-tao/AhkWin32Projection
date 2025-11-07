#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LDAP_BERVAL.ahk

/**
 * Represents both client-side and server controls.
 * @remarks
 * 
 * Effective with LDAP 3, you can extend LDAP operations through the use of controls. Server controls can be sent to the server or returned to the client with any LDAP message. Client controls extend the behavior of the LDAP API on the client-side only and are never sent to the server. A supported control is stored as an object identifier (OID) in the Directory Service root.
 * 
 * The <b>ldctl_iscritical</b> member enables an extended operation to succeed when the server or client does not support the control. If the value of this field is zero, the server and/or client ignores the control if it is not supported and carries out the operation. If the value is nonzero the operation is carried out only if the control is recognized by the server and/or client.
 * 
 * For more information, and a list of the supported LDAP extended controls and their descriptions, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/extended-controls">Extended Controls</a>.
 * 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winldap.h header defines LDAPControl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winldap/ns-winldap-ldapcontrola
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 * @charset ANSI
 */
class LDAPControlA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a wide, null-terminated string that indicates  control type, such as "1.2.840.113556.1.4.805".
     * @type {PSTR}
     */
    ldctl_oid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The data associated with the control, if any. If no data is associated with the control, set this member to <b>NULL</b>.
     * @type {LDAP_BERVAL}
     */
    ldctl_value{
        get {
            if(!this.HasProp("__ldctl_value"))
                this.__ldctl_value := LDAP_BERVAL(8, this)
            return this.__ldctl_value
        }
    }

    /**
     * Indicates whether the control is critical, called the Criticality field.
     * @type {BOOLEAN}
     */
    ldctl_iscritical {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }
}
