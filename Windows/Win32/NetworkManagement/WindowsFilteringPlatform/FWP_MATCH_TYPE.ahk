#Requires AutoHotkey v2.0.0 64-bit

/**
 * Different match types allowed in filter conditions.
 * @remarks
 * 
  * In general, the value data type and the filter condition data type must be the same. The Base Filtering Engine (BFE) does not perform any data conversion. For example, an FWP_UINT32 value cannot be compared with an FWP_UINT16 value.
  * 
  * 
  * Exceptions to this rule are as follows.
  * 
  * <ul>
  * <li>An FWP_UINT32 field that contains an IPv4 address can be compared with an FWP_V4_ADDR_MASK value.</li>
  * <li>An FWP_BYTE_ARRAY16_TYPE field that contains an IPv6 address can be compared with an FWP_V6_ADDR_MASK value.</li>
  * <li>An FWP_TOKEN_INFORMATION_TYPE field can be compared with an FWP_SECURITY_DESCRIPTOR_TYPE value when adding filters.</li>
  * <li>An FWP_TOKEN_ACCESS_INFORMATION_TYPE field can be compared with an FWP_SECURITY_DESCRIPTOR_TYPE value when adding filters.</li>
  * <li>An FWP_TOKEN_INFORMATION_TYPE field can be compared with an FWP_SID value when enumerating.</li>
  * <li>An FWP_TOKEN_ACCESS_INFORMATION_TYPE field can be compared with an FWP_SID value when enumerating.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ne-fwptypes-fwp_match_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_MATCH_TYPE{

    /**
     * Tests whether the value is equal to the condition value. 
 * 
 * All data types support <b>FWP_MATCH_EQUAL</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_EQUAL => 0

    /**
     * Tests whether the value is greater than the condition value.
 * 
 * Only sortable data types support <b>FWP_MATCH_GREATER</b>. Sortable data types consist of all integer types, FWP_BYTE_ARRAY16_TYPE, FWP_BYTE_BLOB_TYPE, and FWP_UNICODE_STRING_TYPE.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_GREATER => 1

    /**
     * Tests whether the value is less than the condition value.
 * 
 * Only sortable data types support <b>FWP_MATCH_LESS</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_LESS => 2

    /**
     * Tests whether the value is greater than or equal to the condition value.
 * 
 * Only sortable data types support <b>FWP_MATCH_GREATER_OR_EQUAL</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_GREATER_OR_EQUAL => 3

    /**
     * Tests whether the value is less than or equal to the condition value.
 * 
 * Only sortable data types support <b>FWP_MATCH_LESS_OR_EQUAL</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_LESS_OR_EQUAL => 4

    /**
     * Tests whether the value is within a given range of condition values.
 * 
 * Only sortable data types support <b>FWP_MATCH_RANGE</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_RANGE => 5

    /**
     * Tests whether all flags are set.
 * 
 * Only unsigned integer data types support <b>FWP_MATCH_FLAGS_ALL_SET</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_FLAGS_ALL_SET => 6

    /**
     * Tests whether any flags are set.
 * 
 * Only unsigned integer data types support <b>FWP_MATCH_FLAGS_ANY_SET</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_FLAGS_ANY_SET => 7

    /**
     * Tests whether no flags are set.
 * 
 * Only unsigned integer data types support <b>FWP_MATCH_FLAGS_NONE_SET</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_FLAGS_NONE_SET => 8

    /**
     * Tests whether the value is equal to the condition value. The test is case insensitive.
 * 
 * Only the FWP_UNICODE_STRING_TYPE data type supports <b>FWP_MATCH_EQUAL_CASE_INSENSITIVE</b>.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_EQUAL_CASE_INSENSITIVE => 9

    /**
     * Tests whether the value is not equal to the condition value.
 * 
 * Only sortable data types support <b>FWP_MATCH_NOT_EQUAL</b>.<div class="alert"><b>Note</b>  Available only in Windows 7 and Windows Server 2008 R2.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_NOT_EQUAL => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_PREFIX => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_NOT_PREFIX => 12

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWP_MATCH_TYPE_MAX => 13
}
