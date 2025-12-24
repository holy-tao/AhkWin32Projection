#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVAHD_RATIONAL.ahk

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
 * @version v4.0.30319
 */
class DXVAHD_CUSTOM_RATE_DATA extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The ratio of the output frame rate to the input frame rate, expressed as a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure that holds a rational number.
     * @type {DXVAHD_RATIONAL}
     */
    CustomRate{
        get {
            if(!this.HasProp("__CustomRate"))
                this.__CustomRate := DXVAHD_RATIONAL(0, this)
            return this.__CustomRate
        }
    }

    /**
     * The number of output frames that will be generated for every <i>N</i> input samples, where <i>N</i> = <b>InputFramesOrFields</b>.
     * @type {Integer}
     */
    OutputFrames {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If <b>TRUE</b>, the input stream must be interlaced<b></b>. Otherwise, the input stream must be progressive.
     * @type {BOOL}
     */
    InputInterlaced {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The number of input fields or frames for every <i>N</i> output frames that will be generated, where <i>N</i> = <b>OutputFrames</b>.
     * @type {Integer}
     */
    InputFramesOrFields {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
