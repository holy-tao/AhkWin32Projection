#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }

/**
 * The ICOPEN structure contains information about the data stream being compressed or decompressed, the version number of the driver, and how the driver is used.
 * @remarks
 * This structure is passed to video capture drivers when they are opened. This allows a single installable driver to function as either an installable compressor or a video capture device. By examining the <b>fccType</b> member of the <b>ICOPEN</b> structure, the driver can determine its function. For example, a <b>fccType</b> value of "VIDC" indicates that it is opened as an installable video compressor.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-icopen
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct ICOPEN {
    #StructPack 8

    /**
     * Size, in bytes, of the structure.
     */
    dwSize : UInt32

    /**
     * Four-character code indicating the type of stream being compressed or decompressed. Specify "VIDC" for video streams.
     */
    fccType : UInt32

    /**
     * Four-character code identifying a specific compressor.
     */
    fccHandler : UInt32

    /**
     * Version of the installable driver interface used to open the driver.
     */
    dwVersion : UInt32

    /**
     * Applicable flags indicating why the driver is opened. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_COMPRESS"></a><a id="icmode_compress"></a><dl>
     * <dt><b>ICMODE_COMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver is opened to compress data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_DECOMPRESS"></a><a id="icmode_decompress"></a><dl>
     * <dt><b>ICMODE_DECOMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver is opened to decompress data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_DRAW"></a><a id="icmode_draw"></a><dl>
     * <dt><b>ICMODE_DRAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device driver is opened to decompress data directly to hardware.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_QUERY"></a><a id="icmode_query"></a><dl>
     * <dt><b>ICMODE_QUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver is opened for informational purposes, rather than for compression.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    dwError : LRESULT

    /**
     * Reserved; do not use.
     */
    pV1Reserved : IntPtr

    /**
     * Reserved; do not use.
     */
    pV2Reserved : IntPtr

    /**
     * Device node for plug and play devices.
     */
    dnDevNode : UInt32

}
