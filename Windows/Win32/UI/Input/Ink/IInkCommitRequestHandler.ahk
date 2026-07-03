#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An IInkCommitRequestHandler object enables the app (instead of an IInkPresenterDesktop object) to commit all pending Microsoft DirectComposition commands to the app's DirectComposition visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkcommitrequesthandler
 * @namespace Windows.Win32.UI.Input.Ink
 */
export default struct IInkCommitRequestHandler extends IUnknown {
    /**
     * The interface identifier for IInkCommitRequestHandler
     * @type {Guid}
     */
    static IID := Guid("{fabea3fc-b108-45b6-a9fc-8d08fa9f85cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkCommitRequestHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCommitRequested : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkCommitRequestHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requests that the app commit all pending Microsoft DirectComposition commands to the app's DirectComposition visual tree.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkcommitrequesthandler-oncommitrequested
     */
    OnCommitRequested() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkCommitRequestHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCommitRequested := CallbackCreate(GetMethod(implObj, "OnCommitRequested"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCommitRequested)
    }
}
