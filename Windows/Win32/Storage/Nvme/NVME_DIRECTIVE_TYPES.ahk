#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate a type of directive.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_TYPES{

    /**
     * A directive for an Identify operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_TYPE_IDENTIFY => 0

    /**
     * A directive for a Streams operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_TYPE_STREAMS => 1
}
