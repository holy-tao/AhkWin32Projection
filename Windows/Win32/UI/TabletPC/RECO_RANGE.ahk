#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The structure is obsolete.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_range
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct RECO_RANGE {
    #StructPack 4

    /**
     * Zero-based index in the string of the current alternate that marks the beginning of the recognition segment.
     */
    iwcBegin : UInt32

    /**
     * Count of characters in the range.
     */
    cCount : UInt32

}
