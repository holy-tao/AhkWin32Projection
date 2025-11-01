#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * This service is used to create a visual mapping on the client corresponding to a mapped window on the server.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderservice
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSBitmapRenderService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSBitmapRenderService
     * @type {Guid}
     */
    static IID => Guid("{ea326091-05fe-40c1-b49c-3d2ef4626a0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMappedRenderer"]

    /**
     * 
     * @param {Integer} mappingId 
     * @param {IWTSBitmapRendererCallback} pMappedRendererCallback 
     * @param {Pointer<IWTSBitmapRenderer>} ppMappedRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderservice-getmappedrenderer
     */
    GetMappedRenderer(mappingId, pMappedRendererCallback, ppMappedRenderer) {
        result := ComCall(3, this, "uint", mappingId, "ptr", pMappedRendererCallback, "ptr*", ppMappedRenderer, "HRESULT")
        return result
    }
}
