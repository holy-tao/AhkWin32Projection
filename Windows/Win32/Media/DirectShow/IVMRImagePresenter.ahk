#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VMRPRESENTATIONINFO.ahk" { VMRPRESENTATIONINFO }

/**
 * The IVMRImagePresenter interface is implemented by the default Allocator-Presenter for the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrimagepresenter
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRImagePresenter extends IUnknown {
    /**
     * The interface identifier for IVMRImagePresenter
     * @type {Guid}
     */
    static IID := Guid("{ce704fe7-e71e-41fb-baa2-c4403e1182f5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRImagePresenter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartPresenting : IntPtr
        StopPresenting  : IntPtr
        PresentImage    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRImagePresenter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The StartPresenting method is called just before the video starts playing. The allocator-presenter should perform any necessary configuration in this method.
     * @remarks
     * <b>PresentImage</b> can be called when the filter is in either a running or a paused state. <c>StartPresenting</code> and <b>StopPresenting</b> can be called only in a running state. Therefore, if the graph is paused before it is run, <b>PresentImage</b> will be called before <code>StartPresenting</c>.
     * @param {Pointer} dwUserID An application-defined <b>DWORD_PTR</b> cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-startpresenting
     */
    StartPresenting(dwUserID) {
        result := ComCall(3, this, "ptr", dwUserID, "HRESULT")
        return result
    }

    /**
     * The StopPresenting method is called just after the video stops playing. The allocator-presenter should perform any necessary cleanup in this method.
     * @remarks
     * <c>StopPresenting</c> can be called only when the VMR is in a running state.
     * @param {Pointer} dwUserID An application-defined <b>DWORD_PTR</b> cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-stoppresenting
     */
    StopPresenting(dwUserID) {
        result := ComCall(4, this, "ptr", dwUserID, "HRESULT")
        return result
    }

    /**
     * The PresentImage method is called at precisely the moment this video frame should be presented.
     * @remarks
     * <c>PresentImage</code> can be called when the filter is in either a running or a paused state. <b>StartPresenting</b> and <b>StopPresenting</b> can be called only in a running state. Therefore, if the graph is paused before it is run, <code>PresentImage</c> will be called before <b>StartPresenting</b>.
     * 
     * Applications can create custom blending effects by using a single instance of an Allocator-Presenter with multiple instances of the VMR either in a single filter graph or in multiple filter graphs. Using the allocator presenter in this way enables applications to blend streams from different filter graphs, or blend different streams within the same filter graph. If you are using a single instance of the VMR, set this value to zero.
     * @param {Pointer} dwUserID An application-defined DWORD_PTR that uniquely identifies this instance of the VMR in scenarios when multiple instances of the VMR are being used with a single instance of an Allocator-Presenter. See Remarks
     * @param {Pointer<VMRPRESENTATIONINFO>} lpPresInfo Specifies the [VMRPRESENTATIONINFO](/windows/desktop/api/strmif/ns-strmif-vmrpresentationinfo) structure.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-presentimage
     */
    PresentImage(dwUserID, lpPresInfo) {
        result := ComCall(5, this, "ptr", dwUserID, VMRPRESENTATIONINFO.Ptr, lpPresInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRImagePresenter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartPresenting := CallbackCreate(GetMethod(implObj, "StartPresenting"), flags, 2)
        this.vtbl.StopPresenting := CallbackCreate(GetMethod(implObj, "StopPresenting"), flags, 2)
        this.vtbl.PresentImage := CallbackCreate(GetMethod(implObj, "PresentImage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartPresenting)
        CallbackFree(this.vtbl.StopPresenting)
        CallbackFree(this.vtbl.PresentImage)
    }
}
