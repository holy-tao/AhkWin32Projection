#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the slice control mode. Valid values are 0, 1, and 2.
 * @remarks
 * **H.264/AVC encoders:**
 * 
 * It is recommended that the encoder supports [**GetValue**](/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue), [**SetValue**](/windows/desktop/api/strmif/nf-strmif-icodecapi-setvalue), and [**GetParameterRange**](/windows/desktop/api/strmif/nf-strmif-icodecapi-getparameterrange).
 * 
 * If [**SetValue**](/windows/desktop/api/strmif/nf-strmif-icodecapi-setvalue) is not called for CODECAPI\_AVEncSliceControlMode, [**GetValue**](/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue) for CODECAPI\_AVEncSliceControlMode can return **VFW\_E\_CODECAPI\_NO\_CURRENT\_VALUE**. [**GetDefaultValue**](/windows/desktop/api/strmif/nf-strmif-icodecapi-getdefaultvalue) may return **VFW\_E\_CODECAPI\_NO\_DEFAULT** for CODECAPI\_AVEncSliceControlMode.
 * 
 * Recommended default value is 2 (size in MB row per slice).
 * 
 * This is a static API, which means the application won t change this while the encoder is running.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencslicecontrolmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncSliceControlMode {
    #StructPack 1

}
