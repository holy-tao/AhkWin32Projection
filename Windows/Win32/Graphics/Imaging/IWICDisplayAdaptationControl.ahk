#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICDisplayAdaptationControl extends IUnknown {
    /**
     * The interface identifier for IWICDisplayAdaptationControl
     * @type {Guid}
     */
    static IID := Guid("{de9d91d2-70b4-4f41-836c-25fcd39626d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICDisplayAdaptationControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DoesSupportChangingMaxLuminance : IntPtr
        SetDisplayMaxLuminance          : IntPtr
        GetDisplayMaxLuminance          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICDisplayAdaptationControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidDstFormat 
     * @returns {BOOL} 
     */
    DoesSupportChangingMaxLuminance(pguidDstFormat) {
        result := ComCall(3, this, Guid.Ptr, pguidDstFormat, BOOL.Ptr, &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }

    /**
     * 
     * @param {Float} fLuminanceInNits 
     * @returns {HRESULT} 
     */
    SetDisplayMaxLuminance(fLuminanceInNits) {
        result := ComCall(4, this, "float", fLuminanceInNits, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetDisplayMaxLuminance() {
        result := ComCall(5, this, "float*", &pfLuminanceInNits := 0, "HRESULT")
        return pfLuminanceInNits
    }

    Query(iid) {
        if (IWICDisplayAdaptationControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoesSupportChangingMaxLuminance := CallbackCreate(GetMethod(implObj, "DoesSupportChangingMaxLuminance"), flags, 3)
        this.vtbl.SetDisplayMaxLuminance := CallbackCreate(GetMethod(implObj, "SetDisplayMaxLuminance"), flags, 2)
        this.vtbl.GetDisplayMaxLuminance := CallbackCreate(GetMethod(implObj, "GetDisplayMaxLuminance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoesSupportChangingMaxLuminance)
        CallbackFree(this.vtbl.SetDisplayMaxLuminance)
        CallbackFree(this.vtbl.GetDisplayMaxLuminance)
    }
}
