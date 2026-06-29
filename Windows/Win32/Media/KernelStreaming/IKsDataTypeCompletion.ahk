#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsDataTypeCompletion extends IUnknown {
    /**
     * The interface identifier for IKsDataTypeCompletion
     * @type {Guid}
     */
    static IID := Guid("{827d1a0e-0f73-11d2-b27a-00a0c9223196}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsDataTypeCompletion interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsCompleteMediaType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsDataTypeCompletion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HANDLE} FilterHandle 
     * @param {Integer} PinFactoryId 
     * @param {Pointer<AM_MEDIA_TYPE>} AmMediaType 
     * @returns {HRESULT} 
     */
    KsCompleteMediaType(FilterHandle, PinFactoryId, AmMediaType) {
        result := ComCall(3, this, HANDLE, FilterHandle, "uint", PinFactoryId, AM_MEDIA_TYPE.Ptr, AmMediaType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IKsDataTypeCompletion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsCompleteMediaType := CallbackCreate(GetMethod(implObj, "KsCompleteMediaType"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsCompleteMediaType)
    }
}
