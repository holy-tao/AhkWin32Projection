#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides additional information about how the field's data should be interpreted.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_field_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_FIELD_TYPE{

    /**
     * Value contains raw data.
     * @type {Integer (Int32)}
     */
    static FWPM_FIELD_RAW_DATA => 0

    /**
     * Value contains an IP address.
     * @type {Integer (Int32)}
     */
    static FWPM_FIELD_IP_ADDRESS => 1

    /**
     * Value contains flags.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_FIELD_FLAGS => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_FIELD_TYPE_MAX => 3
}
