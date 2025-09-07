#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Graphics\Direct2D\Common\D2D_RECT_F.ahk
#Include ..\..\..\Graphics\Direct2D\Common\D2D_COLOR_F.ahk

/**
 * Represents a set of properties for outputting a single page of a Portable Document Format (PDF) file.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-ipdfrenderernative-renderpagetodevicecontext">RenderPageToDeviceContext</a> and <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-ipdfrenderernative-renderpagetosurface">RenderPageToSurface</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/ns-windows-data-pdf-interop-pdf_render_params
 * @namespace Windows.Win32.System.WinRT.Pdf
 * @version v4.0.30319
 */
class PDF_RENDER_PARAMS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {D2D_RECT_F}
     */
    SourceRect{
        get {
            if(!this.HasProp("__SourceRect"))
                this.__SourceRect := D2D_RECT_F(this.ptr + 0)
            return this.__SourceRect
        }
    }

    /**
     * 
     * @type {Integer}
     */
    DestinationWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    DestinationHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {D2D_COLOR_F}
     */
    BackgroundColor{
        get {
            if(!this.HasProp("__BackgroundColor"))
                this.__BackgroundColor := D2D_COLOR_F(this.ptr + 24)
            return this.__BackgroundColor
        }
    }

    /**
     * 
     * @type {Integer}
     */
    IgnoreHighContrast {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }
}
