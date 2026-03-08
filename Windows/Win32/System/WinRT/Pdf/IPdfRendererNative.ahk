#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Represents a high-performance API for displaying a single page of a Portable Document Format (PDF) file.
 * @remarks
 * This API is specifically designed for DirectX apps that use C++ and Extensible Application Markup Language (XAML).
 * 
 * To get an instance of the <b>IPdfRendererNative</b> interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-pdfcreaterenderer">PdfCreateRenderer</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/nn-windows-data-pdf-interop-ipdfrenderernative
 * @namespace Windows.Win32.System.WinRT.Pdf
 * @version v4.0.30319
 */
class IPdfRendererNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPdfRendererNative
     * @type {Guid}
     */
    static IID => Guid("{7d9dcd91-d277-4947-8527-07a0daeda94a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenderPageToSurface", "RenderPageToDeviceContext"]

    /**
     * Outputs a single page of a Portable Document Format (PDF) file to a Microsoft DirectX image-data object.
     * @param {IUnknown} pdfPage The <b>IPdfPage</b> interface as an instance of the <a href="https://docs.microsoft.com/dotnet/api/pdfkit.pdfpage?view=xamarin-ios-sdk-12&preserve-view=true">PdfPage</a> class,  type-casted to the <b>IUnknown</b> interface, representing the page to be output.
     * @param {IDXGISurface} pSurface An instance of the target image-data object.
     * @param {POINT} offset An x- and y-coordinate offset within the target image-data object to output the page.
     * @param {Pointer<PDF_RENDER_PARAMS>} pRenderParams A set of page output properties, such as rendering only a portion of the page, rendering a scaled version of the page, setting the page's background color, and whether the page is shown in high contrast mode. 
     * 
     * Provide a null pointer for this parameter to specify default page output properties. For the list of defaults, see <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/ns-windows-data-pdf-interop-pdf_render_params">PDF_RENDER_PARAMS</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page output operation succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-ipdfrenderernative-renderpagetosurface
     */
    RenderPageToSurface(pdfPage, pSurface, offset, pRenderParams) {
        result := ComCall(3, this, "ptr", pdfPage, "ptr", pSurface, "ptr", offset, "ptr", pRenderParams, "HRESULT")
        return result
    }

    /**
     * The IPdfRendererNative::RenderPageToDeviceContext method outputs a single page of a Portable Document Format (PDF) file as a bitmap image.
     * @param {IUnknown} pdfPage The <b>IPdfPage</b> interface as an instance of the <a href="https://docs.microsoft.com/dotnet/api/pdfkit.pdfpage?view=xamarin-ios-sdk-12&preserve-view=true">PdfPage</a> class,  type-casted to the <b>IUnknown</b> interface, representing the page to be output.
     * @param {ID2D1DeviceContext} pD2DDeviceContext A set of state and command buffers for outputting the page as a bitmap image.
     * @param {Pointer<PDF_RENDER_PARAMS>} pRenderParams A set of page output properties, such as rendering only a portion of the page, rendering a scaled version of the page, setting the page's background color, and whether the page is shown in high contrast mode. 
     * 
     * Provide a null pointer for this parameter to specify default page output properties. For the list of defaults, see <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/ns-windows-data-pdf-interop-pdf_render_params">PDF_RENDER_PARAMS</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page output operation succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-ipdfrenderernative-renderpagetodevicecontext
     */
    RenderPageToDeviceContext(pdfPage, pD2DDeviceContext, pRenderParams) {
        result := ComCall(4, this, "ptr", pdfPage, "ptr", pD2DDeviceContext, "ptr", pRenderParams, "HRESULT")
        return result
    }
}
