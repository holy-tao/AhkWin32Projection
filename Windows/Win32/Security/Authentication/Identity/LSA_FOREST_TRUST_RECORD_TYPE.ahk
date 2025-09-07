#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of a Local Security Authority forest trust record.
 * @remarks
 * This enumeration is used by the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_record">LSA_FOREST_TRUST_RECORD</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-lsa_forest_trust_record_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_FOREST_TRUST_RECORD_TYPE{

    /**
     * Record contains an included top-level name.
     * @type {Integer (Int32)}
     */
    static ForestTrustTopLevelName => 0

    /**
     * Record contains an excluded top-level name.
     * @type {Integer (Int32)}
     */
    static ForestTrustTopLevelNameEx => 1

    /**
     * Record contains an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_domain_info">LSA_FOREST_TRUST_DOMAIN_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static ForestTrustDomainInfo => 2

    /**
     * @type {Integer (Int32)}
     */
    static ForestTrustBinaryInfo => 3

    /**
     * @type {Integer (Int32)}
     */
    static ForestTrustScannerInfo => 4

    /**
     * Marks the end of an enumeration.
     * @type {Integer (Int32)}
     */
    static ForestTrustRecordTypeLast => 4
}
