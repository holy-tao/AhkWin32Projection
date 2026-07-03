#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPlayerHook interface can be implemented by a player application that uses DirectX Video Acceleration (DirectX VA).
 * @remarks
 * To assign an implementation of the <b>IWMPlayerHook</b> interface to an output in the reader object, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced5-setplayerhook">IWMReaderAdvanced5::SetPlayerHook</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmplayerhook
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMPlayerHook extends IUnknown {
    /**
     * The interface identifier for IWMPlayerHook
     * @type {Guid}
     */
    static IID := Guid("{e5b7ca9a-0f1c-4f66-9002-74ec50d8b304}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPlayerHook interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PreDecode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPlayerHook.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The PreDecode method is called by the reader object before a sample from the output to which the IWMPlayerHook interface is assigned is passed to the video processor for decoding.
     * @remarks
     * To assign an implementation of the <b>IWMPlayerHook</b> interface to an output in the reader object, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced5-setplayerhook">IWMReaderAdvanced5::SetPlayerHook</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. You should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmplayerhook-predecode
     */
    PreDecode() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPlayerHook.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PreDecode := CallbackCreate(GetMethod(implObj, "PreDecode"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PreDecode)
    }
}
