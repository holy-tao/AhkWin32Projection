#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12VideoEncoderHeap.ahk" { ID3D12VideoEncoderHeap }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoEncoderHeap1 extends ID3D12VideoEncoderHeap {
    /**
     * The interface identifier for ID3D12VideoEncoderHeap1
     * @type {Guid}
     */
    static IID := Guid("{ea8f1968-4aa0-43a4-9d30-ba86ec84d4f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoEncoderHeap1 interfaces
    */
    struct Vtbl extends ID3D12VideoEncoderHeap.Vtbl {
        GetPow2DownscaleFactor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoEncoderHeap1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPow2DownscaleFactor() {
        result := ComCall(15, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID3D12VideoEncoderHeap1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPow2DownscaleFactor := CallbackCreate(GetMethod(implObj, "GetPow2DownscaleFactor"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPow2DownscaleFactor)
    }
}
