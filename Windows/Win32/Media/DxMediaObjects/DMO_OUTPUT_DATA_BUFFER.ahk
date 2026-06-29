#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMediaBuffer.ahk" { IMediaBuffer }

/**
 * The DMO_OUTPUT_DATA_BUFFER structure describes an output buffer used by a Microsoft DirectX Media Object (DMO).
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ns-mediaobj-dmo_output_data_buffer
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct DMO_OUTPUT_DATA_BUFFER {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nn-mediaobj-imediabuffer">IMediaBuffer</a> interface of a buffer allocated by the application.
     */
    pBuffer : IMediaBuffer

    /**
     * Status flags. After processing output, the DMO sets this member to a bitwise combination of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_output_data_buffer_flags">DMO_OUTPUT_DATA_BUFFER_FLAGS</a> flags.
     */
    dwStatus : UInt32

    /**
     * Time stamp that specifies the start time of the data in the buffer. If the buffer has a valid time stamp, the DMO sets this member and also sets the DMO_OUTPUT_DATA_BUFFERF_TIME flag in the <b>dwStatus</b> member. Otherwise, ignore this member.
     */
    rtTimestamp : Int64

    /**
     * Reference time specifying the length of the data in the buffer. If the DMO sets this member to a valid value, it also sets the DMO_OUTPUT_DATA_BUFFERF_TIMELENGTH flag in the <b>dwStatus</b> member. Otherwise, ignore this member.
     */
    rtTimelength : Int64

}
