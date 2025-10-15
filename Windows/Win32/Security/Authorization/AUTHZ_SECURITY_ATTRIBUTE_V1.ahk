#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Defines a security attribute that can be associated with an authorization context.
 * @see https://docs.microsoft.com/windows/win32/api//authz/ns-authz-authz_security_attribute_v1
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_SECURITY_ATTRIBUTE_V1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to a name of a security attribute.
     * @type {PWSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PWSTR(this.ptr + 0)
            return this.__pName
        }
    }

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
     * @type {Integer}
     */
    ValueType {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * 
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
     * @type {Pointer<AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE>}
     */
    pFqbn {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE>}
     */
    pOctetString {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
