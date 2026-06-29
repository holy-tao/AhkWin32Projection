#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\DXGI_MODE_ROTATION.ahk" { DXGI_MODE_ROTATION }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Gdi\HMONITOR.ahk" { HMONITOR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes an output or physical connection between the adapter (video card) and a device.
 * @remarks
 * The <b>DXGI_OUTPUT_DESC</b> structure is initialized by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdesc">IDXGIOutput::GetDesc</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_output_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OUTPUT_DESC {
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
     * For info about writing DPI-aware Win32 apps, see <a href="https://docs.microsoft.com/windows/desktop/hidpi/high-dpi-desktop-application-development-on-windows">High DPI</a>.
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

}
