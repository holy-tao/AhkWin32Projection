#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The SECURITY_ATTRIBUTES structure contains the security descriptor for an object and specifies whether the handle retrieved by specifying this structure is inheritable.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wtypesbase/ns-wtypesbase-security_attributes
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SECURITY_ATTRIBUTES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure. Set this value to the size of the **SECURITY\_ATTRIBUTES** structure.
     * @type {Integer}
     */
    nLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a [**SECURITY\_DESCRIPTOR**](../winnt/ns-winnt-security_descriptor.md) structure that controls access to the object. If the value of this member is **NULL**, the object is assigned the default security descriptor associated with the [*access token*](/windows/win32/secauthz/access-tokens) of the calling process. This is not the same as granting access to everyone by assigning a **NULL** [*discretionary access control list*](/windows/win32/secauthz/dacls-and-aces) (DACL). By default, the default DACL in the access token of a process allows access only to the user represented by the access token.
     *     
     * For information about creating a security descriptor, see [Creating a Security Descriptor](/windows/win32/secauthz/creating-a-security-descriptor-for-a-new-object-in-c--).
     * @type {Pointer<Void>}
     */
    lpSecurityDescriptor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A Boolean value that specifies whether the returned handle is inherited when a new process is created. If this member is **TRUE**, the new process inherits the handle.
     * @type {Integer}
     */
    bInheritHandle {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
