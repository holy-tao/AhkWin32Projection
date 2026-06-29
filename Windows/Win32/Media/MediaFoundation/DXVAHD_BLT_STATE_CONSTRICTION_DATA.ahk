#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Specifies whether the output is downsampled in a blit operation, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * If the <b>Enable</b> member is <b>TRUE</b>, the device downsamples the composed target rectangle  to the size given in the <b>Size</b> member, and then scales it back to the size of the target rectangle.
 * 
 * The width and height of <b>Size</b> must be greater than zero. If the size is larger than the target rectangle, downsampling does not occur.
 * 
 * To use this state, the device must support downsampling, indicated by the <b>DXVAHD_FEATURE_CAPS_CONSTRICTION</b> capability flag. To query for this capability, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a>. If the device supports downsampling, it sets the <b>DXVAHD_FEATURE_CAPS_CONSTRICTION</b> flag in the <b>FeatureCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. 
 * 
 * If the device does not support downsampling, the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessbltstate">IDXVAHD_VideoProcessor::SetVideoProcessBltState</a> method fails for this state.
 * 
 * Downsampling is sometimes used to reduce the quality of premium content when other forms of content protection are not available.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_blt_state_constriction_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_BLT_STATE_CONSTRICTION_DATA {
    #StructPack 4

    /**
     * If <b>TRUE</b>, downsampling is enabled<b></b>. Otherwise, downsampling is disabled and the <b>Size</b> member is ignored. The default state value is <b>FALSE</b> (downsampling is disabled).
     */
    Enable : BOOL

    /**
     * The sampling size. The default value is (1,1).
     */
    Size : SIZE

}
