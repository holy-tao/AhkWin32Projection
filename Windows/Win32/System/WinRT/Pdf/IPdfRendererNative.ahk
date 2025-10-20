#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Pdf
 * @version v4.0.30319
 */
class IPdfRendererNative extends IUnknown{
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
     * 
     * @param {Pointer<IUnknown>} pdfPage 
     * @param {Pointer<IDXGISurface>} pSurface 
     * @param {POINT} offset 
     * @param {Pointer<PDF_RENDER_PARAMS>} pRenderParams 
     * @returns {HRESULT} 
     */
    RenderPageToSurface(pdfPage, pSurface, offset, pRenderParams) {
        result := ComCall(3, this, "ptr", pdfPage, "ptr", pSurface, "ptr", offset, "ptr", pRenderParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pdfPage 
     * @param {Pointer<ID2D1DeviceContext>} pD2DDeviceContext 
     * @param {Pointer<PDF_RENDER_PARAMS>} pRenderParams 
     * @returns {HRESULT} 
     */
    RenderPageToDeviceContext(pdfPage, pD2DDeviceContext, pRenderParams) {
        result := ComCall(4, this, "ptr", pdfPage, "ptr", pD2DDeviceContext, "ptr", pRenderParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
