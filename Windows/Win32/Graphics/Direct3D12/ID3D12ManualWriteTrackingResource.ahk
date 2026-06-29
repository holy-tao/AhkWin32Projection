#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_RANGE.ahk" { D3D12_RANGE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12ManualWriteTrackingResource extends IUnknown {
    /**
     * The interface identifier for ID3D12ManualWriteTrackingResource
     * @type {Guid}
     */
    static IID := Guid("{86ca3b85-49ad-4b6e-aed5-eddb18540f41}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12ManualWriteTrackingResource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TrackWrite : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12ManualWriteTrackingResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} Subresource 
     * @param {Pointer<D3D12_RANGE>} pWrittenRange 
     * @returns {String} Nothing - always returns an empty string
     */
    TrackWrite(Subresource, pWrittenRange) {
        ComCall(3, this, "uint", Subresource, D3D12_RANGE.Ptr, pWrittenRange)
    }

    Query(iid) {
        if (ID3D12ManualWriteTrackingResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TrackWrite := CallbackCreate(GetMethod(implObj, "TrackWrite"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TrackWrite)
    }
}
