#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the frame types (I, P, or B) that the quantization parameter (QP) is applied to.
 * @remarks
 * For encoders which support setting a quantization parameter (QP) for different frame types (I, P, B), they shall expose this API in addition to [CODECAPI\_AVEncVideoEncodeQP](codecapi-avencvideoencodeqp.md). If an encoder supports only a single QP for all frame types, they shall support only CODECAPI\_AVEncVideoEncodeQP.
 * 
 * This is a dynamic encoding property meaning that a new value can be set any time during the encoding session.
 * 
 * **H.264/AVC encoders:**
 * 
 * Encoder shall support [**GetValue**](/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue), [**SetValue**](/windows/desktop/api/strmif/nf-strmif-icodecapi-setvalue), and [**GetParameterRange**](/windows/desktop/api/strmif/nf-strmif-icodecapi-getparameterrange).
 * 
 * A set of four 16-bit fields are used to specify the frame QPs in fixed-QP encoding. The fields are:
 * 
 * -   **Bits 0-15:** QP used for I frames, valid range \[0, 51\].
 * -   **Bits 16-31:** QP used for P frames, valid range \[0, 51\].
 * -   **Bits 32-47:** QP used for B frames, valid range \[0, 51\]
 * -   **Bits 48-63:** reserved
 * 
 * When this CodecAPI is supported, encoders shall support QP setting on frame type of I, P, and B.
 * 
 * Default value shall be 0x0000001a001a001a. QP equal to 26 for I, P and B.
 * 
 * When [CODECAPI\_AVEncVideoSelectLayer](codecapi-avencvideoselectlayer.md) selects a specific temporal layer, [**SetValue**](/windows/desktop/api/strmif/nf-strmif-icodecapi-setvalue) of CODECAPI\_AVEncVideoEncodeFrameTypeQP shall set QP for I, P, and B frames on that temporal layer. By default, it sets QP for I, P, and B frames on base temporal layer temporal layer 0.
 * 
 * [CODECAPI\_AVEncVideoMaxQP](codecapi-avencvideomaxqp.md) and [CODECAPI\_AVEncVideoMinQP](codecapi-avencvideominqp.md) shall be used to define and limit the QP range for QPs of all picture types, I, P and B.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideoencodeframetypeqp
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoEncodeFrameTypeQP extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
