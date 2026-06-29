#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFFaceDetectionTransformCallback.ahk" { IMFFaceDetectionTransformCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFFaceDetectionTransform extends IUnknown {
    /**
     * The interface identifier for IMFFaceDetectionTransform
     * @type {Guid}
     */
    static IID := Guid("{ddd59578-d0e7-46e2-be8c-1ce76ad147c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFFaceDetectionTransform interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDetectionCallback   : IntPtr
        ClearDetectionCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFFaceDetectionTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMFFaceDetectionTransformCallback} callback 
     * @returns {Pointer<Void>} 
     */
    SetDetectionCallback(callback) {
        result := ComCall(3, this, "ptr", callback, "ptr*", &callbackToken := 0, "HRESULT")
        return callbackToken
    }

    /**
     * 
     * @param {Pointer<Void>} callbackToken 
     * @returns {HRESULT} 
     */
    ClearDetectionCallback(callbackToken) {
        callbackTokenMarshal := callbackToken is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, callbackTokenMarshal, callbackToken, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFFaceDetectionTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDetectionCallback := CallbackCreate(GetMethod(implObj, "SetDetectionCallback"), flags, 3)
        this.vtbl.ClearDetectionCallback := CallbackCreate(GetMethod(implObj, "ClearDetectionCallback"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDetectionCallback)
        CallbackFree(this.vtbl.ClearDetectionCallback)
    }
}
