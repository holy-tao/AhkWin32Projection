#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Dxgi\Common\DXGI_RATIONAL.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Specifies a custom rate for frame-rate conversion or inverse telecine (IVTC).
 * @remarks
 * 
  * The <b>CustomRate</b> member gives the rate conversion factor, while the remaining members define the pattern of input and output samples.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_video_processor_custom_rate
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_CUSTOM_RATE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The ratio of the output frame rate to the input frame rate, expressed as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure that holds a rational number.
     * @type {DXGI_RATIONAL}
     */
    CustomRate{
        get {
            if(!this.HasProp("__CustomRate"))
                this.__CustomRate := DXGI_RATIONAL(this.ptr + 0)
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
     * If <b>TRUE</b>, the input stream must be interlaced. Otherwise, the input stream must be progressive.
     * @type {BOOL}
     */
    InputInterlaced{
        get {
            if(!this.HasProp("__InputInterlaced"))
                this.__InputInterlaced := BOOL(this.ptr + 12)
            return this.__InputInterlaced
        }
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
