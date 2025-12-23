#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoUseLTRFrame extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
