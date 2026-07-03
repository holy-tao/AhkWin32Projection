#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Graphics\Direct2D\Common\D2D_COLOR_F.ahk" { D2D_COLOR_F }
#Import "..\..\..\Graphics\Direct2D\Common\D2D_RECT_F.ahk" { D2D_RECT_F }

/**
 * Represents a set of properties for outputting a single page of a Portable Document Format (PDF) file.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-ipdfrenderernative-renderpagetodevicecontext">RenderPageToDeviceContext</a> and <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-ipdfrenderernative-renderpagetosurface">RenderPageToSurface</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/ns-windows-data-pdf-interop-pdf_render_params
 * @namespace Windows.Win32.System.WinRT.Pdf
 */
export default struct PDF_RENDER_PARAMS {
    #StructPack 4

    SourceRect : D2D_RECT_F

    DestinationWidth : UInt32

    DestinationHeight : UInt32

    BackgroundColor : D2D_COLOR_F

    IgnoreHighContrast : BOOLEAN

}
