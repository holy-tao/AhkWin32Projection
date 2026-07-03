#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables an authoring app to receive notification of designer events and respond to those events.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nn-webapplication-iwebapplicationupdateevents
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct IWebApplicationUpdateEvents extends IUnknown {
    /**
     * The interface identifier for IWebApplicationUpdateEvents
     * @type {Guid}
     */
    static IID := Guid("{3e59e6b7-c652-4daf-ad5e-16feb350cde3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebApplicationUpdateEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnPaint      : IntPtr
        OnCssChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebApplicationUpdateEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the authoring app that a portion of the app was painted.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationupdateevents-onpaint
     */
    OnPaint() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Notifies the authoring app that the Cascading Style Sheets (CSS) has changed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationupdateevents-oncsschanged
     */
    OnCssChanged() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebApplicationUpdateEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnPaint := CallbackCreate(GetMethod(implObj, "OnPaint"), flags, 1)
        this.vtbl.OnCssChanged := CallbackCreate(GetMethod(implObj, "OnCssChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnPaint)
        CallbackFree(this.vtbl.OnCssChanged)
    }
}
