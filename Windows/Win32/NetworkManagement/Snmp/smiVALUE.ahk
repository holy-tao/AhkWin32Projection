#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\smiCNTR64.ahk
#Include .\smiOCTETS.ahk
#Include .\smiOID.ahk

/**
 * The WinSNMP smiVALUE structure describes the value associated with a variable name in a variable binding entry.
 * @remarks
 * A WinSNMP application must check the <b>syntax</b> member of an 
  * <b>smiVALUE</b> structure to correctly dereference the <b>value</b> member. The <b>value</b> member can contain a simple scalar value or a non-scalar value like an 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> or an 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> descriptor structure.
  * 
  * If the <b>syntax</b> member indicates that the <b>value</b> member is an 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> or an 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> descriptor structure, the WinSNMP application must determine whether to free the resources allocated for the structure. The Microsoft WinSNMP implementation allocates and deallocates memory for all output 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structures. The application must call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> function to free the memory for the <b>ptr</b> member of these structures.
  * 
  * Because the WinSNMP application allocates memory for input descriptors with variable lengths, it must free that memory. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsnmp/ns-winsnmp-smivalue
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class smiVALUE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>smiUINT32</b>
     * 
     * Specifies an unsigned long integer that indicates the syntax data type of the <b>value</b> member. This member can be only one of the types listed in the following table. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-types">WinSNMP Data Types</a> and RFC 1902, "Structure of Management Information for Version 2 of the Simple Network Management Protocol (SNMPv2)."
     * 
     * <table>
     * <tr>
     * <th>Syntax data type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_INT"></a><a id="snmp_syntax_int"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_INT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a 32-bit signed integer variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_OCTETS"></a><a id="snmp_syntax_octets"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_OCTETS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an octet string variable that is binary or textual data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_NULL"></a><a id="snmp_syntax_null"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_NULL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a <b>NULL</b> value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_OID"></a><a id="snmp_syntax_oid"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_OID</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an object identifier variable that is an assigned name with a maximum of 128 subidentifiers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_INT32"></a><a id="snmp_syntax_int32"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_INT32</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a 32-bit signed integer variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_IPADDR"></a><a id="snmp_syntax_ipaddr"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_IPADDR</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a 32-bit Internet address variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_CNTR32"></a><a id="snmp_syntax_cntr32"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_CNTR32</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a counter variable that increases until it reaches a maximum value of (2^32) – 1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_GAUGE32"></a><a id="snmp_syntax_gauge32"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_GAUGE32</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a gauge variable that is a non-negative integer that can increase or decrease, but never exceed a maximum value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_TIMETICKS"></a><a id="snmp_syntax_timeticks"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_TIMETICKS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a counter variable that measures the time in hundredths of a second, until it reaches a maximum value of (2^32) – 1. It is a non-negative integer that is relative to a specific timer event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_OPAQUE"></a><a id="snmp_syntax_opaque"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_OPAQUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This type provides backward compatibility, and should not be used for new object types. It supports the capability to pass arbitrary Abstract Syntax Notation One (ASN.1) syntax.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_CNTR64"></a><a id="snmp_syntax_cntr64"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_CNTR64</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a counter variable that increases until it reaches a maximum value of (2^64) – 1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_UINT32"></a><a id="snmp_syntax_uint32"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_UINT32</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a 32-bit unsigned integer variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_NOSUCHOBJECT"></a><a id="snmp_syntax_nosuchobject"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_NOSUCHOBJECT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the agent does not support the object type that corresponds to the variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_NOSUCHINSTANCE"></a><a id="snmp_syntax_nosuchinstance"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_NOSUCHINSTANCE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the object instance does not exist for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_ENDOFMIBVIEW"></a><a id="snmp_syntax_endofmibview"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_ENDOFMIBVIEW</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the WinSNMP application is attempting to reference an object identifier that is beyond the end of the MIB tree that the agent supports.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The last three syntax types describe exception conditions under the SNMP version 2C (SNMPv2C) framework.
     * @type {Integer}
     */
    syntax {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    sNumber {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {smiCNTR64}
     */
    hNumber{
        get {
            if(!this.HasProp("__hNumber"))
                this.__hNumber := smiCNTR64(this.ptr + 8)
            return this.__hNumber
        }
    }

    /**
     * @type {smiOCTETS}
     */
    string{
        get {
            if(!this.HasProp("__string"))
                this.__string := smiOCTETS(this.ptr + 8)
            return this.__string
        }
    }

    /**
     * @type {smiOID}
     */
    oid{
        get {
            if(!this.HasProp("__oid"))
                this.__oid := smiOID(this.ptr + 8)
            return this.__oid
        }
    }

    /**
     * @type {Integer}
     */
    empty {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
