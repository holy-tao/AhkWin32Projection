#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DetectedFaceBound.ahk" { DetectedFaceBound }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFFaceDetectionTransformCallback extends IUnknown {
    /**
     * The interface identifier for IMFFaceDetectionTransformCallback
     * @type {Guid}
     */
    static IID := Guid("{0bfd1ade-0421-4909-acb7-7a7125416881}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFFaceDetectionTransformCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnFaceDetectionResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFFaceDetectionTransformCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} countOfBounds 
     * @param {Pointer<DetectedFaceBound>} detectedFaceBounds 
     * @returns {String} Nothing - always returns an empty string
     */
    OnFaceDetectionResult(countOfBounds, detectedFaceBounds) {
        ComCall(3, this, "uint", countOfBounds, DetectedFaceBound.Ptr, detectedFaceBounds)
    }

    Query(iid) {
        if (IMFFaceDetectionTransformCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnFaceDetectionResult := CallbackCreate(GetMethod(implObj, "OnFaceDetectionResult"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnFaceDetectionResult)
    }
}
