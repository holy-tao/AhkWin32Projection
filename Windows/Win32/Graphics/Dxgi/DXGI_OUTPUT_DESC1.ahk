#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\Gdi\HMONITOR.ahk

/**
 * Describes an output or physical connection between the adapter (video card) and a device, including additional information about color capabilities and connection type.
 * @remarks
 * 
 * The <b>DXGI_OUTPUT_DESC1</b> structure is initialized by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/nf-dxgi1_6-idxgioutput6-getdesc1">IDXGIOutput6::GetDesc1</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/ns-dxgi1_6-dxgi_output_desc1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OUTPUT_DESC1 extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Type: <b>WCHAR[32]</b>
     * 
     * A string that contains the name of the output device.
     * @type {String}
     */
    DeviceName {
        get => StrGet(this.ptr + 0, 31, "UTF-16")
        set => StrPut(value, this.ptr + 0, 31, "UTF-16")
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the bounds of the output in desktop coordinates. Desktop coordinates depend on the dots per inch (DPI) of the desktop.
     * 	  For info about writing DPI-aware Win32 apps, see <a href="https://docs.microsoft.com/windows/desktop/hidpi/high-dpi-desktop-application-development-on-windows">High DPI</a>.
     * @type {RECT}
     */
    DesktopCoordinates{
        get {
            if(!this.HasProp("__DesktopCoordinates"))
                this.__DesktopCoordinates := RECT(64, this)
            return this.__DesktopCoordinates
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * True if the output is attached to the desktop; otherwise, false.
     * @type {BOOL}
     */
    AttachedToDesktop {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a> enumerated type describing on how an image is rotated by the output.
     * @type {Integer}
     */
    Rotation {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMONITOR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMONITOR</a> handle that represents the display monitor. For more information, see <a href="https://docs.microsoft.com/windows/desktop/gdi/hmonitor-and-the-device-context">HMONITOR and the Device Context</a>.
     * @type {HMONITOR}
     */
    Monitor{
        get {
            if(!this.HasProp("__Monitor"))
                this.__Monitor := HMONITOR(88, this)
            return this.__Monitor
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The number of bits per color channel for the active wire format of the display attached to this output.
     * @type {Integer}
     */
    BitsPerColor {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * The current advanced color capabilities of the display attached to this output. Specifically, whether its capable of reproducing color and luminance values outside of the sRGB color space.
     * 	    A value of DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709 indicates that the display is limited to SDR/sRGB; A value of DXGI_COLOR_SPACE_RGB_FULL_G2048_NONE_P2020 indicates that the display supports
     * 	    advanced color capabilities.
     * 
     * For detailed luminance and color capabilities, see additional members of this struct.
     * @type {Integer}
     */
    ColorSpace {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * Type: <b>FLOAT[2]</b>
     * 
     * The red color primary, in xy coordinates, of the display attached to this output. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     * @type {Array<Single>}
     */
    RedPrimary{
        get {
            if(!this.HasProp("__RedPrimaryProxyArray"))
                this.__RedPrimaryProxyArray := Win32FixedArray(this.ptr + 104, 2, Primitive, "float")
            return this.__RedPrimaryProxyArray
        }
    }

    /**
     * Type: <b>FLOAT[2]</b>
     * 
     * The green color primary, in xy coordinates, of the display attached to this output. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     * @type {Array<Single>}
     */
    GreenPrimary{
        get {
            if(!this.HasProp("__GreenPrimaryProxyArray"))
                this.__GreenPrimaryProxyArray := Win32FixedArray(this.ptr + 112, 2, Primitive, "float")
            return this.__GreenPrimaryProxyArray
        }
    }

    /**
     * Type: <b>FLOAT[2]</b>
     * 
     * The blue color primary, in xy coordinates, of the display attached to this output. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     * @type {Array<Single>}
     */
    BluePrimary{
        get {
            if(!this.HasProp("__BluePrimaryProxyArray"))
                this.__BluePrimaryProxyArray := Win32FixedArray(this.ptr + 120, 2, Primitive, "float")
            return this.__BluePrimaryProxyArray
        }
    }

    /**
     * Type: <b>FLOAT[2]</b>
     * 
     * The white point, in xy coordinates, of the display attached to this output. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     * @type {Array<Single>}
     */
    WhitePoint{
        get {
            if(!this.HasProp("__WhitePointProxyArray"))
                this.__WhitePointProxyArray := Win32FixedArray(this.ptr + 128, 2, Primitive, "float")
            return this.__WhitePointProxyArray
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The minimum luminance, in nits, that the display attached to this output is capable of rendering. Content should not exceed this minimum value for optimal rendering. This value will
     * 	  usually come from the EDID of the corresponding display or sometimes from an override.
     * @type {Float}
     */
    MinLuminance {
        get => NumGet(this, 136, "float")
        set => NumPut("float", value, this, 136)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The maximum luminance, in nits, that the display attached to this output is capable of rendering; this value is likely only valid for a small area of the panel. Content should not exceed
     * 	  this minimum value for optimal rendering. This value will usually come from the EDID of the corresponding display or sometimes from an override.
     * @type {Float}
     */
    MaxLuminance {
        get => NumGet(this, 140, "float")
        set => NumPut("float", value, this, 140)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The maximum luminance, in nits, that the display attached to this output is capable of rendering; unlike MaxLuminance, this value is valid for a color that fills the entire area of the
     * 	  panel. Content should not exceed this value across the entire panel for optimal rendering. This value will usually come from the EDID of the corresponding display or sometimes from an
     * 	  override.
     * @type {Float}
     */
    MaxFullFrameLuminance {
        get => NumGet(this, 144, "float")
        set => NumPut("float", value, this, 144)
    }
}
