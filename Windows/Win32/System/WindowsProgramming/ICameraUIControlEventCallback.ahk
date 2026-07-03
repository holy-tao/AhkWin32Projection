#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback interface for receiving events from the camera user interface control.
 * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nn-camerauicontrol-icamerauicontroleventcallback
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct ICameraUIControlEventCallback extends IUnknown {
    /**
     * The interface identifier for ICameraUIControlEventCallback
     * @type {Guid}
     */
    static IID := Guid("{1bfa0c2c-fbcd-4776-bda4-88bf974e74f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICameraUIControlEventCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStartupComplete : IntPtr
        OnSuspendComplete : IntPtr
        OnItemCaptured    : IntPtr
        OnItemDeleted     : IntPtr
        OnClosed          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICameraUIControlEventCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Occurs when startup for the camera UI control has completed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onstartupcomplete
     */
    OnStartupComplete() {
        ComCall(3, this)
    }

    /**
     * Occurs when the camera UI control has completed being suspended.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onsuspendcomplete
     */
    OnSuspendComplete() {
        ComCall(4, this)
    }

    /**
     * Occurs when an item is captured.
     * @param {PWSTR} pszPath The path to the captured item.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onitemcaptured
     */
    OnItemCaptured(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ComCall(5, this, "ptr", pszPath)
    }

    /**
     * Occurs when an item is deleted.
     * @param {PWSTR} pszPath The path to the deleted item.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onitemdeleted
     */
    OnItemDeleted(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ComCall(6, this, "ptr", pszPath)
    }

    /**
     * Occurs when the camera UI control is closed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onclosed
     */
    OnClosed() {
        ComCall(7, this)
    }

    Query(iid) {
        if (ICameraUIControlEventCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStartupComplete := CallbackCreate(GetMethod(implObj, "OnStartupComplete"), flags, 1)
        this.vtbl.OnSuspendComplete := CallbackCreate(GetMethod(implObj, "OnSuspendComplete"), flags, 1)
        this.vtbl.OnItemCaptured := CallbackCreate(GetMethod(implObj, "OnItemCaptured"), flags, 2)
        this.vtbl.OnItemDeleted := CallbackCreate(GetMethod(implObj, "OnItemDeleted"), flags, 2)
        this.vtbl.OnClosed := CallbackCreate(GetMethod(implObj, "OnClosed"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStartupComplete)
        CallbackFree(this.vtbl.OnSuspendComplete)
        CallbackFree(this.vtbl.OnItemCaptured)
        CallbackFree(this.vtbl.OnItemDeleted)
        CallbackFree(this.vtbl.OnClosed)
    }
}
