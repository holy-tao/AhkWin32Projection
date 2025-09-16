#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains the security information associated with an object.
 * @remarks
 * A security descriptor includes information that specifies the following components of an object's security:
  * 
  * <ul>
  * <li>An owner <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID)</li>
  * <li>A primary group SID</li>
  * <li>A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL)</li>
  * <li>A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL)</li>
  * <li>Qualifiers for the preceding items</li>
  * </ul>
  * Several functions that use the <b>SECURITY_DESCRIPTOR</b> structure require that this structure be aligned on a valid pointer boundary in memory. These boundaries vary depending on the type of processor used. Memory allocation functions such as <b>malloc</b> and <b>LocalAlloc</b> return properly aligned pointers.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-security_descriptor
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SECURITY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Sbz1 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Control {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Pointer<PSID>}
     */
    Owner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PSID>}
     */
    Group {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<ACL>}
     */
    Sacl {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<ACL>}
     */
    Dacl {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
