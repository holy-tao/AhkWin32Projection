#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUIManagerEventSink interface is implemented by an app supporting IME UI integration to receive notifications of IME UI appearance.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-iuimanagereventsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IUIManagerEventSink extends IUnknown {
    /**
     * The interface identifier for IUIManagerEventSink
     * @type {Guid}
     */
    static IID := Guid("{cd91d690-a7e8-4265-9b38-8bb3bbaba7de}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIManagerEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnWindowOpening  : IntPtr
        OnWindowOpened   : IntPtr
        OnWindowUpdating : IntPtr
        OnWindowUpdated  : IntPtr
        OnWindowClosing  : IntPtr
        OnWindowClosed   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIManagerEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the TSF before opening an IME UI.
     * @param {Pointer<RECT>} prcBounds Pointer to a <b>RECT</b> structure defining the affected area (in screen coordinates).
     * @returns {HRESULT} Ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowopening
     */
    OnWindowOpening(prcBounds) {
        result := ComCall(3, this, RECT.Ptr, prcBounds, "HRESULT")
        return result
    }

    /**
     * Called by the TSF after opening an IME UI.
     * @param {Pointer<RECT>} prcBounds Pointer to a <b>RECT</b> structure defining the affected area (in screen coordinates).
     * @returns {HRESULT} Ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowopened
     */
    OnWindowOpened(prcBounds) {
        result := ComCall(4, this, RECT.Ptr, prcBounds, "HRESULT")
        return result
    }

    /**
     * Called by the TSF before resizing and/or relocating the opened IME UI.
     * @param {Pointer<RECT>} prcUpdatedBounds Pointer to a <b>RECT</b> structure defining the affected area (in screen coordinates).
     * @returns {HRESULT} Ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowupdating
     */
    OnWindowUpdating(prcUpdatedBounds) {
        result := ComCall(5, this, RECT.Ptr, prcUpdatedBounds, "HRESULT")
        return result
    }

    /**
     * Called by the TSF after resizing and/or relocating the opened IME UI.
     * @param {Pointer<RECT>} prcUpdatedBounds Pointer to a <b>RECT</b> structure defining the affected area (in screen coordinates).
     * @returns {HRESULT} Ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowupdated
     */
    OnWindowUpdated(prcUpdatedBounds) {
        result := ComCall(6, this, RECT.Ptr, prcUpdatedBounds, "HRESULT")
        return result
    }

    /**
     * Called by the TSF before closing the IME UI.
     * @returns {HRESULT} Ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowclosing
     */
    OnWindowClosing() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Called by the TSF after closing the IME UI.
     * @returns {HRESULT} Ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowclosed
     */
    OnWindowClosed() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIManagerEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnWindowOpening := CallbackCreate(GetMethod(implObj, "OnWindowOpening"), flags, 2)
        this.vtbl.OnWindowOpened := CallbackCreate(GetMethod(implObj, "OnWindowOpened"), flags, 2)
        this.vtbl.OnWindowUpdating := CallbackCreate(GetMethod(implObj, "OnWindowUpdating"), flags, 2)
        this.vtbl.OnWindowUpdated := CallbackCreate(GetMethod(implObj, "OnWindowUpdated"), flags, 2)
        this.vtbl.OnWindowClosing := CallbackCreate(GetMethod(implObj, "OnWindowClosing"), flags, 1)
        this.vtbl.OnWindowClosed := CallbackCreate(GetMethod(implObj, "OnWindowClosed"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnWindowOpening)
        CallbackFree(this.vtbl.OnWindowOpened)
        CallbackFree(this.vtbl.OnWindowUpdating)
        CallbackFree(this.vtbl.OnWindowUpdated)
        CallbackFree(this.vtbl.OnWindowClosing)
        CallbackFree(this.vtbl.OnWindowClosed)
    }
}
