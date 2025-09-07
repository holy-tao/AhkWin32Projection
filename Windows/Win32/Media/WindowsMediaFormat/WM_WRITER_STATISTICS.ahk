#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_WRITER_STATISTICS structure describes the performance of a writing operation.
 * @remarks
 * Sample rates are specified in kilohertz. For instance, a sample rate of 8 indicates 8000 samples per second.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_writer_statistics
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_WRITER_STATISTICS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * <b>QWORD</b> containing the sample count.
     * @type {Integer}
     */
    qwSampleCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>QWORD</b> containing the byte count.
     * @type {Integer}
     */
    qwByteCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <b>QWORD</b> containing the dropped sample count.
     * @type {Integer}
     */
    qwDroppedSampleCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>QWORD</b> containing the dropped byte count.
     * @type {Integer}
     */
    qwDroppedByteCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <b>DWORD</b> containing the current bit rate.
     * @type {Integer}
     */
    dwCurrentBitrate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * <b>DWORD</b> containing the average bit rate.
     * @type {Integer}
     */
    dwAverageBitrate {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * <b>DWORD</b> containing the expected bit rate.
     * @type {Integer}
     */
    dwExpectedBitrate {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * <b>DWORD</b> containing the current sample rate.
     * @type {Integer}
     */
    dwCurrentSampleRate {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * <b>DWORD</b> containing the average sample rate.
     * @type {Integer}
     */
    dwAverageSampleRate {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * <b>DWORD</b> containing the expected sample rate.
     * @type {Integer}
     */
    dwExpectedSampleRate {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
