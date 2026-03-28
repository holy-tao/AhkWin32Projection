#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsTopologyInfo interface enumerates the nodes in a stream class driver. The KsProxy filter exposes this interface. Applications can use this interface to examine the internal topology of a kernel-mode filter.
 * @remarks
 * In the Windows Driver Model, a kernel-streaming (KS) filter contains one or more <i>nodes</i>. Each node encapsulates a processing task that is applied to the stream. Nodes have inputs and outputs, which connect either to other nodes in the filter, or else to the filter's pins. In this way, the nodes resemble a miniature "filter graph" inside the filter, which may contain several possible data paths. Applications can use the <c>IKsTopologyInfo</c> interface to get information about the nodes and the node connections.
 * 
 * <img alt="KsFilter nodes" border="0" src="./images/ksproxynodes.png"/>
 * 
 * Some devices also support the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nn-vidcap-iselector">ISelector</a> interface for selecting input nodes. For example, if a video capture device has a camera and a tape transport, these could be represented as two nodes (see the previous diagram).
 * 
 * Include Vidcap.h from the Windows SDK or from the DirectX 9.0 SDK Update (Summer 2004) or later.
 * @see https://learn.microsoft.com/windows/win32/api/vidcap/nn-vidcap-ikstopologyinfo
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsTopology extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsTopology
     * @type {Guid}
     */
    static IID => Guid("{28f54683-06fd-11d2-b27a-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNodeInstance"]

    /**
     * 
     * @param {Integer} NodeId 
     * @param {Integer} Flags 
     * @param {Integer} DesiredAccess 
     * @param {IUnknown} UnkOuter 
     * @param {Pointer<Guid>} InterfaceId 
     * @returns {Pointer<Void>} 
     */
    CreateNodeInstance(NodeId, Flags, DesiredAccess, UnkOuter, InterfaceId) {
        result := ComCall(3, this, "uint", NodeId, "uint", Flags, "uint", DesiredAccess, "ptr", UnkOuter, "ptr", InterfaceId, "ptr*", &_Interface := 0, "HRESULT")
        return _Interface
    }
}
