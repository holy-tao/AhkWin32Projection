#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\DXGI_RATIONAL.ahk
#Include Common\DXGI_MODE_DESC.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The DXGI_OUTDUPL_DESC structure describes the dimension of the output and the surface that contains the desktop image. The format of the desktop image is always DXGI_FORMAT_B8G8R8A8_UNORM.
 * @remarks
 * 
  * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getdesc">GetDesc</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/ns-dxgi1_2-dxgi_outdupl_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OUTDUPL_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> structure that describes the display mode of the duplicated output.
     * @type {DXGI_MODE_DESC}
     */
    ModeDesc{
        get {
            if(!this.HasProp("__ModeDesc"))
                this.__ModeDesc := DXGI_MODE_DESC(this.ptr + 0)
            return this.__ModeDesc
        }
    }

    /**
     * A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a> enumerated type that describes how the duplicated output rotates an image.
     * @type {Integer}
     */
    Rotation {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Specifies whether the resource that contains the desktop image is already located in system memory. <b>TRUE</b> if the resource is in system memory; otherwise, <b>FALSE</b>. If this value is <b>TRUE</b> and  the application requires CPU access, it can use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-mapdesktopsurface">IDXGIOutputDuplication::MapDesktopSurface</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-unmapdesktopsurface">IDXGIOutputDuplication::UnMapDesktopSurface</a> methods to avoid copying the data into a staging buffer.
     * @type {BOOL}
     */
    DesktopImageInSystemMemory{
        get {
            if(!this.HasProp("__DesktopImageInSystemMemory"))
                this.__DesktopImageInSystemMemory := BOOL(this.ptr + 36)
            return this.__DesktopImageInSystemMemory
        }
    }
}
