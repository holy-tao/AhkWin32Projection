#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the digital video (DV) format.
 * @remarks
 * This enumeration specifies the <b>fccType</b> member of the AVI stream header. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dv-data-in-the-avi-file-format">DV Data in the AVI File Format</a>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_dvencoderformat
 * @namespace Windows.Win32.Media.DirectShow
 */
class _DVENCODERFORMAT extends Win32Enum {

    /**
     * Use the 'dvsd' stream handler.
     * Native name: DVENCODERFORMAT_DVSD
     * @type {Integer (Int32)}
     */
    static DVSD => 2007

    /**
     * Use the 'dvhd' stream handler.
     * Native name: DVENCODERFORMAT_DVHD
     * @type {Integer (Int32)}
     */
    static DVHD => 2008

    /**
     * Use the 'dvsl' stream handler.
     * Native name: DVENCODERFORMAT_DVSL
     * @type {Integer (Int32)}
     */
    static DVSL => 2009
}
