#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKsPin.ahk" { IKsPin }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\DirectShow\IMediaSample.ahk" { IMediaSample }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsPinEx extends IKsPin {
    /**
     * The interface identifier for IKsPinEx
     * @type {Guid}
     */
    static IID := Guid("{7bb38260-d19c-11d2-b38a-00a0c95ec22e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsPinEx interfaces
    */
    struct Vtbl extends IKsPin.Vtbl {
        KsNotifyError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsPinEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMediaSample} Sample 
     * @param {HRESULT} hr 
     * @returns {String} Nothing - always returns an empty string
     */
    KsNotifyError(Sample, hr) {
        ComCall(16, this, "ptr", Sample, "int", hr)
    }

    Query(iid) {
        if (IKsPinEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsNotifyError := CallbackCreate(GetMethod(implObj, "KsNotifyError"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsNotifyError)
    }
}
