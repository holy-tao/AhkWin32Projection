#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used by the Microsoft Media Foundation proxy/stub DLL to marshal certain asynchronous method calls across process boundaries.Applications do not use or implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfremoteasynccallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFRemoteAsyncCallback extends IUnknown {
    /**
     * The interface identifier for IMFRemoteAsyncCallback
     * @type {Guid}
     */
    static IID := Guid("{a27003d0-2354-4f2a-8d6a-ab7cff15437e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFRemoteAsyncCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFRemoteAsyncCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used by the Microsoft Media Foundation proxy/stub DLL to marshal certain asynchronous method calls across process boundaries.Applications do not use or implement this interface.
     * @param {HRESULT} hr 
     * @param {IUnknown} pRemoteResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfremoteasynccallback
     */
    Invoke(hr, pRemoteResult) {
        result := ComCall(3, this, "int", hr, "ptr", pRemoteResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFRemoteAsyncCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
    }
}
