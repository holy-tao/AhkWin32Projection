#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPGraphCreation interface provides methods that Windows Media Player calls to enable you to manage the DirectShow filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmpgraphcreation
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPGraphCreation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPGraphCreation
     * @type {Guid}
     */
    static IID => Guid("{bfb377e5-c594-4369-a970-de896d5ece74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GraphCreationPreRender", "GraphCreationPostRender", "GetGraphCreationFlags"]

    /**
     * 
     * @param {IUnknown} pFilterGraph 
     * @param {IUnknown} pReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpgraphcreation-graphcreationprerender
     */
    GraphCreationPreRender(pFilterGraph, pReserved) {
        result := ComCall(3, this, "ptr", pFilterGraph, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pFilterGraph 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpgraphcreation-graphcreationpostrender
     */
    GraphCreationPostRender(pFilterGraph) {
        result := ComCall(4, this, "ptr", pFilterGraph, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpgraphcreation-getgraphcreationflags
     */
    GetGraphCreationFlags(pdwFlags) {
        result := ComCall(5, this, "uint*", pdwFlags, "HRESULT")
        return result
    }
}
