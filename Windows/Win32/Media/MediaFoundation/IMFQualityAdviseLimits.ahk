#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_QUALITY_LEVEL.ahk" { MF_QUALITY_LEVEL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_QUALITY_DROP_MODE.ahk" { MF_QUALITY_DROP_MODE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Queries an object for the number of quality modes it supports.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfqualityadviselimits
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFQualityAdviseLimits extends IUnknown {
    /**
     * The interface identifier for IMFQualityAdviseLimits
     * @type {Guid}
     */
    static IID := Guid("{dfcd8e4d-30b5-4567-acaa-8eb5b7853dc9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFQualityAdviseLimits interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMaximumDropMode     : IntPtr
        GetMinimumQualityLevel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFQualityAdviseLimits.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the maximum drop mode.
     * @remarks
     * To get the current drop mode, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfqualityadvise-getdropmode">IMFQualityAdvise::GetDropMode</a> method. To set the drop mode, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfqualityadvise-setdropmode">IMFQualityAdvise::SetDropMode</a> method.
     * @returns {MF_QUALITY_DROP_MODE} Receives the maximum drop mode, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_drop_mode">MF_QUALITY_DROP_MODE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadviselimits-getmaximumdropmode
     */
    GetMaximumDropMode() {
        result := ComCall(3, this, "int*", &peDropMode := 0, "HRESULT")
        return peDropMode
    }

    /**
     * Gets the minimum quality level that is supported by the component.
     * @remarks
     * To get the current quality level, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfqualityadvise-getqualitylevel">IMFQualityAdvise::GetQualityLevel</a> method. To set the quality level, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfqualityadvise-setqualitylevel">IMFQualityAdvise::SetQualityLevel</a> method.
     * @returns {MF_QUALITY_LEVEL} Receives the minimum quality level, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_level">MF_QUALITY_LEVEL</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadviselimits-getminimumqualitylevel
     */
    GetMinimumQualityLevel() {
        result := ComCall(4, this, "int*", &peQualityLevel := 0, "HRESULT")
        return peQualityLevel
    }

    Query(iid) {
        if (IMFQualityAdviseLimits.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMaximumDropMode := CallbackCreate(GetMethod(implObj, "GetMaximumDropMode"), flags, 2)
        this.vtbl.GetMinimumQualityLevel := CallbackCreate(GetMethod(implObj, "GetMinimumQualityLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMaximumDropMode)
        CallbackFree(this.vtbl.GetMinimumQualityLevel)
    }
}
