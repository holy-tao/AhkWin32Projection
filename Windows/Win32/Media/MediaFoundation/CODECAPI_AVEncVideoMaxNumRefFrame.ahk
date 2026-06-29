#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the maximum reference frames supported by the encoder.
 * @remarks
 * For H.264, this maps to the Sequence Parameter Set variable **max\_num\_ref\_frames** as defined in H.264 specification.
 * 
 * **H.264/AVC encoders:**
 * 
 * Encoders may use fewer reference frames in order to obey the level specified in the bitstream.
 * 
 * Encoders shall support [**GetValue**](/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue), [**SetValue**](/windows/desktop/api/strmif/nf-strmif-icodecapi-setvalue), and [**GetParameterRangee**](/windows/desktop/api/strmif/nf-strmif-icodecapi-getparameterrange).
 * 
 * This is a static property meaning that it can only be set before the encoding session starts.
 * 
 * Recommended default value is 2.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideomaxnumrefframe
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncVideoMaxNumRefFrame {
    #StructPack 1

}
