#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ID3D12Device13.ahk" { ID3D12Device13 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device14 extends ID3D12Device13 {
    /**
     * The interface identifier for ID3D12Device14
     * @type {Guid}
     */
    static IID := Guid("{5f6e592d-d895-44c2-8e4a-88ad4926d323}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device14 interfaces
    */
    struct Vtbl extends ID3D12Device13.Vtbl {
        CreateRootSignatureFromSubobjectInLibrary : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device14.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} nodeMask 
     * @param {Pointer<Void>} pLibraryBlob 
     * @param {Pointer} blobLengthInBytes 
     * @param {PWSTR} subobjectName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateRootSignatureFromSubobjectInLibrary(nodeMask, pLibraryBlob, blobLengthInBytes, subobjectName, riid) {
        subobjectName := subobjectName is String ? StrPtr(subobjectName) : subobjectName

        pLibraryBlobMarshal := pLibraryBlob is VarRef ? "ptr" : "ptr"

        result := ComCall(82, this, "uint", nodeMask, pLibraryBlobMarshal, pLibraryBlob, "ptr", blobLengthInBytes, "ptr", subobjectName, Guid.Ptr, riid, "ptr*", &ppvRootSignature := 0, "HRESULT")
        return ppvRootSignature
    }

    Query(iid) {
        if (ID3D12Device14.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateRootSignatureFromSubobjectInLibrary := CallbackCreate(GetMethod(implObj, "CreateRootSignatureFromSubobjectInLibrary"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateRootSignatureFromSubobjectInLibrary)
    }
}
