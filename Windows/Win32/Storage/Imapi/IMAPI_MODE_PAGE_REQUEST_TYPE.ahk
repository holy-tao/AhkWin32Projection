#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate requests sent to a device using the MODE_SENSE10 MMC command.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_mode_page_request_type
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_MODE_PAGE_REQUEST_TYPE extends Win32Enum{

    /**
     * Requests current settings of the mode page.  This is the most common request type, and the most commonly supported type of this command.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_REQUEST_TYPE_CURRENT_VALUES => 0

    /**
     * Requests a mask that indicates settings that are write enabled. A write-enabled setting has a corresponding bit that is set to one in the mask. A read-only setting has a corresponding bit that is set to zero in the mask .
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_REQUEST_TYPE_CHANGEABLE_VALUES => 1

    /**
     * Requests the power-on settings of the drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_REQUEST_TYPE_DEFAULT_VALUES => 2

    /**
     * Requests a saved configuration for a drive. This functionality might not be supported on all devices.
     * @type {Integer (Int32)}
     */
    static IMAPI_MODE_PAGE_REQUEST_TYPE_SAVED_VALUES => 3
}
