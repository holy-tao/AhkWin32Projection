#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_MSE_APPEND_MODE.ahk" { MF_MSE_APPEND_MODE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSourceBufferAppendMode extends IUnknown {
    /**
     * The interface identifier for IMFSourceBufferAppendMode
     * @type {Guid}
     */
    static IID := Guid("{19666fb4-babe-4c55-bc03-0a074da37e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSourceBufferAppendMode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAppendMode : IntPtr
        SetAppendMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSourceBufferAppendMode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {MF_MSE_APPEND_MODE} 
     */
    GetAppendMode() {
        result := ComCall(3, this, MF_MSE_APPEND_MODE)
        return result
    }

    /**
     * 
     * @param {MF_MSE_APPEND_MODE} _mode 
     * @returns {HRESULT} 
     */
    SetAppendMode(_mode) {
        result := ComCall(4, this, MF_MSE_APPEND_MODE, _mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSourceBufferAppendMode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAppendMode := CallbackCreate(GetMethod(implObj, "GetAppendMode"), flags, 1)
        this.vtbl.SetAppendMode := CallbackCreate(GetMethod(implObj, "SetAppendMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAppendMode)
        CallbackFree(this.vtbl.SetAppendMode)
    }
}
