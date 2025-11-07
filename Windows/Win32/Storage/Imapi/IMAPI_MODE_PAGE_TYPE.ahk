#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the mode pages that are supported by CD and DVD devices.
 * @remarks
 * 
 * Note that the range of mode page type values is 0x0000 to 0xFFFF. This enumeration contains those features defined in the Multmedia Commands - 5 (MMC) specification. For a complete definition of each feature, see Mode Parameters for Multi-Media Devices in the latest release of the MMC specification at ftp://ftp.t10.org/t10/drafts/mmc5.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/ne-imapi2-imapi_mode_page_type
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_MODE_PAGE_TYPE{

    /**
     * The mode page specifies the error recovery parameters the
     * drive uses during any command that performs a data read or write operation from the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_TYPE_READ_WRITE_ERROR_RECOVERY => 1

    /**
     * The mode page provides a method by which the host may control the special features of a
     * MRW CD-RW Drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_TYPE_MRW => 3

    /**
     * The mode page provides parameters that are often needed in the execution of
     * commands that write to the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_TYPE_WRITE_PARAMETERS => 5

    /**
     * The mode page contains parameters to enable or disable caching during read or write operations.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_TYPE_CACHING => 8

    /**
     * The mode page contains parameters for exception reporting mechanisms that result in specific sense code errors when failures are predicted.  This mode page is related to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_feature_page_type">S.M.A.R.T.</a> feature.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_TYPE_INFORMATIONAL_EXCEPTIONS => 28

    /**
     * The mode page contains command time-out values that are  suggested by the device.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_TYPE_TIMEOUT_AND_PROTECT => 29

    /**
     * The mode page contains power management settings for the drive. The parameters define how long the logical unit delays before changing its internal power state.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_TYPE_POWER_CONDITION => 26

    /**
     * The mode page contains legacy device capabilities. These are superseded by the feature pages returned through the GetConfiguration command.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_TYPE_LEGACY_CAPABILITIES => 42
}
