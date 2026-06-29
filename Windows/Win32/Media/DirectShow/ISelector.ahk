#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISelector interface is used to select source nodes in a stream class driver.
 * @remarks
 * A kernel-streaming (KS) filter contains one or more <i>nodes</i>. Each node encapsulates a processing task that is applied to the stream. In the following diagram, nodes 1 and 2 are <i>source</i> nodes and node 3 is a <i>selector</i> node.
 * 
 * <img alt="KsProxy nodes" border="0" src="./images/ksproxynodes.png"/>
 * 
 * The source nodes represent input streams—for example, a camera or a tape transport. The selector node controls which stream is sent to the filter's output pin. To switch between inputs, an application would do the following:
 * 
 * <ol>
 * <li>Use the <a href="https://docs.microsoft.com/windows/win32/api/vidcap/nn-vidcap-ikstopologyinfo">IKsTopologyInfo</a> interface to enumerate the nodes and discover the node types, identifiers, and names.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-createnodeinstance">IKsTopologyInfo::CreateNodeInstance</a> to create the selector node, passing in the node identifier and the interface identifier IID_ISelector. The method returns an <c>ISelector</c> interface pointer.</li>
 * <li>Use the <c>ISelector</c> interface to select the source node.</li>
 * </ol>
 * The <c>ISelector</c> interface is available if the selector node supports the PROPSETID_VIDCAP_SELECTOR property set. For more information, see the Windows DDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/vidcap/nn-vidcap-iselector
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ISelector extends IUnknown {
    /**
     * The interface identifier for ISelector
     * @type {Guid}
     */
    static IID := Guid("{1abdaeca-68b6-4f83-9371-b413907c7b9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISelector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_NumSources   : IntPtr
        get_SourceNodeId : IntPtr
        put_SourceNodeId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISelector.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iselector-get_numsources
     */
    get_NumSources() {
        result := ComCall(3, this, "uint*", &pdwNumSources := 0, "HRESULT")
        return pdwNumSources
    }

    /**
     * The get_SourceNodeId method returns the index of the active source node.
     * @returns {Integer} Receives the index of the source node that is currently active.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iselector-get_sourcenodeid
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iselector-put_sourcenodeid
     */
    put_SourceNodeId(dwPinId) {
        result := ComCall(5, this, "uint", dwPinId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISelector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_NumSources := CallbackCreate(GetMethod(implObj, "get_NumSources"), flags, 2)
        this.vtbl.get_SourceNodeId := CallbackCreate(GetMethod(implObj, "get_SourceNodeId"), flags, 2)
        this.vtbl.put_SourceNodeId := CallbackCreate(GetMethod(implObj, "put_SourceNodeId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_NumSources)
        CallbackFree(this.vtbl.get_SourceNodeId)
        CallbackFree(this.vtbl.put_SourceNodeId)
    }
}
