#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFCameraIntrinsic_DistortionModel6KT.ahk" { MFCameraIntrinsic_DistortionModel6KT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFExtendedCameraIntrinsicsDistortionModel6KT extends IUnknown {
    /**
     * The interface identifier for IMFExtendedCameraIntrinsicsDistortionModel6KT
     * @type {Guid}
     */
    static IID := Guid("{74c2653b-5f55-4eb1-9f0f-18b8f68b7d3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFExtendedCameraIntrinsicsDistortionModel6KT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDistortionModel : IntPtr
        SetDistortionModel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFExtendedCameraIntrinsicsDistortionModel6KT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {MFCameraIntrinsic_DistortionModel6KT} 
     */
    GetDistortionModel() {
        pDistortionModel := MFCameraIntrinsic_DistortionModel6KT()
        result := ComCall(3, this, MFCameraIntrinsic_DistortionModel6KT.Ptr, pDistortionModel, "HRESULT")
        return pDistortionModel
    }

    /**
     * 
     * @param {Pointer<MFCameraIntrinsic_DistortionModel6KT>} pDistortionModel 
     * @returns {HRESULT} 
     */
    SetDistortionModel(pDistortionModel) {
        result := ComCall(4, this, MFCameraIntrinsic_DistortionModel6KT.Ptr, pDistortionModel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFExtendedCameraIntrinsicsDistortionModel6KT.IID.Equals(iid)) {
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
