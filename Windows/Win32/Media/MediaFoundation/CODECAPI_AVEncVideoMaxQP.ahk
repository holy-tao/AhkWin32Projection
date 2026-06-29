#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct CODECAPI_AVEncVideoMaxQP {
    #StructPack 1

}
