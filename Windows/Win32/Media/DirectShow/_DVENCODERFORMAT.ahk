#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the digital video (DV) format.
 * @remarks
 * 
 * This enumeration specifies the <b>fccType</b> member of the AVI stream header. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dv-data-in-the-avi-file-format">DV Data in the AVI File Format</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-_dvencoderformat
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _DVENCODERFORMAT{

    /**
     * Use the 'dvsd' stream handler.
     * @type {Integer (Int32)}
     */
    static DVENCODERFORMAT_DVSD => 2007

    /**
     * Use the 'dvhd' stream handler.
     * @type {Integer (Int32)}
     */
    static DVENCODERFORMAT_DVHD => 2008

    /**
     * Use the 'dvsl' stream handler.
     * @type {Integer (Int32)}
     */
    static DVENCODERFORMAT_DVSL => 2009
}
