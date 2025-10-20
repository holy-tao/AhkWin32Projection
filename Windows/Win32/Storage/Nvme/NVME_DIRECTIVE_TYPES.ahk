#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_TYPE_IDENTIFY => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_TYPE_STREAMS => 1
}
