#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to determine if the Text Input Panel is currently running.
 * @remarks
 * This element is declared in Peninputpanel.h.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nn-peninputpanel-itextinputpanelruninfo
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct ITextInputPanelRunInfo extends IUnknown {
    /**
     * The interface identifier for ITextInputPanelRunInfo
     * @type {Guid}
     */
    static IID := Guid("{9f424568-1920-48cc-9811-a993cbf5adba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextInputPanelRunInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsTipRunning : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextInputPanelRunInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates if the Tablet PC Input Panel is running at the time the method is called.
     * @returns {BOOL} <b>TRUE</b> if the Input Panel was running, otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanelruninfo-istiprunning
     */
    IsTipRunning() {
        result := ComCall(3, this, BOOL.Ptr, &pfRunning := 0, "HRESULT")
        return pfRunning
    }

    Query(iid) {
        if (ITextInputPanelRunInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsTipRunning := CallbackCreate(GetMethod(implObj, "IsTipRunning"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsTipRunning)
    }
}
