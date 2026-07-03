#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInputObject.ahk" { IInputObject }
#Import "..\WindowsAndMessaging\MSG.ahk" { MSG }

/**
 * Exposes a method that extends IInputObject by handling global accelerators.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iinputobject">IInputObject</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinputobject2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInputObject2 extends IInputObject {
    /**
     * The interface identifier for IInputObject2
     * @type {Guid}
     */
    static IID := Guid("{6915c085-510b-44cd-94af-28dfa56cf92b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInputObject2 interfaces
    */
    struct Vtbl extends IInputObject.Vtbl {
        TranslateAcceleratorGlobal : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInputObject2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles global accelerators so that input objects can respond to the keyboard even when they are not active in the UI.
     * @param {Pointer<MSG>} pMsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that contains a keyboard message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinputobject2-translateacceleratorglobal
     */
    TranslateAcceleratorGlobal(pMsg) {
        result := ComCall(6, this, MSG.Ptr, pMsg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInputObject2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TranslateAcceleratorGlobal := CallbackCreate(GetMethod(implObj, "TranslateAcceleratorGlobal"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TranslateAcceleratorGlobal)
    }
}
