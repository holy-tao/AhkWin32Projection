#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFolderViewOC extends IDispatch {
    /**
     * The interface identifier for IFolderViewOC
     * @type {Guid}
     */
    static IID := Guid("{9ba05970-f6a8-11cf-a442-00a0c90a8f39}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderViewOC interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        SetFolderView : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderViewOC.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @returns {HRESULT} 
     */
    SetFolderView(pdisp) {
        result := ComCall(7, this, "ptr", pdisp, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFolderViewOC.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFolderView := CallbackCreate(GetMethod(implObj, "SetFolderView"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFolderView)
    }
}
