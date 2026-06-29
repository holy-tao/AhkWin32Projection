#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFExtendedCameraIntrinsicModel.ahk" { IMFExtendedCameraIntrinsicModel }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFExtendedCameraIntrinsics extends IUnknown {
    /**
     * The interface identifier for IMFExtendedCameraIntrinsics
     * @type {Guid}
     */
    static IID := Guid("{687f6dac-6987-4750-a16a-734d1e7a10fe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFExtendedCameraIntrinsics interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeFromBuffer     : IntPtr
        GetBufferSize            : IntPtr
        SerializeToBuffer        : IntPtr
        GetIntrinsicModelCount   : IntPtr
        GetIntrinsicModelByIndex : IntPtr
        AddIntrinsicModel        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFExtendedCameraIntrinsics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} pbBuffer 
     * @param {Integer} dwBufferSize 
     * @returns {HRESULT} 
     */
    InitializeFromBuffer(pbBuffer, dwBufferSize) {
        result := ComCall(3, this, "ptr", pbBuffer, "uint", dwBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetBufferSize() {
        result := ComCall(4, this, "uint*", &pdwBufferSize := 0, "HRESULT")
        return pdwBufferSize
    }

    /**
     * 
     * @param {Integer} pbBuffer 
     * @param {Pointer<Integer>} pdwBufferSize 
     * @returns {HRESULT} 
     */
    SerializeToBuffer(pbBuffer, pdwBufferSize) {
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pbBuffer, pdwBufferSizeMarshal, pdwBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIntrinsicModelCount() {
        result := ComCall(6, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IMFExtendedCameraIntrinsicModel} 
     */
    GetIntrinsicModelByIndex(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &ppIntrinsicModel := 0, "HRESULT")
        return IMFExtendedCameraIntrinsicModel(ppIntrinsicModel)
    }

    /**
     * 
     * @param {IMFExtendedCameraIntrinsicModel} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    AddIntrinsicModel(pIntrinsicModel) {
        result := ComCall(8, this, "ptr", pIntrinsicModel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFExtendedCameraIntrinsics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeFromBuffer := CallbackCreate(GetMethod(implObj, "InitializeFromBuffer"), flags, 3)
        this.vtbl.GetBufferSize := CallbackCreate(GetMethod(implObj, "GetBufferSize"), flags, 2)
        this.vtbl.SerializeToBuffer := CallbackCreate(GetMethod(implObj, "SerializeToBuffer"), flags, 3)
        this.vtbl.GetIntrinsicModelCount := CallbackCreate(GetMethod(implObj, "GetIntrinsicModelCount"), flags, 2)
        this.vtbl.GetIntrinsicModelByIndex := CallbackCreate(GetMethod(implObj, "GetIntrinsicModelByIndex"), flags, 3)
        this.vtbl.AddIntrinsicModel := CallbackCreate(GetMethod(implObj, "AddIntrinsicModel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeFromBuffer)
        CallbackFree(this.vtbl.GetBufferSize)
        CallbackFree(this.vtbl.SerializeToBuffer)
        CallbackFree(this.vtbl.GetIntrinsicModelCount)
        CallbackFree(this.vtbl.GetIntrinsicModelByIndex)
        CallbackFree(this.vtbl.AddIntrinsicModel)
    }
}
