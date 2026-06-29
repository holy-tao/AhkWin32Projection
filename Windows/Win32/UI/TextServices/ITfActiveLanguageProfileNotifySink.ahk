#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfActiveLanguageProfileNotifySink interface is implemented by an application to receive a notification when the active language or text service changes.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfactivelanguageprofilenotifysink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfActiveLanguageProfileNotifySink extends IUnknown {
    /**
     * The interface identifier for ITfActiveLanguageProfileNotifySink
     * @type {Guid}
     */
    static IID := Guid("{b246cb75-a93e-4652-bf8c-b3fe0cfd7e57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfActiveLanguageProfileNotifySink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnActivated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfActiveLanguageProfileNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfActiveLanguageProfileNotifySink::OnActivated method
     * @param {Pointer<Guid>} clsid CLSID of the TSF text service activated or deactivated. This will be **NULL** for a language change.
     * @param {Pointer<Guid>} guidProfile Profile GUID for the TSF text service. This is specified by the TSF text service when it is installed. This will be <b>NULL</b> for a language change.
     * @param {BOOL} fActivated TRUE if the TSF text service is activated or FALSE if the TSF text service is deactivated.
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfactivelanguageprofilenotifysink-onactivated
     */
    OnActivated(clsid, guidProfile, fActivated) {
        result := ComCall(3, this, Guid.Ptr, clsid, Guid.Ptr, guidProfile, BOOL, fActivated, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfActiveLanguageProfileNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnActivated := CallbackCreate(GetMethod(implObj, "OnActivated"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnActivated)
    }
}
