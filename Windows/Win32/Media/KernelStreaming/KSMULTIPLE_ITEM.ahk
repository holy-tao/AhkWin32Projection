#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The KSMULTIPLE\_ITEM structure describes the size and count of variable-length properties on kernel-mode pins.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/ksmultiple-item
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSMULTIPLE_ITEM {
    #StructPack 4

    /**
     * Size of the returned memory block, in bytes. The size includes the **KSMULTIPLE\_ITEM** structure and the items that follow it.
     */
    Size : UInt32

    /**
     * Specifies the total number of items that follow this structure.
     */
    Count : UInt32

}
