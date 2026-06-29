#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UI_EVENTPARAMS.ahk" { UI_EVENTPARAMS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUIEventLogger interface is implemented by the application and defines the ribbon events callback method.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuieventlogger
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUIEventLogger extends IUnknown {
    /**
     * The interface identifier for IUIEventLogger
     * @type {Guid}
     */
    static IID := Guid("{ec3e1034-dbf4-41a1-95d5-03e0f1026e05}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIEventLogger interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUIEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIEventLogger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Receives notifications that a ribbon event has occurred.
     * @param {Pointer<UI_EVENTPARAMS>} pEventParams The parameters associated with the event. This value varies according to the event type.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuieventlogger-onuievent
     */
    OnUIEvent(pEventParams) {
        ComCall(3, this, UI_EVENTPARAMS.Ptr, pEventParams)
    }

    Query(iid) {
        if (IUIEventLogger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUIEvent := CallbackCreate(GetMethod(implObj, "OnUIEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUIEvent)
    }
}
