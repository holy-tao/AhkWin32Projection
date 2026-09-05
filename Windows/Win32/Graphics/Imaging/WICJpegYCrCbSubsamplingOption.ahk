#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the JPEG YCrCB subsampling options.
 * @remarks
 * The native JPEG encoder uses <b>WICJpegYCrCbSubsampling420</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegycrcbsubsamplingoption
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICJpegYCrCbSubsamplingOption extends Win32Enum {

    /**
     * The default subsampling option.
     * Native name: WICJpegYCrCbSubsamplingDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Subsampling option that uses both horizontal and vertical decimation.
     * Native name: WICJpegYCrCbSubsampling420
     * @type {Integer (Int32)}
     */
    static Subsampling420 => 1

    /**
     * Subsampling option that uses horizontal decimation  .
     * Native name: WICJpegYCrCbSubsampling422
     * @type {Integer (Int32)}
     */
    static Subsampling422 => 2

    /**
     * Subsampling option that uses no decimation.
     * Native name: WICJpegYCrCbSubsampling444
     * @type {Integer (Int32)}
     */
    static Subsampling444 => 3

    /**
     * Subsampling option that uses 2x vertical downsampling only. This option is only available in Windows 8.1 and later.
     * Native name: WICJpegYCrCbSubsampling440
     * @type {Integer (Int32)}
     */
    static Subsampling440 => 4
}
