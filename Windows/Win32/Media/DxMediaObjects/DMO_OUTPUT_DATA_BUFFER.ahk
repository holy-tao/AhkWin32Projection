#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DMO_OUTPUT_DATA_BUFFER structure describes an output buffer used by a Microsoft DirectX Media Object (DMO).
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/ns-mediaobj-dmo_output_data_buffer
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class DMO_OUTPUT_DATA_BUFFER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nn-mediaobj-imediabuffer">IMediaBuffer</a> interface of a buffer allocated by the application.
     * @type {IMediaBuffer}
     */
    pBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Status flags. After processing output, the DMO sets this member to a bitwise combination of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_output_data_buffer_flags">DMO_OUTPUT_DATA_BUFFER_FLAGS</a> flags.
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Time stamp that specifies the start time of the data in the buffer. If the buffer has a valid time stamp, the DMO sets this member and also sets the DMO_OUTPUT_DATA_BUFFERF_TIME flag in the <b>dwStatus</b> member. Otherwise, ignore this member.
     * @type {Integer}
     */
    rtTimestamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Reference time specifying the length of the data in the buffer. If the DMO sets this member to a valid value, it also sets the DMO_OUTPUT_DATA_BUFFERF_TIMELENGTH flag in the <b>dwStatus</b> member. Otherwise, ignore this member.
     * @type {Integer}
     */
    rtTimelength {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
