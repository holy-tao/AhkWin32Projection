#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\PWSTR.ahk

/**
 * Defines a security attribute that can be associated with a token or authorization context.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-claim_security_attribute_v1
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class CLAIM_SECURITY_ATTRIBUTE_V1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to a string of Unicode characters that contains the name of the security attribute. This string must be at least 4 bytes in length.
     * @type {PWSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PWSTR(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * 
     * @type {Integer}
     */
    ValueType {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * This member is reserved and must be set to zero when sent and must be ignored when received.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The attribute flags that are a 32-bitmask. Bits 16 through 31 may be set to any value. Bits 0 through 15 must be zero or a combination of one or more of the following mask values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE"></a><a id="claim_security_attribute_non_inheritable"></a><dl>
     * <dt><b>CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This attribute is ignored by the operating system. This claim security attribute is not inherited across processes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE"></a><a id="claim_security_attribute_value_case_sensitive"></a><dl>
     * <dt><b>CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the claim security attribute is case sensitive. This flag is valid for values that contain string types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY"></a><a id="claim_security_attribute_use_for_deny_only"></a><dl>
     * <dt><b>CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The claim security attribute is considered only for deny <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT"></a><a id="claim_security_attribute_disabled_by_default"></a><dl>
     * <dt><b>CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The claim security attribute is disabled by default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLAIM_SECURITY_ATTRIBUTE_DISABLED"></a><a id="claim_security_attribute_disabled"></a><dl>
     * <dt><b>CLAIM_SECURITY_ATTRIBUTE_DISABLED</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The claim security attribute is disabled and will not be applied by the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLAIM_SECURITY_ATTRIBUTE_MANDATORY"></a><a id="claim_security_attribute_mandatory"></a><dl>
     * <dt><b>CLAIM_SECURITY_ATTRIBUTE_MANDATORY</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The claim security attribute is mandatory.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of values specified in the <b>Values</b> member.
     * @type {Integer}
     */
    ValueCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Int64>}
     */
    pInt64 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<UInt64>}
     */
    pUint64 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    ppString {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE>}
     */
    pFqbn {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE>}
     */
    pOctetString {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
