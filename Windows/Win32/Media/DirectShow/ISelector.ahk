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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iselector-get_numsources
     */
    get_NumSources() {
        result := ComCall(3, this, "uint*", &pdwNumSources := 0, "HRESULT")
        return pdwNumSources
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iselector-get_sourcenodeid
     */
    get_SourceNodeId() {
        result := ComCall(4, this, "uint*", &pdwPinId := 0, "HRESULT")
        return pdwPinId
    }

    /**
     * 
     * @param {Integer} dwPinId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iselector-put_sourcenodeid
     */
    put_SourceNodeId(dwPinId) {
        result := ComCall(5, this, "uint", dwPinId, "HRESULT")
        return result
    }
}
