#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfClientId interface is implemented by the TSF manager. This interface is used to obtain a client identifier for TSF objects. An instance of this interface is obtained by querying the thread manager with IID_ITfClientId.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfclientid
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfClientId extends IUnknown {
    /**
     * The interface identifier for ITfClientId
     * @type {Guid}
     */
    static IID := Guid("{d60a7b49-1b9f-4be2-b702-47e9dc05dec3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfClientId interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClientId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfClientId.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfClientId::GetClientId method
     * @remarks
     * An application obtains its client identifier by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-activate">ITfThreadMgr::Activate</a> and a text service receives its client identifier in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-activate">ITfTextInputProcessor::Activate</a> method. <b>ITfClientId::GetClientId</b> enables TSF objects that do not fit either of these categories to obtain their own client identifier.
     * @param {Pointer<Guid>} rclsid CLSID to obtain the client identifier for.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that receives the client identifier.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfclientid-getclientid
     */
    GetClientId(rclsid) {
        result := ComCall(3, this, Guid.Ptr, rclsid, "uint*", &ptid := 0, "HRESULT")
        return ptid
    }

    Query(iid) {
        if (ITfClientId.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClientId := CallbackCreate(GetMethod(implObj, "GetClientId"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClientId)
    }
}
