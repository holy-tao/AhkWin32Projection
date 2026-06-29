#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IImageDecodeEventSink.ahk" { IImageDecodeEventSink }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IImageDecodeEventSink2 extends IImageDecodeEventSink {
    /**
     * The interface identifier for IImageDecodeEventSink2
     * @type {Guid}
     */
    static IID := Guid("{8ebd8a57-8a96-48c9-84a6-962e2db9c931}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImageDecodeEventSink2 interfaces
    */
    struct Vtbl extends IImageDecodeEventSink.Vtbl {
        IsAlphaPremultRequired : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImageDecodeEventSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsAlphaPremultRequired() {
        result := ComCall(9, this, BOOL.Ptr, &pfPremultAlpha := 0, "HRESULT")
        return pfPremultAlpha
    }

    Query(iid) {
        if (IImageDecodeEventSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsAlphaPremultRequired := CallbackCreate(GetMethod(implObj, "IsAlphaPremultRequired"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsAlphaPremultRequired)
    }
}
