#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains inverse telecine (IVTC) statistics from a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * If the DXVA-HD device supports IVTC statistics, it can detect when the input video contains telecined frames. You can use this information to enable IVTC in the device.
 * 
 * To enable IVTC statistics, do the following:
 * 
 * <ol>
 * <li>Allocate a <b>DXVAHD_STREAM_STATE_PRIVATE_IVTC_DATA</b> structure and set the <b>Enable</b> member to <b>TRUE</b>.</li>
 * <li>Initialize a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_private_data">DXVAHD_STREAM_STATE_PRIVATE_DATA</a> structure with these values:<ul>
 * <li>Set <b>Guid</b>  to <b>DXVAHD_STREAM_STATE_PRIVATE_IVTC</b>.</li>
 * <li>Set <b>DataSize</b> to <c>sizeof(DXVAHD_STREAM_STATE_PRIVATE_IVTC_DATA)</c>.</li>
 * <li>Set <b>pData</b>  to point to the <b>DXVAHD_STREAM_STATE_PRIVATE_IVTC_DATA</b> structure.</li>
 * </ul>
 * </li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessstreamstate">IDXVAHD_VideoProcessor::SetVideoProcessStreamState</a> method. Set the <i>State</i> parameter of that method to <b>DXVAHD_STREAM_STATE_PRIVATE</b> and the <i>pData</i>  parameter to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_private_data">DXVAHD_STREAM_STATE_PRIVATE_DATA</a> structure.</li>
 * </ol>
 * To get the most recent IVTC statistics from the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-getvideoprocessstreamstate">IDXVAHD_VideoProcessor::GetVideoProcessStreamState</a> method. The state parameter and data buffer are the same.
 * 
 * Typically, an application would use this feature as follows:
 * 
 * <ol>
 * <li>Enable IVTC statistics.</li>
 * <li>Begin sending interlaced video frames to the DXVA-HD device.</li>
 * <li>At some point, query the device for the current IVTC statistics.</li>
 * <li>If the device detects telecined frames, use a custom frame rate to perform IVTC. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_custom_rate_data">DXVAHD_CUSTOM_RATE_DATA</a>.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_private_ivtc_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_STREAM_STATE_PRIVATE_IVTC_DATA {
    #StructPack 4

    /**
     * Specifies whether IVTC statistics are enabled. The default state value is <b>FALSE</b>. Setting the value to <b>TRUE</b> enables IVTC statistics, and resets all of the IVTC statistical data to zero.
     */
    Enable : BOOL

    /**
     * If the driver detects that the frames are telecined, and is able to perform inverse telecine, this field contains a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_itelecine_caps">DXVAHD_ITELECINE_CAPS</a> enumeration. Otherwise, the value is 0.
     */
    ITelecineFlags : UInt32

    /**
     * The number of consecutive telecined frames that the device has detected.
     */
    Frames : UInt32

    /**
     * The index of the most recent input field. The value  of this member equals the most recent value of the <b>InputFrameOrField</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_data">DXVAHD_STREAM_DATA</a> structure.
     */
    InputField : UInt32

}
