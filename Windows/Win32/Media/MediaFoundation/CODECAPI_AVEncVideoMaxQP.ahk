#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the maximum QP supported by the encoder.
 * @remarks
 * **H.264/AVC encoders:**
 * 
 * The encoder shall support[**GetValue**](/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue), [**SetValue**](/windows/desktop/api/strmif/nf-strmif-icodecapi-setvalue), and [**GetParameterRange**](/windows/desktop/api/strmif/nf-strmif-icodecapi-getparameterrange).
 * 
 * This is a static property meaning that it can only be set before the encoding session starts.
 * 
 * Default value shall be the max QP allowed by the corresponding coding standard. For example, H.264 encoders shall have a default value of 51.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideomaxqp
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoMaxQP extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
