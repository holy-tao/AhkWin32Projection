#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICDisplayAdaptationControl.ahk" { IWICDisplayAdaptationControl }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WICBitmapToneMappingMode.ahk" { WICBitmapToneMappingMode }

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICDisplayAdaptationControl2 extends IWICDisplayAdaptationControl {
    /**
     * The interface identifier for IWICDisplayAdaptationControl2
     * @type {Guid}
     */
    static IID := Guid("{d7508d29-3ab7-447e-a676-4d80d7de726b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICDisplayAdaptationControl2 interfaces
    */
    struct Vtbl extends IWICDisplayAdaptationControl.Vtbl {
        SetSdrWhiteLevel           : IntPtr
        GetSdrWhiteLevel           : IntPtr
        SetToneMappingMode         : IntPtr
        GetToneMappingMode         : IntPtr
        DoesSupportToneMappingMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICDisplayAdaptationControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Float} fWhiteLevelInNits 
     * @returns {HRESULT} 
     */
    SetSdrWhiteLevel(fWhiteLevelInNits) {
        result := ComCall(6, this, "float", fWhiteLevelInNits, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetSdrWhiteLevel() {
        result := ComCall(7, this, "float*", &pfWhiteLevelInNits := 0, "HRESULT")
        return pfWhiteLevelInNits
    }

    /**
     * 
     * @param {WICBitmapToneMappingMode} _mode 
     * @returns {HRESULT} 
     */
    SetToneMappingMode(_mode) {
        result := ComCall(8, this, WICBitmapToneMappingMode, _mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {WICBitmapToneMappingMode} 
     */
    GetToneMappingMode() {
        result := ComCall(9, this, "int*", &_mode := 0, "HRESULT")
        return _mode
    }

    /**
     * 
     * @param {WICBitmapToneMappingMode} _mode 
     * @returns {BOOL} 
     */
    DoesSupportToneMappingMode(_mode) {
        result := ComCall(10, this, WICBitmapToneMappingMode, _mode, BOOL.Ptr, &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }

    Query(iid) {
        if (IWICDisplayAdaptationControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSdrWhiteLevel := CallbackCreate(GetMethod(implObj, "SetSdrWhiteLevel"), flags, 2)
        this.vtbl.GetSdrWhiteLevel := CallbackCreate(GetMethod(implObj, "GetSdrWhiteLevel"), flags, 2)
        this.vtbl.SetToneMappingMode := CallbackCreate(GetMethod(implObj, "SetToneMappingMode"), flags, 2)
        this.vtbl.GetToneMappingMode := CallbackCreate(GetMethod(implObj, "GetToneMappingMode"), flags, 2)
        this.vtbl.DoesSupportToneMappingMode := CallbackCreate(GetMethod(implObj, "DoesSupportToneMappingMode"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSdrWhiteLevel)
        CallbackFree(this.vtbl.GetSdrWhiteLevel)
        CallbackFree(this.vtbl.SetToneMappingMode)
        CallbackFree(this.vtbl.GetToneMappingMode)
        CallbackFree(this.vtbl.DoesSupportToneMappingMode)
    }
}
