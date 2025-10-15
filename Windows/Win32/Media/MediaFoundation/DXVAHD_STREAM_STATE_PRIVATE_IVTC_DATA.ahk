#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains inverse telecine (IVTC) statistics from a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_stream_state_private_ivtc_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_PRIVATE_IVTC_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies whether IVTC statistics are enabled. The default state value is <b>FALSE</b>. Setting the value to <b>TRUE</b> enables IVTC statistics, and resets all of the IVTC statistical data to zero.
     * @type {BOOL}
     */
    Enable{
        get {
            if(!this.HasProp("__Enable"))
                this.__Enable := BOOL(this.ptr + 0)
            return this.__Enable
        }
    }

    /**
     * If the driver detects that the frames are telecined, and is able to perform inverse telecine, this field contains a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_itelecine_caps">DXVAHD_ITELECINE_CAPS</a> enumeration. Otherwise, the value is 0.
     * @type {Integer}
     */
    ITelecineFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of consecutive telecined frames that the device has detected.
     * @type {Integer}
     */
    Frames {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The index of the most recent input field. The value  of this member equals the most recent value of the <b>InputFrameOrField</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_data">DXVAHD_STREAM_DATA</a> structure.
     * @type {Integer}
     */
    InputField {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
