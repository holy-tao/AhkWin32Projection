#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify whether or what type of a secure erase operation should be performed as part of a Format NVM command.
 * @remarks
 * Use this enumeration to specify values in the **SES** field of the [NVME_CDW10_FORMAT_NVM](ns-nvme-nvme_cdw10_format_nvm.md) structure that is used in the [FORMAT NVM (FORMATNVM)](ns-nvme-nvme_command.md) Admin command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_secure_erase_settings
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_SECURE_ERASE_SETTINGS extends Win32Enum {

    /**
     * No secure erase operation is requested.
     * Native name: NVME_SECURE_ERASE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * All user data will be erased. Contents of the user data after the erase is indeterminate. For example, the user data may be zero filled or one filled. The controller may perform a cryptographic erase when **NVME_SECURE_ERASE_USER_DATA** is specified, if all user data is encrypted.
     * Native name: NVME_SECURE_ERASE_USER_DATA
     * @type {Integer (Int32)}
     */
    static USER_DATA => 1

    /**
     * All user data will be erased cryptographically. This is accomplished by deleting the encryption key.
     * Native name: NVME_SECURE_ERASE_CRYPTOGRAPHIC
     * @type {Integer (Int32)}
     */
    static CRYPTOGRAPHIC => 2
}
