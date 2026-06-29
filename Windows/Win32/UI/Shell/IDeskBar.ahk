#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Ole\IOleWindow.ahk" { IOleWindow }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enable desk bar manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ideskbar
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDeskBar extends IOleWindow {
    /**
     * The interface identifier for IDeskBar
     * @type {Guid}
     */
    static IID := Guid("{eb0fe173-1a3a-11d0-89b3-00a0c90a90ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeskBar interfaces
    */
    struct Vtbl extends IOleWindow.Vtbl {
        SetClient         : IntPtr
        GetClient         : IntPtr
        OnPosRectChangeDB : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeskBar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the client specified by punkClient.
     * @param {IUnknown} punkClient Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> that specifies the client used by the desk bar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskbar-setclient
     */
    SetClient(punkClient) {
        result := ComCall(5, this, "ptr", punkClient, "HRESULT")
        return result
    }

    /**
     * Gets the client object.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * The address of a pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> that receives the client used by the desk bar.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskbar-getclient
     */
    GetClient() {
        result := ComCall(6, this, "ptr*", &ppunkClient := 0, "HRESULT")
        return IUnknown(ppunkClient)
    }

    /**
     * Notifies the object that the rectangle has changed.
     * @param {Pointer<RECT>} prc Type: <b>LPRECT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the child bar's desired size.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskbar-onposrectchangedb
     */
    OnPosRectChangeDB(prc) {
        result := ComCall(7, this, RECT.Ptr, prc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDeskBar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetClient := CallbackCreate(GetMethod(implObj, "SetClient"), flags, 2)
        this.vtbl.GetClient := CallbackCreate(GetMethod(implObj, "GetClient"), flags, 2)
        this.vtbl.OnPosRectChangeDB := CallbackCreate(GetMethod(implObj, "OnPosRectChangeDB"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetClient)
        CallbackFree(this.vtbl.GetClient)
        CallbackFree(this.vtbl.OnPosRectChangeDB)
    }
}
