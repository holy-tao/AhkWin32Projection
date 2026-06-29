#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MFCameraIntrinsic_DistortionModelArcTan.ahk" { MFCameraIntrinsic_DistortionModelArcTan }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFExtendedCameraIntrinsicsDistortionModelArcTan extends IUnknown {
    /**
     * The interface identifier for IMFExtendedCameraIntrinsicsDistortionModelArcTan
     * @type {Guid}
     */
    static IID := Guid("{812d5f95-b572-45dc-bafc-ae24199ddda8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFExtendedCameraIntrinsicsDistortionModelArcTan interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDistortionModel : IntPtr
        SetDistortionModel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFExtendedCameraIntrinsicsDistortionModelArcTan.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {MFCameraIntrinsic_DistortionModelArcTan} 
     */
    GetDistortionModel() {
        pDistortionModel := MFCameraIntrinsic_DistortionModelArcTan()
        result := ComCall(3, this, MFCameraIntrinsic_DistortionModelArcTan.Ptr, pDistortionModel, "HRESULT")
        return pDistortionModel
    }

    /**
     * 
     * @param {Pointer<MFCameraIntrinsic_DistortionModelArcTan>} pDistortionModel 
     * @returns {HRESULT} 
     */
    SetDistortionModel(pDistortionModel) {
        result := ComCall(4, this, MFCameraIntrinsic_DistortionModelArcTan.Ptr, pDistortionModel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFExtendedCameraIntrinsicsDistortionModelArcTan.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDistortionModel := CallbackCreate(GetMethod(implObj, "GetDistortionModel"), flags, 2)
        this.vtbl.SetDistortionModel := CallbackCreate(GetMethod(implObj, "SetDistortionModel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDistortionModel)
        CallbackFree(this.vtbl.SetDistortionModel)
    }
}
