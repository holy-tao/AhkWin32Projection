#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IKsNodeControl interface must be implemented by USB Video Class (UVC) extension units.
 * @see https://learn.microsoft.com/windows/win32/api/vidcap/nn-vidcap-iksnodecontrol
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsNodeControl extends IUnknown {
    /**
     * The interface identifier for IKsNodeControl
     * @type {Guid}
     */
    static IID := Guid("{11737c14-24a7-4bb5-81a0-0d003813b0c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsNodeControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_NodeId    : IntPtr
        put_KsControl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsNodeControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    NodeId {
        set => this.put_NodeId(value)
    }

    /**
     * @type {Void} 
     */
    KsControl {
        set => this.put_KsControl(value)
    }

    /**
     * Sets the node identifier for the extension unit.
     * @param {Integer} dwNodeId Node identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iksnodecontrol-put_nodeid
     */
    put_NodeId(dwNodeId) {
        result := ComCall(3, this, "uint", dwNodeId, "HRESULT")
        return result
    }

    /**
     * Provides an instance of the IKsControl interface to the extension unit.
     * @remarks
     * The KsProxy filter calls this method with a pointer to its own <b>IKsControl</b> interface. The extension unit should cache the pointer.
     * @param {Pointer<Void>} pKsControl Pointer to the <b>IKsControl</b> interface, typed as a void pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iksnodecontrol-put_kscontrol
     */
    put_KsControl(pKsControl) {
        pKsControlMarshal := pKsControl is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pKsControlMarshal, pKsControl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IKsNodeControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_NodeId := CallbackCreate(GetMethod(implObj, "put_NodeId"), flags, 2)
        this.vtbl.put_KsControl := CallbackCreate(GetMethod(implObj, "put_KsControl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_NodeId)
        CallbackFree(this.vtbl.put_KsControl)
    }
}
