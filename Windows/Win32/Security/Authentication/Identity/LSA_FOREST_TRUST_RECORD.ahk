#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSID.ahk
#Include .\LSA_FOREST_TRUST_DOMAIN_INFO.ahk
#Include .\LSA_FOREST_TRUST_BINARY_DATA.ahk

/**
 * Represents a Local Security Authority forest trust record.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_record
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_FOREST_TRUST_RECORD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Flags that control the behavior of the operation.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-lsa_forest_trust_record_type">LSA_FOREST_TRUST_RECORD_TYPE</a> enumeration that indicates the type of the record. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ForestTrustTopLevelName"></a><a id="foresttrusttoplevelname"></a><a id="FORESTTRUSTTOPLEVELNAME"></a><dl>
     * <dt><b>ForestTrustTopLevelName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Record contains an included top-level name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ForestTrustTopLevelNameEx"></a><a id="foresttrusttoplevelnameex"></a><a id="FORESTTRUSTTOPLEVELNAMEEX"></a><dl>
     * <dt><b>ForestTrustTopLevelNameEx</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Record contains an excluded top-level name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ForestTrustDomainInfo"></a><a id="foresttrustdomaininfo"></a><a id="FORESTTRUSTDOMAININFO"></a><dl>
     * <dt><b>ForestTrustDomainInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Record contains an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_domain_info">LSA_FOREST_TRUST_DOMAIN_INFO</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ForestTrustRecordTypeLast"></a><a id="foresttrustrecordtypelast"></a><a id="FORESTTRUSTRECORDTYPELAST"></a><dl>
     * <dt><b>ForestTrustRecordTypeLast</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Marks the end of an enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ForestTrustType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Time stamp of the record.
     * @type {Integer}
     */
    Time {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    TopLevelName{
        get {
            if(!this.HasProp("__TopLevelName"))
                this.__TopLevelName := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__TopLevelName
        }
    }

    /**
     * @type {LSA_FOREST_TRUST_DOMAIN_INFO}
     */
    DomainInfo{
        get {
            if(!this.HasProp("__DomainInfo"))
                this.__DomainInfo := LSA_FOREST_TRUST_DOMAIN_INFO(this.ptr + 16)
            return this.__DomainInfo
        }
    }

    /**
     * @type {LSA_FOREST_TRUST_BINARY_DATA}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := LSA_FOREST_TRUST_BINARY_DATA(this.ptr + 16)
            return this.__Data
        }
    }
}
