#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used by a dynamic virtual channel plug-in to render bitmaps.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderer
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSBitmapRenderer extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} imageFormat 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @param {Integer} cbStride 
     * @param {Integer} cbImageBuffer 
     * @param {Pointer<Byte>} pImageBuffer 
     * @returns {HRESULT} 
     */
    Render(imageFormat, dwWidth, dwHeight, cbStride, cbImageBuffer, pImageBuffer) {
        result := ComCall(3, this, "ptr", imageFormat, "uint", dwWidth, "uint", dwHeight, "int", cbStride, "uint", cbImageBuffer, "char*", pImageBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BITMAP_RENDERER_STATISTICS>} pStatistics 
     * @returns {HRESULT} 
     */
    GetRendererStatistics(pStatistics) {
        result := ComCall(4, this, "ptr", pStatistics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveMapping() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
