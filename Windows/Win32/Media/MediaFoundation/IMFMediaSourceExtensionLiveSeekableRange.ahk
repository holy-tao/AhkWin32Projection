#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSourceExtensionLiveSeekableRange extends IUnknown {
    /**
     * The interface identifier for IMFMediaSourceExtensionLiveSeekableRange
     * @type {Guid}
     */
    static IID := Guid("{5d1abfd6-450a-4d92-9efc-d6b6cbc1f4da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSourceExtensionLiveSeekableRange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetLiveSeekableRange   : IntPtr
        ClearLiveSeekableRange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSourceExtensionLiveSeekableRange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Float} start 
     * @param {Float} end 
     * @returns {HRESULT} 
     */
    SetLiveSeekableRange(start, end) {
        result := ComCall(3, this, "double", start, "double", end, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearLiveSeekableRange() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaSourceExtensionLiveSeekableRange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetLiveSeekableRange := CallbackCreate(GetMethod(implObj, "SetLiveSeekableRange"), flags, 3)
        this.vtbl.ClearLiveSeekableRange := CallbackCreate(GetMethod(implObj, "ClearLiveSeekableRange"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetLiveSeekableRange)
        CallbackFree(this.vtbl.ClearLiveSeekableRange)
    }
}
