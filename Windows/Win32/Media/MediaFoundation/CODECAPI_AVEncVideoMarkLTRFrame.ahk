#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Marks the current frame as a LTR frame.
 * @remarks
 * **H.264/AVC encoders:**
 * 
 * The value of this control is the value of H.264 syntax *LongTermFramIdx* associated with the current frame. If the current frame is not in the base layer, for example syntax element *temporal\_id* is not equal to 0, this property applies to the next base layer frame in encoding order.
 * 
 * This property should not be called if a pending call to mark an LTR frame has been issued using the CODECAPI\_AVEncVideoMarkLTRFrame property and the encoder has not yet marked a frame as LTR. In other words, the encoder should not queue up CODECAPI\_AVEncVideoMarkLTRFrame requests. If a CODECAPI\_AVEncVideoMarkLTRFrame request is submitted while another CODECAPI\_AVEncVideoMarkLTRFrame request is still pending, the older request should be dropped.
 * 
 * The CODECAPI\_AVEncVideoMarkLTRFrame property is dynamic and can be set during the encoding session.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideomarkltrframe
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoMarkLTRFrame extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
