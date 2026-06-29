#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICBitmapToneMappingMode.ahk" { WICBitmapToneMappingMode }

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapToneMapper extends IWICBitmapSource {
    /**
     * The interface identifier for IWICBitmapToneMapper
     * @type {Guid}
     */
    static IID := Guid("{44728ded-1edf-4fe9-b50b-c89a264c9439}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapToneMapper interfaces
    */
    struct Vtbl extends IWICBitmapSource.Vtbl {
        InitializeForHdrTarget : IntPtr
        InitializeForSdrTarget : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapToneMapper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IWICBitmapSource} pISource 
     * @param {Pointer<Guid>} guidDstFormat 
     * @param {Float} fLuminanceInNits 
     * @param {Float} fWhiteLevelInNits 
     * @param {WICBitmapToneMappingMode} _mode 
     * @returns {HRESULT} 
     */
    InitializeForHdrTarget(pISource, guidDstFormat, fLuminanceInNits, fWhiteLevelInNits, _mode) {
        result := ComCall(8, this, "ptr", pISource, Guid.Ptr, guidDstFormat, "float", fLuminanceInNits, "float", fWhiteLevelInNits, WICBitmapToneMappingMode, _mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapSource} pISource 
     * @param {Pointer<Guid>} guidDstFormat 
     * @param {WICBitmapToneMappingMode} _mode 
     * @returns {HRESULT} 
     */
    InitializeForSdrTarget(pISource, guidDstFormat, _mode) {
        result := ComCall(9, this, "ptr", pISource, Guid.Ptr, guidDstFormat, WICBitmapToneMappingMode, _mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICBitmapToneMapper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeForHdrTarget := CallbackCreate(GetMethod(implObj, "InitializeForHdrTarget"), flags, 6)
        this.vtbl.InitializeForSdrTarget := CallbackCreate(GetMethod(implObj, "InitializeForSdrTarget"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeForHdrTarget)
        CallbackFree(this.vtbl.InitializeForSdrTarget)
    }
}
