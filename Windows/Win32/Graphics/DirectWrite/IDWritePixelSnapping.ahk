#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<BOOL>} isDisabled 
     * @returns {HRESULT} 
     */
    IsPixelSnappingDisabled(clientDrawingContext, isDisabled) {
        result := ComCall(3, this, "ptr", clientDrawingContext, "ptr", isDisabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritepixelsnapping-getcurrenttransform
     */
    GetCurrentTransform(clientDrawingContext, transform) {
        result := ComCall(4, this, "ptr", clientDrawingContext, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Pointer<Float>} pixelsPerDip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritepixelsnapping-getpixelsperdip
     */
    GetPixelsPerDip(clientDrawingContext, pixelsPerDip) {
        result := ComCall(5, this, "ptr", clientDrawingContext, "float*", pixelsPerDip, "HRESULT")
        return result
    }
}
