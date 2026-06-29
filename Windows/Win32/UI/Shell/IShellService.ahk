#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Deprecated. IShellService Exposes one method that declares ownership when a service component implementing a certain interface is shared among multiple clients, such as Windows Internet Explorer and Windows Explorer.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ishellservice
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellService extends IUnknown {
    /**
     * The interface identifier for IShellService
     * @type {Guid}
     */
    static IID := Guid("{5836fb00-8187-11cf-a12b-00aa004ae837}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetOwner : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deprecated. Declares an owner reference to the service object.
     * @remarks
     * The client calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> for <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ishellservice">IShellService</a>, then calls <b>SetOwner(this)</b> to declare ownership. When the client is dismissed, typically when the window is closed, it calls <b>SetOwner(NULL)</b> to instruct the service object to release the reference to the owner object.
     * @param {IUnknown} punkOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The address of an interface pointer to the owner object. If <b>NULL</b>, the object should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release the existing reference.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ishellservice-setowner
     */
    SetOwner(punkOwner) {
        result := ComCall(3, this, "ptr", punkOwner, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOwner := CallbackCreate(GetMethod(implObj, "SetOwner"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOwner)
    }
}
