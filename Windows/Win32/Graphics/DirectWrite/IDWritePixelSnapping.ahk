#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_MATRIX.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the pixel snapping properties such as pixels per DIP(device-independent pixel) and the current transform matrix of a text renderer.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritepixelsnapping
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWritePixelSnapping extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWritePixelSnapping
     * @type {Guid}
     */
    static IID => Guid("{eaf3a2da-ecf4-4d24-b644-b34f6842024b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPixelSnappingDisabled", "GetCurrentTransform", "GetPixelsPerDip"]

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @returns {BOOL} 
     */
    IsPixelSnappingDisabled(clientDrawingContext) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, clientDrawingContextMarshal, clientDrawingContext, "int*", &isDisabled := 0, "HRESULT")
        return isDisabled
    }

    /**
     * Gets a transform that maps abstract coordinates to DIPs.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The drawing context passed to <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a>.
     * @returns {DWRITE_MATRIX} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * When this method returns, contains a structure which has transform information for  pixel snapping.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritepixelsnapping-getcurrenttransform
     */
    GetCurrentTransform(clientDrawingContext) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        transform := DWRITE_MATRIX()
        result := ComCall(4, this, clientDrawingContextMarshal, clientDrawingContext, "ptr", transform, "HRESULT")
        return transform
    }

    /**
     * Gets the number of physical pixels per DIP.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The drawing context passed to <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a>.
     * @returns {Float} Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the number of physical pixels per DIP.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritepixelsnapping-getpixelsperdip
     */
    GetPixelsPerDip(clientDrawingContext) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, clientDrawingContextMarshal, clientDrawingContext, "float*", &pixelsPerDip := 0, "HRESULT")
        return pixelsPerDip
    }
}
