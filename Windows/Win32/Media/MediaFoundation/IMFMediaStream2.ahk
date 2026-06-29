#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_STREAM_STATE.ahk" { MF_STREAM_STATE }
#Import ".\IMFMediaStream.ahk" { IMFMediaStream }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaStream2 extends IMFMediaStream {
    /**
     * The interface identifier for IMFMediaStream2
     * @type {Guid}
     */
    static IID := Guid("{c5bc37d6-75c7-46a1-a132-81b5f723c20f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaStream2 interfaces
    */
    struct Vtbl extends IMFMediaStream.Vtbl {
        SetStreamState : IntPtr
        GetStreamState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaStream2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {MF_STREAM_STATE} value 
     * @returns {HRESULT} 
     */
    SetStreamState(value) {
        result := ComCall(10, this, MF_STREAM_STATE, value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {MF_STREAM_STATE} 
     */
    GetStreamState() {
        result := ComCall(11, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IMFMediaStream2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStreamState := CallbackCreate(GetMethod(implObj, "SetStreamState"), flags, 2)
        this.vtbl.GetStreamState := CallbackCreate(GetMethod(implObj, "GetStreamState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStreamState)
        CallbackFree(this.vtbl.GetStreamState)
    }
}
