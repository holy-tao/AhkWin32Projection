#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_protection_information_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_PROTECTION_INFORMATION_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PROTECTION_INFORMATION_NOT_ENABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PROTECTION_INFORMATION_TYPE1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PROTECTION_INFORMATION_TYPE2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PROTECTION_INFORMATION_TYPE3 => 3
}
