#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_VoidTransform interface is implemented on a BDA device filter. It is used by the Network Provider to inactivate a portion of a filter graph without stopping the graph.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_VoidTransform)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_voidtransform
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_VoidTransform extends IUnknown {
    /**
     * The interface identifier for IBDA_VoidTransform
     * @type {Guid}
     */
    static IID := Guid("{71985f46-1ca1-11d3-9cc8-00c04f7971e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_VoidTransform interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start : IntPtr
        Stop  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_VoidTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Start method restarts data flow through a control node.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_voidtransform-start
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops data flow through a control node.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_voidtransform-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_VoidTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
    }
}
