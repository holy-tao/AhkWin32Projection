#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TF_PRESERVEDKEY.ahk" { TF_PRESERVEDKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfPreservedKeyNotifySink interface is implemented by an application or TSF text service to receive notifications when keys are preserved, unpreserved, or when a preserved key description changes.
 * @remarks
 * Preserved keys are keyboard shortcuts that an application or TSF text service can register with the TSF manager.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfpreservedkeynotifysink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfPreservedKeyNotifySink extends IUnknown {
    /**
     * The interface identifier for ITfPreservedKeyNotifySink
     * @type {Guid}
     */
    static IID := Guid("{6f77c993-d2b1-446e-853e-5912efc8a286}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfPreservedKeyNotifySink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUpdated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfPreservedKeyNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfPreservedKeyNotifySink::OnUpdated method
     * @remarks
     * To determine if the key is unpreserved, call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfkeystrokemgr-ispreservedkey">ITfKeystrokeMgr::IsPreservedKey</a>, passing <i>pprekey</i>. If the key is not found, it is unpreserved. If the key is found, it is either preserved or the description has changed. Unless you keep track of the current key description and compare the previous description with the current description in response to this notification, there is no way to determine if this notification is in response to a key preserved or the description changed.
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_preservedkey">TF_PRESERVEDKEY</a> structure that contains data about the key.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpreservedkeynotifysink-onupdated
     */
    OnUpdated(pprekey) {
        result := ComCall(3, this, TF_PRESERVEDKEY.Ptr, pprekey, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfPreservedKeyNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUpdated := CallbackCreate(GetMethod(implObj, "OnUpdated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUpdated)
    }
}
