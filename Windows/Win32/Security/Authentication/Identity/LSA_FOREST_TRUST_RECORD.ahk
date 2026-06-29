#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\LSA_FOREST_TRUST_RECORD_TYPE.ahk" { LSA_FOREST_TRUST_RECORD_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LSA_FOREST_TRUST_BINARY_DATA.ahk" { LSA_FOREST_TRUST_BINARY_DATA }
#Import ".\LSA_FOREST_TRUST_DOMAIN_INFO.ahk" { LSA_FOREST_TRUST_DOMAIN_INFO }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Represents a Local Security Authority forest trust record.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_record
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_RECORD {
    #StructPack 8


    struct _ForestTrustData {
        TopLevelName : LSA_UNICODE_STRING

        static __New() {
            DefineProp(this.Prototype, 'DomainInfo', { type: LSA_FOREST_TRUST_DOMAIN_INFO, offset: 0 })
            DefineProp(this.Prototype, 'Data', { type: LSA_FOREST_TRUST_BINARY_DATA, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Flags that control the behavior of the operation.
     */
    Flags : UInt32

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
     */
    ForestTrustType : LSA_FOREST_TRUST_RECORD_TYPE

    /**
     * Time stamp of the record.
     */
    Time : Int64

    ForestTrustData : LSA_FOREST_TRUST_RECORD._ForestTrustData

}
