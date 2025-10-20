#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
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
     * 
     * @param {IUnknown} pdfPage 
     * @param {IDXGISurface} pSurface 
     * @param {POINT} offset 
     * @param {Pointer<PDF_RENDER_PARAMS>} pRenderParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-ipdfrenderernative-renderpagetosurface
     */
    RenderPageToSurface(pdfPage, pSurface, offset, pRenderParams) {
        result := ComCall(3, this, "ptr", pdfPage, "ptr", pSurface, "ptr", offset, "ptr", pRenderParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pdfPage 
     * @param {ID2D1DeviceContext} pD2DDeviceContext 
     * @param {Pointer<PDF_RENDER_PARAMS>} pRenderParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-ipdfrenderernative-renderpagetodevicecontext
     */
    RenderPageToDeviceContext(pdfPage, pD2DDeviceContext, pRenderParams) {
        result := ComCall(4, this, "ptr", pdfPage, "ptr", pD2DDeviceContext, "ptr", pRenderParams, "HRESULT")
        return result
    }
}
