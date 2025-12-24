#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISelector interface is used to select source nodes in a stream class driver.
 * @remarks
 * 
 * A kernel-streaming (KS) filter contains one or more <i>nodes</i>. Each node encapsulates a processing task that is applied to the stream. In the following diagram, nodes 1 and 2 are <i>source</i> nodes and node 3 is a <i>selector</i> node.
 * 
 * <img alt="KsProxy nodes" border="0" src="./images/ksproxynodes.png"/>
 * 
 * The source nodes represent input streams—for example, a camera or a tape transport. The selector node controls which stream is sent to the filter's output pin. To switch between inputs, an application would do the following:
 * 
 * <ol>
 * <li>Use the <a href="https://docs.microsoft.com/windows/previous-versions/windows/desktop/api/vidcap/nn-vidcap-ikstopologyinfo">IKsTopologyInfo</a> interface to enumerate the nodes and discover the node types, identifiers, and names.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-createnodeinstance">IKsTopologyInfo::CreateNodeInstance</a> to create the selector node, passing in the node identifier and the interface identifier IID_ISelector. The method returns an <c>ISelector</c> interface pointer.</li>
 * <li>Use the <c>ISelector</c> interface to select the source node.</li>
 * </ol>
 * The <c>ISelector</c> interface is available if the selector node supports the PROPSETID_VIDCAP_SELECTOR property set. For more information, see the Windows DDK documentation.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vidcap/nn-vidcap-iselector
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ISelector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelector
     * @type {Guid}
     */
    static IID => Guid("{1abdaeca-68b6-4f83-9371-b413907c7b9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NumSources", "get_SourceNodeId", "put_SourceNodeId"]

    /**
     * @type {Integer} 
     */
    NumSources {
        get => this.get_NumSources()
    }

    /**
     * @type {Integer} 
     */
    SourceNodeId {
        get => this.get_SourceNodeId()
        set => this.put_SourceNodeId(value)
    }

    /**
     * The get_NumSources method returns the number of source nodes connected to the selector node.
     * @returns {Integer} Receives the number of source nodes.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-iselector-get_numsources
     */
    get_NumSources() {
        result := ComCall(3, this, "uint*", &pdwNumSources := 0, "HRESULT")
        return pdwNumSources
    }

    /**
     * The get_SourceNodeId method returns the index of the active source node.
     * @returns {Integer} Receives the index of the source node that is currently active.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-iselector-get_sourcenodeid
     */
    get_SourceNodeId() {
        result := ComCall(4, this, "uint*", &pdwPinId := 0, "HRESULT")
        return pdwPinId
    }

    /**
     * The put_SourceNodeId method activates a source node.
     * @param {Integer} dwPinId Index of the source node to activate.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-iselector-put_sourcenodeid
     */
    put_SourceNodeId(dwPinId) {
        result := ComCall(5, this, "uint", dwPinId, "HRESULT")
        return result
    }
}
