#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies that the current frame is encoded using one or multiple LTR frames.
 * @remarks
 * **H.264/AVC encoders:**
 * 
 * This property should not be called if a pending call to use an LTR frame has been issued using the CODECAPI\_AVEncVideoUseLTRFrame property and the encoder has not yet generated a frame that has used the LTR. In other words, the encoder should not queue up CODECAPI\_AVEncVideoUseLTRFrame requests.
 * 
 * If a CODECAPI\_AVEncVideoUseLTRFrame request is submitted while another CODECAPI\_AVEncVideoUseLTRFrame request is still pending, then the older request should be dropped.
 * 
 * Calling CODECAPI\_AVEncVideoUseLTRFrame on a non-base layer frame is valid and shall apply to the non-base layer frame, without delay to a base layer frame.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideouseltrframe
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncVideoUseLTRFrame {
    #StructPack 1

}
