#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\ACE_HEADER.ahk

/**
 * Defines an access control entry (ACE) for the system access control list (SACL) that specifies the system resource attributes for a securable object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_resource_attribute_ace
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SYSTEM_RESOURCE_ATTRIBUTE_ACE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of the ACE. The structure also contains flags that control inheritance of the ACE by child objects. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure must be set to <b>SYSTEM_RESOURCE_ATTRIBUTE_ACE</b>, and the <b>AceSize</b> member must be set to the total number of bytes allocated for the <b>SYSTEM_RESOURCE_ATTRIBUTE_ACE</b> structure.
     * @type {ACE_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := ACE_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * The access policy associated with the SACL that contains this ACE.
     * @type {Integer}
     */
    Mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the first <b>DWORD</b> of a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>. The remaining bytes of the <b>SID</b>  are stored in contiguous memory after the <b>SidStart</b> member in a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-claim_security_attribute_relative_v1">CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1</a> structure.
     * @type {Integer}
     */
    SidStart {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
