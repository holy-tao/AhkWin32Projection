#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of a Local Security Authority forest trust record.
 * @remarks
 * This enumeration is used by the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_record">LSA_FOREST_TRUST_RECORD</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-lsa_forest_trust_record_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class LSA_FOREST_TRUST_RECORD_TYPE extends Win32Enum {

    /**
     * Record contains an included top-level name.
     * Native name: ForestTrustTopLevelName
     * @type {Integer (Int32)}
     */
    static TopLevelName => 0

    /**
     * Record contains an excluded top-level name.
     * Native name: ForestTrustTopLevelNameEx
     * @type {Integer (Int32)}
     */
    static TopLevelNameEx => 1

    /**
     * Record contains an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_domain_info">LSA_FOREST_TRUST_DOMAIN_INFO</a> structure.
     * Native name: ForestTrustDomainInfo
     * @type {Integer (Int32)}
     */
    static DomainInfo => 2

    /**
     * Native name: ForestTrustBinaryInfo
     * @type {Integer (Int32)}
     */
    static BinaryInfo => 3

    /**
     * Native name: ForestTrustScannerInfo
     * @type {Integer (Int32)}
     */
    static ScannerInfo => 4

    /**
     * Marks the end of an enumeration.
     * Native name: ForestTrustRecordTypeLast
     * @type {Integer (Int32)}
     */
    static Last => 4
}
