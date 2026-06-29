#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\PDF_RENDER_PARAMS.ahk" { PDF_RENDER_PARAMS }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Graphics\Dxgi\IDXGISurface.ahk" { IDXGISurface }
#Import "..\..\..\Graphics\Direct2D\ID2D1DeviceContext.ahk" { ID2D1DeviceContext }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a high-performance API for displaying a single page of a Portable Document Format (PDF) file.
 * @remarks
 * This API is specifically designed for DirectX apps that use C++ and Extensible Application Markup Language (XAML).
 * 
 * To get an instance of the <b>IPdfRendererNative</b> interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-pdfcreaterenderer">PdfCreateRenderer</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/nn-windows-data-pdf-interop-ipdfrenderernative
 * @namespace Windows.Win32.System.WinRT.Pdf
 */
export default struct IPdfRendererNative extends IUnknown {
    /**
     * The interface identifier for IPdfRendererNative
     * @type {Guid}
     */
    static IID := Guid("{7d9dcd91-d277-4947-8527-07a0daeda94a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPdfRendererNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RenderPageToSurface       : IntPtr
        RenderPageToDeviceContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPdfRendererNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(3, this, "ptr", pdfPage, "ptr", pSurface, POINT, offset, PDF_RENDER_PARAMS.Ptr, pRenderParams, "HRESULT")
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
        result := ComCall(4, this, "ptr", pdfPage, "ptr", pD2DDeviceContext, PDF_RENDER_PARAMS.Ptr, pRenderParams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPdfRendererNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RenderPageToSurface := CallbackCreate(GetMethod(implObj, "RenderPageToSurface"), flags, 5)
        this.vtbl.RenderPageToDeviceContext := CallbackCreate(GetMethod(implObj, "RenderPageToDeviceContext"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RenderPageToSurface)
        CallbackFree(this.vtbl.RenderPageToDeviceContext)
    }
}
