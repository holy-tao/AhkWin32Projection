#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BITMAP_RENDERER_STATISTICS.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used by a dynamic virtual channel plug-in to render bitmaps.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderer
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSBitmapRenderer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSBitmapRenderer
     * @type {Guid}
     */
    static IID => Guid("{5b7acc97-f3c9-46f7-8c5b-fa685d3441b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Render", "GetRendererStatistics", "RemoveMapping"]

    /**
     * 
     * @param {Guid} imageFormat 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @param {Integer} cbStride 
     * @param {Integer} cbImageBuffer 
     * @param {Pointer<Integer>} pImageBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderer-render
     */
    Render(imageFormat, dwWidth, dwHeight, cbStride, cbImageBuffer, pImageBuffer) {
        pImageBufferMarshal := pImageBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", imageFormat, "uint", dwWidth, "uint", dwHeight, "int", cbStride, "uint", cbImageBuffer, pImageBufferMarshal, pImageBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BITMAP_RENDERER_STATISTICS} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderer-getrendererstatistics
     */
    GetRendererStatistics() {
        pStatistics := BITMAP_RENDERER_STATISTICS()
        result := ComCall(4, this, "ptr", pStatistics, "HRESULT")
        return pStatistics
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderer-removemapping
     */
    RemoveMapping() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
