#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICCOMPRESSFRAMES structure contains compression parameters used with the ICM_COMPRESS_FRAMES_INFO message.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-iccompressframes
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICCOMPRESSFRAMES extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Applicable flags. The following value is defined: <b>ICCOMPRESSFRAMES_PADDING</b>. If this value is used, padding is used with the frame.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiOutput {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer}
     */
    lOutput {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiInput {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer}
     */
    lInput {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Number of the first frame to compress.
     * @type {Integer}
     */
    lStartFrame {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Number of frames to compress.
     * @type {Integer}
     */
    lFrameCount {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Quality setting.
     * @type {Integer}
     */
    lQuality {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Maximum data rate, in bytes per second.
     * @type {Integer}
     */
    lDataRate {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Maximum number of frames between consecutive key frames.
     * @type {Integer}
     */
    lKeyRate {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Compression rate in an integer format. To obtain the rate in frames per second, divide this value by the value in <b>dwScale</b>.
     * @type {Integer}
     */
    dwRate {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Value used to scale <b>dwRate</b> to frames per second.
     * @type {Integer}
     */
    dwScale {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dwOverheadPerFrame {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer}
     */
    GetData {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer}
     */
    PutData {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
