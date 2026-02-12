#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPGraphCreation interface provides methods that Windows Media Player calls to enable you to manage the DirectShow filter graph.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nn-wmpservices-iwmpgraphcreation
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
     * @remarks
     * You can call <b>QueryInterface</b> through <i>pFilterGraph</i> to retrieve the DirectShow filter graph interfaces you require.
     * 
     * There is no guarantee that this method will be invoked for all files.  Only files rendered with DirectShow will cause this method to be invoked and the WMPGC_FLAGS_USE_CUSTOM_GRAPH flag to be honored. CD, DVD, Image, Flash, Windows Media Format SDK, and Media Foundation playback will not invoke this method.
     * 
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {IUnknown} pFilterGraph Pointer to the <b>IUnknown</b> interface of the Windows Media Player control's DirectShow filter graph.
     * @param {IUnknown} pReserved Reserved for future use.
     * @returns {HRESULT} Return a success <b>HRESULT</b> to allow playback to continue or a failure code to terminate playback.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpgraphcreation-graphcreationprerender
     */
    GraphCreationPreRender(pFilterGraph, pReserved) {
        result := ComCall(3, this, "ptr", pFilterGraph, "ptr", pReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GraphCreationPostRender method is called by Windows Media Player after a file has been rendered.
     * @remarks
     * You can call <b>QueryInterface</b> through <i>pFilterGraph</i> to retrieve the DirectShow filter graph interfaces you need.
     * 
     * There is no guarantee that this method will be invoked for all files.  Only files rendered with DirectShow will cause this method to be invoked and the WMPGC_FLAGS_USE_CUSTOM_GRAPH flag to be honored. CD, DVD, Image, Flash, Windows Media Format SDK, and Media Foundation playback will not invoke this method.
     * 
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {IUnknown} pFilterGraph Pointer to the <b>IUnknown</b> interface of the Windows Media Player control's DirectShow filter graph.
     * @returns {HRESULT} Return a success <b>HRESULT</b> code to allow playback to continue or a failure code to terminate playback.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpgraphcreation-graphcreationpostrender
     */
    GraphCreationPostRender(pFilterGraph) {
        result := ComCall(4, this, "ptr", pFilterGraph, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * One of the flags documented on this page is available in Windows Media Player 10 and Windows Media Player 11 running on Microsoft Windows XP. It might not be available in subsequent versions.
     * @remarks
     * The following table describes the graph creation flags.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WMPGC_FLAGS_ALLOW_PREROLL</td>
     * <td>0x1</td>
     * <td>Windows Media Player will build the filter graph for the next media item before the current media item finishes playing.</td>
     * </tr>
     * <tr>
     * <td>WMPGC_FLAGS_SUPPRESS_DIALOGS</td>
     * <td>0x2</td>
     * <td>Windows Media Player will not display warning dialog boxes when errors occur.</td>
     * </tr>
     * <tr>
     * <td>WMPGC_FLAGS_IGNORE_AV_SYNC</td>
     * <td>0x4</td>
     * <td>Windows Media Player will not require audio and video to be synchronized when playing Windows Media-based content (.asf, .wma, or .wmv). Windows Media Player will attempt to play every frame of video. This occurs even when video data is arriving more slowly than audio data. 
     * 					<div class="alert"><b>Note</b>  This flag is supported only in Windows Media Player 10 or 11 running on Microsoft Windows XP.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>WMPGC_FLAGS_DISABLE_PLUGINS</td>
     * <td>0x8</td>
     * <td>Disables all plug-ins for the current instance of the Windows Media Player control. This includes plug-ins native to Windows Media Player. For example, visualizations will not work when this flag is set.</td>
     * </tr>
     * <tr>
     * <td>WMPGC_FLAGS_USE_CUSTOM_GRAPH</td>
     * <td>0x10</td>
     * <td>Windows Media Player will use the application-provided DirectShow graph as-is and not attempt to further render the originally requested URL or file. Plug-ins will still be added to the custom graph unless the <b>WMPGC_FLAGS_DISABLE_PLUGINS</b> flag is also set. Set both these flags if you want WMP to use the provided graph without any changes. Requires Windows Media Player 12.</td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpgraphcreation-getgraphcreationflags
     */
    GetGraphCreationFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwFlagsMarshal, pdwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
