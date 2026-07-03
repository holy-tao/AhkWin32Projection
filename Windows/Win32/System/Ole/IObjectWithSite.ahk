#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a simple way to support communication between an object and its site in the container.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iobjectwithsite
 * @namespace Windows.Win32.System.Ole
 */
export default struct IObjectWithSite extends IUnknown {
    /**
     * The interface identifier for IObjectWithSite
     * @type {Guid}
     */
    static IID := Guid("{fc4801a3-2ba9-11cf-a229-00aa003d7352}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectWithSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSite : IntPtr
        GetSite : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectWithSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables a container to pass an object a pointer to the interface for its site.
     * @remarks
     * The object should hold onto this pointer, calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> in doing so. If the object already has a site, it should call that existing site's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>, save the new site pointer, and call the new site's <b>IUnknown::AddRef</b>.
     * 
     * E_NOTIMPL is not allowed. Without implementation of the <b>SetSite</b> method, the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iobjectwithsite">IObjectWithSite</a> interface is unnecessary.
     * @param {IUnknown} pUnkSite A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer of the site managing this object. If <b>NULL</b>, the object should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on any existing site at which point the object no longer knows its site.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iobjectwithsite-setsite
     */
    SetSite(pUnkSite) {
        result := ComCall(3, this, "ptr", pUnkSite, "HRESULT")
        return result
    }

    /**
     * Retrieves the latest site passed using SetSite.
     * @remarks
     * E_NOTIMPL is not allowed. Any object implementing this interface must be able to return the last site seen in <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iobjectwithsite-setsite">IObjectWithSite::SetSite</a>.
     * @param {Pointer<Guid>} riid The IID of the interface pointer that should be returned in <i>ppvSite</i>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvSite</i> contains the requested interface pointer to the site last seen in <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iobjectwithsite-setsite">SetSite</a>. The specific interface returned depends on the <i>riid</i> argument. In essence, the two arguments act identically to those in <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>. If the appropriate interface pointer is available, the object must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on that pointer before returning successfully. If no site is available, or the requested interface is not supported, this method must *<i>ppvSite</i> to <b>NULL</b> and return a failure code.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iobjectwithsite-getsite
     */
    GetSite(riid) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr*", &ppvSite := 0, "HRESULT")
        return ppvSite
    }

    Query(iid) {
        if (IObjectWithSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSite := CallbackCreate(GetMethod(implObj, "SetSite"), flags, 2)
        this.vtbl.GetSite := CallbackCreate(GetMethod(implObj, "GetSite"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSite)
        CallbackFree(this.vtbl.GetSite)
    }
}
