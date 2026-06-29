#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFCameraIntrinsic_DistortionModelType.ahk" { MFCameraIntrinsic_DistortionModelType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MFExtendedCameraIntrinsic_IntrinsicModel.ahk" { MFExtendedCameraIntrinsic_IntrinsicModel }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFExtendedCameraIntrinsicModel extends IUnknown {
    /**
     * The interface identifier for IMFExtendedCameraIntrinsicModel
     * @type {Guid}
     */
    static IID := Guid("{5c595e64-4630-4231-855a-12842f733245}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFExtendedCameraIntrinsicModel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetModel               : IntPtr
        SetModel               : IntPtr
        GetDistortionModelType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFExtendedCameraIntrinsicModel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {MFExtendedCameraIntrinsic_IntrinsicModel} 
     */
    GetModel() {
        pIntrinsicModel := MFExtendedCameraIntrinsic_IntrinsicModel()
        result := ComCall(3, this, MFExtendedCameraIntrinsic_IntrinsicModel.Ptr, pIntrinsicModel, "HRESULT")
        return pIntrinsicModel
    }

    /**
     * 
     * @param {Pointer<MFExtendedCameraIntrinsic_IntrinsicModel>} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    SetModel(pIntrinsicModel) {
        result := ComCall(4, this, MFExtendedCameraIntrinsic_IntrinsicModel.Ptr, pIntrinsicModel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {MFCameraIntrinsic_DistortionModelType} 
     */
    GetDistortionModelType() {
        result := ComCall(5, this, "int*", &pDistortionModelType := 0, "HRESULT")
        return pDistortionModelType
    }

    Query(iid) {
        if (IMFExtendedCameraIntrinsicModel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetModel := CallbackCreate(GetMethod(implObj, "GetModel"), flags, 2)
        this.vtbl.SetModel := CallbackCreate(GetMethod(implObj, "SetModel"), flags, 2)
        this.vtbl.GetDistortionModelType := CallbackCreate(GetMethod(implObj, "GetDistortionModelType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetModel)
        CallbackFree(this.vtbl.SetModel)
        CallbackFree(this.vtbl.GetDistortionModelType)
    }
}
