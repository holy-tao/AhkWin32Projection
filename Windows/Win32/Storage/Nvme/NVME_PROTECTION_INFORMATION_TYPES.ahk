#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate whether end-to-end data protection is enabled, and if it is, specifies the type of protection information.
 * @remarks
 * Use this enumeration to specify values in the **PI** field of the [NVME_CDW10_FORMAT_NVM](ns-nvme-nvme_cdw10_format_nvm.md) structure that is used in the [FORMAT NVM (FORMATNVM)](ns-nvme-nvme_command.md) Admin command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_protection_information_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_PROTECTION_INFORMATION_TYPES extends Win32Enum{

    /**
     * Protection information is not enabled.
     * @type {Integer (Int32)}
     */
    static NVME_PROTECTION_INFORMATION_NOT_ENABLED => 0

    /**
     * Type 1 protection information is enabled.
     * @type {Integer (Int32)}
     */
    static NVME_PROTECTION_INFORMATION_TYPE1 => 1

    /**
     * Type 2 protection information is enabled.
     * @type {Integer (Int32)}
     */
    static NVME_PROTECTION_INFORMATION_TYPE2 => 2

    /**
     * Type 3 protection information is enabled.
     * @type {Integer (Int32)}
     */
    static NVME_PROTECTION_INFORMATION_TYPE3 => 3
}
