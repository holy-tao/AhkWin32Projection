#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_feature_value_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FEATURE_VALUE_CODES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VALUE_CURRENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VALUE_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VALUE_SAVED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VALUE_SUPPORTED_CAPABILITIES => 3
}
