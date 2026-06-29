#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\QACONTROL.ahk" { QACONTROL }
#Import ".\QACONTAINER.ahk" { QACONTAINER }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Enables controls and containers to avoid performance bottlenecks on loading controls. It combines the load-time or initialization-time handshaking between the control and its container into a single call.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iquickactivate
 * @namespace Windows.Win32.System.Ole
 */
export default struct IQuickActivate extends IUnknown {
    /**
     * The interface identifier for IQuickActivate
     * @type {Guid}
     */
    static IID := Guid("{cf51ed10-62fe-11cf-bf86-00a0c9034836}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQuickActivate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QuickActivate    : IntPtr
        SetContentExtent : IntPtr
        GetContentExtent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQuickActivate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Quick activates a control.
     * @remarks
     * If the control does not support <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iquickactivate">IQuickActivate</a>, the container performs certain handshaking operations when it loads the control. The container calls certain interfaces on the control and the control, in turn, calls back to certain interfaces on the container's client site. First, the container creates the control object and calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to query for interfaces that it needs. Then, the container calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a> on the control, passing a pointer to its client site. Next, the control calls <b>QueryInterface</b> on this site, retrieving a pointer to additional necessary interfaces.
     * 
     * Using the <b>QuickActivate</b> method, the container passes a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontainer">QACONTAINER</a> structure. The structure contains pointers to interfaces which are needed by the control and the values of some ambient properties that the control may need. Upon return, the control passes a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontrol">QACONTROL</a> structure that contains pointers to its own interfaces that the container requires, and additional status information.
     * 
     * The <b>IPersist*::Load</b> and <b>IPersist*::InitNew</b> methods should be called after quick activation occurs. The control should establish its connections to the container's sinks during quick activation. However, these connections are not live until <b>IPersist*::Load</b> or <b>IPersist*::InitNew</b> has been called.
     * @param {Pointer<QACONTAINER>} pQaContainer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontainer">QACONTAINER</a> structure containing information about the container.
     * @param {Pointer<QACONTROL>} pQaControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontrol">QACONTROL</a> structure filled in by the control to return information about the control to the container. The container calling this method must reserve memory for this structure.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iquickactivate-quickactivate
     */
    QuickActivate(pQaContainer, pQaControl) {
        result := ComCall(3, this, QACONTAINER.Ptr, pQaContainer, QACONTROL.Ptr, pQaControl, "HRESULT")
        return result
    }

    /**
     * Sets the content extent of a control.
     * @param {Pointer<SIZE>} pSizel The size of the content extent.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iquickactivate-setcontentextent
     */
    SetContentExtent(pSizel) {
        result := ComCall(4, this, SIZE.Ptr, pSizel, "HRESULT")
        return result
    }

    /**
     * Gets the content extent of a control.
     * @remarks
     * The <b>SIZEL</b> structure is defined in Wtypes.h as follows.
     * 
     * 
     * ``` syntax
     * typedef struct tagSIZEL
     *     {
     *     LONG cx;
     *     LONG cy;
     *     } 	SIZEL;
     * 
     * typedef struct tagSIZEL *PSIZEL;
     * 
     * typedef struct tagSIZEL *LPSIZEL;
     * ```
     * @returns {SIZE} A pointer to a structure that contains size of the content extent.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iquickactivate-getcontentextent
     */
    GetContentExtent() {
        pSizel := SIZE()
        result := ComCall(5, this, SIZE.Ptr, pSizel, "HRESULT")
        return pSizel
    }

    Query(iid) {
        if (IQuickActivate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QuickActivate := CallbackCreate(GetMethod(implObj, "QuickActivate"), flags, 3)
        this.vtbl.SetContentExtent := CallbackCreate(GetMethod(implObj, "SetContentExtent"), flags, 2)
        this.vtbl.GetContentExtent := CallbackCreate(GetMethod(implObj, "GetContentExtent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QuickActivate)
        CallbackFree(this.vtbl.SetContentExtent)
        CallbackFree(this.vtbl.GetContentExtent)
    }
}
