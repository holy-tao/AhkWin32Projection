#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInkHostWorkItem.ahk" { IInkHostWorkItem }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An IInkDesktopHost object enables ink input, processing, and rendering through the creation of an app thread to host an IInkPresenterDesktop object and insert it into the app's DirectComposition visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkdesktophost
 * @namespace Windows.Win32.UI.Input.Ink
 */
export default struct IInkDesktopHost extends IUnknown {
    /**
     * The interface identifier for IInkDesktopHost
     * @type {Guid}
     */
    static IID := Guid("{4ce7d875-a981-4140-a1ff-ad93258e8d59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkDesktopHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueueWorkItem                   : IntPtr
        CreateInkPresenter              : IntPtr
        CreateAndInitializeInkPresenter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkDesktopHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Add an ink operation to a work queue for execution on the IInkDesktopHost thread.
     * @param {IInkHostWorkItem} workItem An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkhostworkitem">IInkHostWorkItem</a> object representing an ink operation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-queueworkitem
     */
    QueueWorkItem(workItem) {
        result := ComCall(3, this, "ptr", workItem, "HRESULT")
        return result
    }

    /**
     * Creates an IInkPresenterDesktop object on an application thread.
     * @param {Pointer<Guid>} riid A reference to the interface identifier of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkpresenterdesktop">IInkPresenterDesktop</a> object.
     * @returns {Pointer<Void>} Address of a pointer variable that receives the interface pointer identified by <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-createinkpresenter
     */
    CreateInkPresenter(riid) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates an IInkPresenterDesktop object on an application thread, connects it to the app's DirectComposition visual tree, and sets the size of the object.
     * @param {IUnknown} rootVisual The <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a> of the app.
     * @param {Float} width The width, in pixels, of the inking area.
     * @param {Float} height The height, in pixels, of the inking area.
     * @param {Pointer<Guid>} riid A reference to the interface identifier of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkpresenterdesktop">IInkPresenterDesktop</a> object.
     * @returns {Pointer<Void>} Address of a pointer variable that receives the interface pointer identified by <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-createandinitializeinkpresenter
     */
    CreateAndInitializeInkPresenter(rootVisual, width, height, riid) {
        result := ComCall(5, this, "ptr", rootVisual, "float", width, "float", height, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IInkDesktopHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueueWorkItem := CallbackCreate(GetMethod(implObj, "QueueWorkItem"), flags, 2)
        this.vtbl.CreateInkPresenter := CallbackCreate(GetMethod(implObj, "CreateInkPresenter"), flags, 3)
        this.vtbl.CreateAndInitializeInkPresenter := CallbackCreate(GetMethod(implObj, "CreateAndInitializeInkPresenter"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueueWorkItem)
        CallbackFree(this.vtbl.CreateInkPresenter)
        CallbackFree(this.vtbl.CreateAndInitializeInkPresenter)
    }
}
