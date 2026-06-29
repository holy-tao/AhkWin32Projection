#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAMWMBufferPassCallback.ahk" { IAMWMBufferPassCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMWMBufferPass interface is implemented on the output pins of the WM ASF Reader and the input pins of the WM ASF Writer.
 * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nn-dshowasf-iamwmbufferpass
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMWMBufferPass extends IUnknown {
    /**
     * The interface identifier for IAMWMBufferPass
     * @type {Guid}
     */
    static IID := Guid("{6dd816d7-e740-4123-9e24-2444412644d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMWMBufferPass interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetNotify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMWMBufferPass.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetNotify method is used by applications to provide the WM ASF Writer or WM ASF Reader filter with a pointer to the application's IAMWMBufferPassCallback interface.
     * @remarks
     * Call this method before putting the filter graph into the run state.
     * @param {IAMWMBufferPassCallback} pCallback Pointer to the application's <b>IAMWMBufferPassCallback</b> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iamwmbufferpass-setnotify
     */
    SetNotify(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMWMBufferPass.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetNotify := CallbackCreate(GetMethod(implObj, "SetNotify"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetNotify)
    }
}
