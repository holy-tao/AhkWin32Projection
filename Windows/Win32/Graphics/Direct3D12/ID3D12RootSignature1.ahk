#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12RootSignature.ahk" { ID3D12RootSignature }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12RootSignature1 extends ID3D12RootSignature {
    /**
     * The interface identifier for ID3D12RootSignature1
     * @type {Guid}
     */
    static IID := Guid("{c390bd7d-9142-4a95-b072-6d3439ade5c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12RootSignature1 interfaces
    */
    struct Vtbl extends ID3D12RootSignature.Vtbl {
        GetSerializedSize : IntPtr
        GetSerializedData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12RootSignature1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetSerializedSize() {
        result := ComCall(8, this, IntPtr)
        return result
    }

    /**
     * 
     * @param {Integer} pData 
     * @param {Pointer} _Size 
     * @returns {HRESULT} 
     */
    GetSerializedData(pData, _Size) {
        result := ComCall(9, this, "ptr", pData, "ptr", _Size, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12RootSignature1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSerializedSize := CallbackCreate(GetMethod(implObj, "GetSerializedSize"), flags, 1)
        this.vtbl.GetSerializedData := CallbackCreate(GetMethod(implObj, "GetSerializedData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSerializedSize)
        CallbackFree(this.vtbl.GetSerializedData)
    }
}
