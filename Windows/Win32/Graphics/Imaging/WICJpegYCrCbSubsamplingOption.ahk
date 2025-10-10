#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the JPEG YCrCB subsampling options.
 * @remarks
 * 
  * The native JPEG encoder uses <b>WICJpegYCrCbSubsampling420</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicjpegycrcbsubsamplingoption
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegYCrCbSubsamplingOption{

    /**
     * The default subsampling option.
     * @type {Integer (Int32)}
     */
    static WICJpegYCrCbSubsamplingDefault => 0

    /**
     * Subsampling option that uses both horizontal and vertical decimation.
     * @type {Integer (Int32)}
     */
    static WICJpegYCrCbSubsampling420 => 1

    /**
     * Subsampling option that uses horizontal decimation  .
     * @type {Integer (Int32)}
     */
    static WICJpegYCrCbSubsampling422 => 2

    /**
     * Subsampling option that uses no decimation.
     * @type {Integer (Int32)}
     */
    static WICJpegYCrCbSubsampling444 => 3

    /**
     * Subsampling option that uses 2x vertical downsampling only. This option is only available in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static WICJpegYCrCbSubsampling440 => 4
}
