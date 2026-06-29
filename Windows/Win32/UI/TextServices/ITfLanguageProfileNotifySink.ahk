#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfLanguageProfileNotifySink interface is implemented by an application to receive notifications when the language profile changes.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itflanguageprofilenotifysink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLanguageProfileNotifySink extends IUnknown {
    /**
     * The interface identifier for ITfLanguageProfileNotifySink
     * @type {Guid}
     */
    static IID := Guid("{43c9fe15-f494-4c17-9de2-b8a4ac350aa8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLanguageProfileNotifySink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnLanguageChange  : IntPtr
        OnLanguageChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLanguageProfileNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfLanguageProfileNotifySink::OnLanguageChange method
     * @param {Integer} langid Contains a <b>LANGID</b> value the identifies the new language profile.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives a flag that permits or prevents the language profile change. Receives zero to prevent the language profile change or nonzero to permit the language profile change.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itflanguageprofilenotifysink-onlanguagechange
     */
    OnLanguageChange(langid) {
        result := ComCall(3, this, "ushort", langid, BOOL.Ptr, &pfAccept := 0, "HRESULT")
        return pfAccept
    }

    /**
     * ITfLanguageProfileNotifySink::OnLanguageChanged method
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itflanguageprofilenotifysink-onlanguagechanged
     */
    OnLanguageChanged() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfLanguageProfileNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLanguageChange := CallbackCreate(GetMethod(implObj, "OnLanguageChange"), flags, 3)
        this.vtbl.OnLanguageChanged := CallbackCreate(GetMethod(implObj, "OnLanguageChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLanguageChange)
        CallbackFree(this.vtbl.OnLanguageChanged)
    }
}
