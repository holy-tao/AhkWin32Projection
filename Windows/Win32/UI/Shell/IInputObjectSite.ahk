#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that is used to communicate focus changes for a user input object contained in the Shell.
 * @remarks
 * You do not typically implement this interface. <b>IInputObjectSite</b> is implemented by the Shell or the browser to properly maintain the input focus.
 * 
 * You use <b>IInputObjectSite</b> if you are implementing a Shell object that takes user input.
 * 
 * <b>IInputObjectSite</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. The listed method is specific to <b>IInputObjectSite</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinputobjectsite
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInputObjectSite extends IUnknown {
    /**
     * The interface identifier for IInputObjectSite
     * @type {Guid}
     */
    static IID := Guid("{f1db8392-7331-11d0-8c99-00a0c92dbfe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInputObjectSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnFocusChangeIS : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInputObjectSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Informs the browser that the focus has changed.
     * @remarks
     * The calling object should call this method whenever one of its windows gains or loses the input focus.
     * @param {IUnknown} punkObj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the object gaining or losing the focus.
     * @param {BOOL} fSetFocus Type: <b>BOOL</b>
     * 
     * Indicates if the object has gained or lost the focus. If this value is nonzero, the object has gained the focus. If this value is zero, the object has lost the focus.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the method was successful, or a COM-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinputobjectsite-onfocuschangeis
     */
    OnFocusChangeIS(punkObj, fSetFocus) {
        result := ComCall(3, this, "ptr", punkObj, BOOL, fSetFocus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInputObjectSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnFocusChangeIS := CallbackCreate(GetMethod(implObj, "OnFocusChangeIS"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnFocusChangeIS)
    }
}
