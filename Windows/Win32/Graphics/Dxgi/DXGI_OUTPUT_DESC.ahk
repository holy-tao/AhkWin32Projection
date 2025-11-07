#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\Gdi\HMONITOR.ahk

/**
 * Describes an output or physical connection between the adapter (video card) and a device.
 * @remarks
 * 
 * The <b>DXGI_OUTPUT_DESC</b> structure is initialized by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdesc">IDXGIOutput::GetDesc</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/ns-dxgi-dxgi_output_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OUTPUT_DESC extends Win32Struct
{
    static sizeof => 96

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
     * For info about writing DPI-aware Win32 apps, see <a href="https://docs.microsoft.com/windows/desktop/hidpi/high-dpi-desktop-application-development-on-windows">High DPI</a>.
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
}
