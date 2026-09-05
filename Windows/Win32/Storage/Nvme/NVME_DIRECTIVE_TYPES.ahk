#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate a type of directive.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_types
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_DIRECTIVE_TYPES extends Win32Enum {

    /**
     * A directive for an Identify operation.
     * Native name: NVME_DIRECTIVE_TYPE_IDENTIFY
     * @type {Integer (Int32)}
     */
    static TYPE_IDENTIFY => 0

    /**
     * A directive for a Streams operation.
     * Native name: NVME_DIRECTIVE_TYPE_STREAMS
     * @type {Integer (Int32)}
     */
    static TYPE_STREAMS => 1
}
