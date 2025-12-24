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
     * The GraphCreationPreRender method is called by Windows Media Player before a file is rendered.
     * @param {IUnknown} pFilterGraph Pointer to the <b>IUnknown</b> interface of the Windows Media Player control's DirectShow filter graph.
     * @param {IUnknown} pReserved Reserved for future use.
     * @returns {HRESULT} Return a success <b>HRESULT</b> to allow playback to continue or a failure code to terminate playback.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpgraphcreation-graphcreationprerender
     */
    GraphCreationPreRender(pFilterGraph, pReserved) {
        result := ComCall(3, this, "ptr", pFilterGraph, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * The GraphCreationPostRender method is called by Windows Media Player after a file has been rendered.
     * @param {IUnknown} pFilterGraph Pointer to the <b>IUnknown</b> interface of the Windows Media Player control's DirectShow filter graph.
     * @returns {HRESULT} Return a success <b>HRESULT</b> code to allow playback to continue or a failure code to terminate playback.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpgraphcreation-graphcreationpostrender
     */
    GraphCreationPostRender(pFilterGraph) {
        result := ComCall(4, this, "ptr", pFilterGraph, "HRESULT")
        return result
    }

    /**
     * One of the flags documented on this page is available in Windows Media Player 10 and Windows Media Player 11 running on Microsoft Windows XP. It might not be available in subsequent versions.
     * @param {Pointer<Integer>} pdwFlags Address of a <b>DWORD</b> variable that receives a value that represents one or more graph creation flags combined by using bitwise OR operations.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpgraphcreation-getgraphcreationflags
     */
    GetGraphCreationFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }
}
