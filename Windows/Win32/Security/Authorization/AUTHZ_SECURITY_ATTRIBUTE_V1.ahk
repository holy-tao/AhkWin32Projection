#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AUTHZ_SECURITY_ATTRIBUTE_FLAGS.ahk" { AUTHZ_SECURITY_ATTRIBUTE_FLAGS }
#Import ".\AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE.ahk" { AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE }
#Import ".\AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE.ahk" { AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE }

/**
 * Defines a security attribute that can be associated with an authorization context.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_security_attribute_v1
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_SECURITY_ATTRIBUTE_V1 {
    #StructPack 8


    struct _Values {
        pInt64 : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'pUint64', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'ppString', { type: PWSTR.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'pFqbn', { type: AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'pOctetString', { type: AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A pointer to a name of a security attribute.
     */
    pName : PWSTR

    /**
     * The data type of the values pointed to by the <b>Values</b> member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SECURITY_ATTRIBUTE_TYPE_INT64"></a><a id="authz_security_attribute_type_int64"></a><dl>
     * <dt><b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_INT64</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Values</b> member refers to a security attribute that is of <b>INT64</b> type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SECURITY_ATTRIBUTE_TYPE_UINT64"></a><a id="authz_security_attribute_type_uint64"></a><dl>
     * <dt><b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_UINT64</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Values</b> member refers to a security attribute that is of <b>UINT64</b> type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING"></a><a id="authz_security_attribute_type_string"></a><dl>
     * <dt><b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING</b></dt>
     * <dt>0x0003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Values</b> member refers to a security attribute that is of <b>STRING</b> type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN"></a><a id="authz_security_attribute_type_fqbn"></a><dl>
     * <dt><b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Values</b> member refers to a security attribute that is of <b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN</b> type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SECURITY_ATTRIBUTE_TYPE_SID"></a><a id="authz_security_attribute_type_sid"></a><dl>
     * <dt><b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_SID</b></dt>
     * <dt>0x0005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Values</b> member refers to a security attribute that is of <b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_SID</b> type.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>This value type is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SECURITY_ATTRIBUTE_TYPE_BOOLEAN"></a><a id="authz_security_attribute_type_boolean"></a><dl>
     * <dt><b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_BOOLEAN</b></dt>
     * <dt>0x0006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Values</b> member refers to a security attribute that is of <b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_BOOLEAN</b> type.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>This value type is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING"></a><a id="authz_security_attribute_type_octet_string"></a><dl>
     * <dt><b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Values</b> member refers to a security attribute that is of <b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING</b> type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING"></a><a id="authz_security_attribute_type_octet_string"></a><dl>
     * <dt><b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Values</b> member refers to a security attribute that is of <b>AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING</b> type.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ValueType : UInt16

    /**
     * Reserved for future use.
     */
    Reserved : UInt16

    Flags : AUTHZ_SECURITY_ATTRIBUTE_FLAGS

    /**
     * The number of values specified in the <b>Values</b> member.
     */
    ValueCount : UInt32

    Values : AUTHZ_SECURITY_ATTRIBUTE_V1._Values

}
