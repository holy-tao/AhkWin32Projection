#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\ACE_HEADER.ahk

/**
 * Defines an access control entry (ACE) for the system access control list (SACL) that specifies the mandatory access level and policy for a securable object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_mandatory_label_ace
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SYSTEM_MANDATORY_LABEL_ACE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of the ACE. The structure also contains flags that control inheritance of the ACE by child objects. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure must be set to <b>SYSTEM_MANDATORY_LABEL_ACE_TYPE</b>, and the <b>AceSize</b> member must be set to the total number of bytes allocated for the <b>SYSTEM_MANDATORY_LABEL_ACE</b> structure.
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
     * The access policy for principals with a mandatory integrity level lower than the object associated with the SACL that contains this ACE.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYSTEM_MANDATORY_LABEL_NO_WRITE_UP"></a><a id="system_mandatory_label_no_write_up"></a><dl>
     * <dt><b>SYSTEM_MANDATORY_LABEL_NO_WRITE_UP</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A principal with a lower mandatory level than the object cannot write to the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYSTEM_MANDATORY_LABEL_NO_READ_UP"></a><a id="system_mandatory_label_no_read_up"></a><dl>
     * <dt><b>SYSTEM_MANDATORY_LABEL_NO_READ_UP</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A principal with a lower mandatory level than the object cannot read the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP"></a><a id="system_mandatory_label_no_execute_up"></a><dl>
     * <dt><b>SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A principal with a lower mandatory level than the object cannot execute the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    SidStart {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
