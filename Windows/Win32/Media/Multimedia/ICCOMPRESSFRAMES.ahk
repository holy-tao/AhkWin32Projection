#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The ICCOMPRESSFRAMES structure contains compression parameters used with the ICM_COMPRESS_FRAMES_INFO message.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-iccompressframes
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct ICCOMPRESSFRAMES {
    #StructPack 8

    /**
     * Applicable flags. The following value is defined: <b>ICCOMPRESSFRAMES_PADDING</b>. If this value is used, padding is used with the frame.
     */
    dwFlags : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output format.
     */
    lpbiOutput : BITMAPINFOHEADER.Ptr

    /**
     * Reserved; do not use.
     */
    lOutput : LPARAM

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format.
     */
    lpbiInput : BITMAPINFOHEADER.Ptr

    /**
     * Reserved; do not use.
     */
    lInput : LPARAM

    /**
     * Number of the first frame to compress.
     */
    lStartFrame : Int32

    /**
     * Number of frames to compress.
     */
    lFrameCount : Int32

    /**
     * Quality setting.
     */
    lQuality : Int32

    /**
     * Maximum data rate, in bytes per second.
     */
    lDataRate : Int32

    /**
     * Maximum number of frames between consecutive key frames.
     */
    lKeyRate : Int32

    /**
     * Compression rate in an integer format. To obtain the rate in frames per second, divide this value by the value in <b>dwScale</b>.
     */
    dwRate : UInt32

    /**
     * Value used to scale <b>dwRate</b> to frames per second.
     */
    dwScale : UInt32

    /**
     * Reserved; do not use.
     */
    dwOverheadPerFrame : UInt32

    /**
     * Reserved; do not use.
     */
    dwReserved2 : UInt32

    /**
     * Reserved; do not use.
     */
    GetData : IntPtr

    /**
     * Reserved; do not use.
     */
    PutData : IntPtr

}
