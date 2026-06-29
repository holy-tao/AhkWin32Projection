#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFTopology.ahk" { IMFTopology }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Converts a partial topology into a full topology.
 * @remarks
 * To create the topology loader, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetopoloader">MFCreateTopoLoader</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imftopoloader
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTopoLoader extends IUnknown {
    /**
     * The interface identifier for IMFTopoLoader
     * @type {Guid}
     */
    static IID := Guid("{de9a6157-f660-4643-b56a-df9f7998c7cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTopoLoader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Load : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTopoLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a fully loaded topology from the input partial topology.
     * @remarks
     * This method creates any intermediate transforms that are needed to complete the topology. It also sets the input and output media types on all of the objects in the topology. If the method succeeds, the full topology is returned in the <i>ppOutputTopo</i> parameter.
     *       
     * 
     * You can use the <i>pCurrentTopo</i> parameter to provide a full topology that was previously loaded. If this topology contains objects that are needed in the new topology, the topology loader can re-use them without creating them again. This caching can potentially make the process faster. The objects from <i>pCurrentTopo</i> will not be reconfigured, so you can specify a topology that is actively streaming data. For example, while a topology is still running, you can pre-load the next topology.
     *       
     * 
     * Before calling this method, you must ensure that the output nodes in the partial topology have valid <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamsink">IMFStreamSink</a> pointers, not <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointers. The Media Session automatically performs this action inside the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-settopology">IMFMediaSession::SetTopology</a> method. However, if you call <b>Load</b> before calling <b>SetTopology</b>, you must bind the output nodes manually. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/binding-output-nodes-to-media-sinks">Binding Output Nodes to Media Sinks</a>.
     * @param {IMFTopology} pInputTopo A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the partial topology to be resolved.
     * @param {IMFTopology} pCurrentTopo A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the previous full topology. The topology loader can re-use objects from this topology in the new topology. This parameter can be <b>NULL</b>. See Remarks.
     * @returns {IMFTopology} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the completed topology. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopoloader-load
     */
    Load(pInputTopo, pCurrentTopo) {
        result := ComCall(3, this, "ptr", pInputTopo, "ptr*", &ppOutputTopo := 0, "ptr", pCurrentTopo, "HRESULT")
        return IMFTopology(ppOutputTopo)
    }

    Query(iid) {
        if (IMFTopoLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Load)
    }
}
