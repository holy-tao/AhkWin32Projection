#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\WindowsAndMessaging\MSG.ahk" { MSG }

/**
 * Exposes methods that change UI activation and process accelerators for a user input object contained in the Shell.
 * @remarks
 * Implement <b>IInputObject</b> if you are implementing a Shell object that takes user input.
 * 
 * You do not call this interface directly. <b>IInputObject</b> is used by the Shell or the browser to notify the object of UI activation changes and to translate keyboard accelerators.
 * 
 * <b>IInputObject</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. The listed methods are specific to <b>IInputObject</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinputobject
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInputObject extends IUnknown {
    /**
     * The interface identifier for IInputObject
     * @type {Guid}
     */
    static IID := Guid("{68284faa-6a48-11d0-8c78-00c04fd918b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInputObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UIActivateIO           : IntPtr
        HasFocusIO             : IntPtr
        TranslateAcceleratorIO : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInputObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * UI-activates or deactivates the object.
     * @param {BOOL} fActivate Type: <b>BOOL</b>
     * 
     * Indicates if the object is being activated or deactivated. If this value is nonzero, the object is being activated. If this value is zero, the object is being deactivated.
     * @param {Pointer<MSG>} pMsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that contains the message that caused the activation change. This value may be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinputobject-uiactivateio
     */
    UIActivateIO(fActivate, pMsg) {
        result := ComCall(3, this, BOOL, fActivate, MSG.Ptr, pMsg, "HRESULT")
        return result
    }

    /**
     * Determines if one of the object's windows has the keyboard focus.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if one of the object's windows has the keyboard focus, or S_FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinputobject-hasfocusio
     */
    HasFocusIO() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Enables the object to process keyboard accelerators.
     * @param {Pointer<MSG>} pMsg Type: <b>LPMSG</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that contains the keyboard message that is being translated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the accelerator was translated, or <b>S_FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinputobject-translateacceleratorio
     */
    TranslateAcceleratorIO(pMsg) {
        result := ComCall(5, this, MSG.Ptr, pMsg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInputObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UIActivateIO := CallbackCreate(GetMethod(implObj, "UIActivateIO"), flags, 3)
        this.vtbl.HasFocusIO := CallbackCreate(GetMethod(implObj, "HasFocusIO"), flags, 1)
        this.vtbl.TranslateAcceleratorIO := CallbackCreate(GetMethod(implObj, "TranslateAcceleratorIO"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UIActivateIO)
        CallbackFree(this.vtbl.HasFocusIO)
        CallbackFree(this.vtbl.TranslateAcceleratorIO)
    }
}
