#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\DXGI_MODE_ROTATION.ahk" { DXGI_MODE_ROTATION }
#Import "Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Gdi\HMONITOR.ahk" { HMONITOR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes an output or physical connection between the adapter (video card) and a device, including additional information about color capabilities and connection type.
 * @remarks
 * The <b>DXGI_OUTPUT_DESC1</b> structure is initialized by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/nf-dxgi1_6-idxgioutput6-getdesc1">IDXGIOutput6::GetDesc1</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/ns-dxgi1_6-dxgi_output_desc1
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OUTPUT_DESC1 {
    #StructPack 8

    /**
     * Type: <b>WCHAR[32]</b>
     * 
     * A string that contains the name of the output device.
     */
    DeviceName : WCHAR[32]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the bounds of the output in desktop coordinates. Desktop coordinates depend on the dots per inch (DPI) of the desktop.
     * 	  For info about writing DPI-aware Win32 apps, see <a href="https://docs.microsoft.com/windows/desktop/hidpi/high-dpi-desktop-application-development-on-windows">High DPI</a>.
     */
    DesktopCoordinates : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * True if the output is attached to the desktop; otherwise, false.
     */
    AttachedToDesktop : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a> enumerated type describing on how an image is rotated by the output.
     */
    Rotation : DXGI_MODE_ROTATION

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMONITOR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMONITOR</a> handle that represents the display monitor. For more information, see <a href="https://docs.microsoft.com/windows/desktop/gdi/hmonitor-and-the-device-context">HMONITOR and the Device Context</a>.
     */
    Monitor : HMONITOR

    /**
     * Type: <b>UINT</b>
     * 
     * The number of bits per color channel for the active wire format of the display attached to this output.
     */
    BitsPerColor : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * The current advanced color capabilities of the display attached to this output. Specifically, whether its capable of reproducing color and luminance values outside of the sRGB color space.
     * 	    A value of DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709 indicates that the display is limited to SDR/sRGB; A value of DXGI_COLOR_SPACE_RGB_FULL_G2048_NONE_P2020 indicates that the display supports
     * 	    advanced color capabilities.
     * 
     * For detailed luminance and color capabilities, see additional members of this struct.
     */
    ColorSpace : DXGI_COLOR_SPACE_TYPE

    /**
     * Type: <b>FLOAT[2]</b>
     * 
     * The red color primary, in xy coordinates, of the display attached to this output. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     */
    RedPrimary : Float32[2]

    /**
     * Type: <b>FLOAT[2]</b>
     * 
     * The green color primary, in xy coordinates, of the display attached to this output. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     */
    GreenPrimary : Float32[2]

    /**
     * Type: <b>FLOAT[2]</b>
     * 
     * The blue color primary, in xy coordinates, of the display attached to this output. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     */
    BluePrimary : Float32[2]

    /**
     * Type: <b>FLOAT[2]</b>
     * 
     * The white point, in xy coordinates, of the display attached to this output. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     */
    WhitePoint : Float32[2]

    /**
     * Type: <b>FLOAT</b>
     * 
     * The minimum luminance, in nits, that the display attached to this output is capable of rendering. Content should not exceed this minimum value for optimal rendering. This value will
     * 	  usually come from the EDID of the corresponding display or sometimes from an override.
     */
    MinLuminance : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The maximum luminance, in nits, that the display attached to this output is capable of rendering; this value is likely only valid for a small area of the panel. Content should not exceed
     * 	  this minimum value for optimal rendering. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     */
    MaxLuminance : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The maximum luminance, in nits, that the display attached to this output is capable of rendering; unlike MaxLuminance, this value is valid for a color that fills the entire area of the
     * 	  panel. Content should not exceed this value across the entire panel for optimal rendering. This value will usually come from the EDID of the corresponding display or sometimes from an
     * 	  override.
     */
    MaxFullFrameLuminance : Float32

}
