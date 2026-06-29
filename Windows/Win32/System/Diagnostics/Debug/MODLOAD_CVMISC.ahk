#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains CodeView and Misc records.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-modload_cvmisc
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MODLOAD_CVMISC {
    #StructPack 8

    /**
     * The offset of the CodeView record.
     */
    oCV : UInt32

    /**
     * The size of the CodeView record.
     */
    cCV : IntPtr

    /**
     * The offset of the Misc record.
     */
    oMisc : UInt32

    /**
     * The size of the Misc record.
     */
    cMisc : IntPtr

    /**
     * The date/time stamp of the image.
     */
    dtImage : UInt32

    /**
     * The size of the image.
     */
    cImage : UInt32

}
