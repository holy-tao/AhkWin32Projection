#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_ROOT_SIGNATURE_DESC.ahk" { D3D12_ROOT_SIGNATURE_DESC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains a method to return the deserialized D3D12_ROOT_SIGNATURE_DESC data structure, of a serialized root signature version 1.0.
 * @remarks
 * This interface has been superceded by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12versionedrootsignaturedeserializer">ID3D12VersionedRootSignatureDeserializer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignaturedeserializer
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12RootSignatureDeserializer extends IUnknown {
    /**
     * The interface identifier for ID3D12RootSignatureDeserializer
     * @type {Guid}
     */
    static IID := Guid("{34ab647b-3cc8-46ac-841b-c0965645c046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12RootSignatureDeserializer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRootSignatureDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12RootSignatureDeserializer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the layout of the root signature.
     * @returns {Pointer<D3D12_ROOT_SIGNATURE_DESC>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a></b>
     * 
     * This method returns a deserialized root signature in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a> structure that describes the layout of the root signature.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12rootsignaturedeserializer-getrootsignaturedesc
     */
    GetRootSignatureDesc() {
        result := ComCall(3, this, D3D12_ROOT_SIGNATURE_DESC.Ptr)
        return result
    }

    Query(iid) {
        if (ID3D12RootSignatureDeserializer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRootSignatureDesc := CallbackCreate(GetMethod(implObj, "GetRootSignatureDesc"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRootSignatureDesc)
    }
}
