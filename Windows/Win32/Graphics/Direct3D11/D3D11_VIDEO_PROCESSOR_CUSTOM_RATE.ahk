#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies a custom rate for frame-rate conversion or inverse telecine (IVTC). (D3D11_VIDEO_PROCESSOR_CUSTOM_RATE)
 * @remarks
 * The <b>CustomRate</b> member gives the rate conversion factor, while the remaining members define the pattern of input and output samples.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_custom_rate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_PROCESSOR_CUSTOM_RATE {
    #StructPack 4

    /**
     * The ratio of the output frame rate to the input frame rate, expressed as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure that holds a rational number.
     */
    CustomRate : DXGI_RATIONAL

    /**
     * The number of output frames that will be generated for every <i>N</i> input samples, where <i>N</i> = <b>InputFramesOrFields</b>.
     */
    OutputFrames : UInt32

    /**
     * If <b>TRUE</b>, the input stream must be interlaced. Otherwise, the input stream must be progressive.
     */
    InputInterlaced : BOOL

    /**
     * The number of input fields or frames for every <i>N</i> output frames that will be generated, where <i>N</i> = <b>OutputFrames</b>.
     */
    InputFramesOrFields : UInt32

}
