#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DXVAHD_RATIONAL.ahk" { DXVAHD_RATIONAL }

/**
 * Specifies a custom rate for frame-rate conversion or inverse telecine (IVTC). (DXVAHD_CUSTOM_RATE_DATA)
 * @remarks
 * The <b>CustomRate</b> member gives the rate conversion factor, while the remaining members define the pattern of input and output samples. 
 * 
 * Here are some example uses for this structure:
 * 
 * <ul>
 * <li>
 * Frame rate conversion from 60p to 120p (doubling the frame rate).
 * 
 * <ul>
 * <li><b>CustomRate</b>: 2/1</li>
 * <li><b>OutputFrames</b>: 2</li>
 * <li><b>InputInterlaced</b>: <b>FALSE</b></li>
 * <li><b>InputFramesOrFields</b>: 1</li>
 * </ul>
 * </li>
 * <li>
 * Reverse 2:3 pulldown (IVTC) from 60i to 24p.
 * 
 * <ul>
 * <li><b>CustomRate</b>: 4/5</li>
 * <li><b>OutputFrames</b>: 4</li>
 * <li><b>InputInterlaced</b>: <b>TRUE</b></li>
 * <li><b>InputFramesOrFields</b>: 10</li>
 * </ul>
 * (Ten interlaced fields are converted into four progressive frames.)
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_custom_rate_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_CUSTOM_RATE_DATA {
    #StructPack 4

    /**
     * The ratio of the output frame rate to the input frame rate, expressed as a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure that holds a rational number.
     */
    CustomRate : DXVAHD_RATIONAL

    /**
     * The number of output frames that will be generated for every <i>N</i> input samples, where <i>N</i> = <b>InputFramesOrFields</b>.
     */
    OutputFrames : UInt32

    /**
     * If <b>TRUE</b>, the input stream must be interlaced<b></b>. Otherwise, the input stream must be progressive.
     */
    InputInterlaced : BOOL

    /**
     * The number of input fields or frames for every <i>N</i> output frames that will be generated, where <i>N</i> = <b>OutputFrames</b>.
     */
    InputFramesOrFields : UInt32

}
