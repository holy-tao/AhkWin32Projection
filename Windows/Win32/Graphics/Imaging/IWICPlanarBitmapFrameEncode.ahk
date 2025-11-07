#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows planar component image pixels to be written to an encoder.
 * @remarks
 * 
 * Encoding YCbCr data using <b>IWICPlanarBitmapFrameEncode</b> is similar but not identical to encoding interleaved data using <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframeencode">IWICBitmapFrameEncode</a>. The planar interface only exposes the ability to write planar frame image data, and you should continue to use the frame encode interface to set metadata or a thumbnail and to commit at the end of the operation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicplanarbitmapframeencode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPlanarBitmapFrameEncode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICPlanarBitmapFrameEncode
     * @type {Guid}
     */
    static IID => Guid("{f928b7b8-2221-40c1-b72e-7e82f1974d1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WritePixels", "WriteSource"]

    /**
     * 
     * @param {Integer} lineCount 
     * @param {Pointer<WICBitmapPlane>} pPlanes 
     * @param {Integer} cPlanes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarbitmapframeencode-writepixels
     */
    WritePixels(lineCount, pPlanes, cPlanes) {
        result := ComCall(3, this, "uint", lineCount, "ptr", pPlanes, "uint", cPlanes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapSource>} ppPlanes 
     * @param {Integer} cPlanes 
     * @param {Pointer<WICRect>} prcSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarbitmapframeencode-writesource
     */
    WriteSource(ppPlanes, cPlanes, prcSource) {
        result := ComCall(4, this, "ptr*", ppPlanes, "uint", cPlanes, "ptr", prcSource, "HRESULT")
        return result
    }
}
