#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIEventLogger.ahk" { IUIEventLogger }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUIEventingManager interface is implemented by the Ribbon framework and provides the notification functionality for applications that register for ribbon events.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuieventingmanager
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUIEventingManager extends IUnknown {
    /**
     * The interface identifier for IUIEventingManager
     * @type {Guid}
     */
    static IID := Guid("{3be6ea7f-9a9b-4198-9368-9b0f923bd534}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIEventingManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetEventLogger : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIEventingManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the event logger for ribbon events.
     * @remarks
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-initialize">IUIFramework::Initialize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-loadui">IUIFramework::LoadUI</a> before calling this method.
     * @param {IUIEventLogger} eventLogger The event logger.
     * 
     * If NULL, disables event logging.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuieventingmanager-seteventlogger
     */
    SetEventLogger(eventLogger) {
        result := ComCall(3, this, "ptr", eventLogger, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIEventingManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetEventLogger := CallbackCreate(GetMethod(implObj, "SetEventLogger"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetEventLogger)
    }
}
