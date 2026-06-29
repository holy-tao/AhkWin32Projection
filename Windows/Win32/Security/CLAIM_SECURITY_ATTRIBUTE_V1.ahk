#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE.ahk" { CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE }
#Import ".\CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE.ahk" { CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE }
#Import ".\CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE.ahk" { CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE }

/**
 * Defines a security attribute that can be associated with a token or authorization context.
 * @remarks
 * The field value type indicates that the value can be an octet string or a SID. However, the [Directory Services documentation for claims entries](/openspecs/windows_protocols/ms-adts/252d7e10-eaf8-44e9-8b8d-205b384f5782) specifies that effective possible data types for claims are limited to Int64, UInt64, UnicodeString, and Boolean.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attribute_v1
 * @namespace Windows.Win32.Security
 */
export default struct CLAIM_SECURITY_ATTRIBUTE_V1 {
    #StructPack 8


    struct _Values {
        pInt64 : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'pUint64', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'ppString', { type: PWSTR.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'pFqbn', { type: CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'pOctetString', { type: CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A pointer to a string of Unicode characters that contains the name of the security attribute. This string must be at least 4 bytes in length.
     */
    Name : PWSTR

    ValueType : CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE

    /**
     * This member is reserved and must be set to zero when sent and must be ignored when received.
     */
    Reserved : UInt16

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
     */
    Flags : UInt32

    /**
     * The number of values specified in the <b>Values</b> member.
     */
    ValueCount : UInt32

    /**
     * An array of security attribute values of the type specified in the <b>ValueType</b> member.
     */
    Values : CLAIM_SECURITY_ATTRIBUTE_V1._Values

}
