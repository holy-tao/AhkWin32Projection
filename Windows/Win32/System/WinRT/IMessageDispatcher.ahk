#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Callback interface implemented by components that need to perform special processing of window messages on an ASTA thread.
 * @see https://learn.microsoft.com/windows/win32/api/imessagedispatcher/nn-imessagedispatcher-imessagedispatcher
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IMessageDispatcher extends IInspectable {
    /**
     * The interface identifier for IMessageDispatcher
     * @type {Guid}
     */
    static IID := Guid("{f5f84c8f-cfd0-4cd6-b66b-c5d26ff1689d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMessageDispatcher interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        PumpMessages : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMessageDispatcher.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs custom dispatching when window messages are available to be dispatched on an ASTA thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/imessagedispatcher/nf-imessagedispatcher-imessagedispatcher-pumpmessages
     */
    PumpMessages() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMessageDispatcher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PumpMessages := CallbackCreate(GetMethod(implObj, "PumpMessages"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PumpMessages)
    }
}
