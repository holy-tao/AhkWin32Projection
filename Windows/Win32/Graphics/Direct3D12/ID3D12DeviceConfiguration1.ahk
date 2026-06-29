#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12DeviceConfiguration.ahk" { ID3D12DeviceConfiguration }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceConfiguration1 extends ID3D12DeviceConfiguration {
    /**
     * The interface identifier for ID3D12DeviceConfiguration1
     * @type {Guid}
     */
    static IID := Guid("{ed342442-6343-4e16-bb82-a3a577874e56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceConfiguration1 interfaces
    */
    struct Vtbl extends ID3D12DeviceConfiguration.Vtbl {
        CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceConfiguration1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} pLibraryBlob 
     * @param {Pointer} _Size 
     * @param {PWSTR} RootSignatureSubobjectName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary(pLibraryBlob, _Size, RootSignatureSubobjectName, riid) {
        RootSignatureSubobjectName := RootSignatureSubobjectName is String ? StrPtr(RootSignatureSubobjectName) : RootSignatureSubobjectName

        result := ComCall(7, this, "ptr", pLibraryBlob, "ptr", _Size, "ptr", RootSignatureSubobjectName, Guid.Ptr, riid, "ptr*", &ppvDeserializer := 0, "HRESULT")
        return ppvDeserializer
    }

    Query(iid) {
        if (ID3D12DeviceConfiguration1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary := CallbackCreate(GetMethod(implObj, "CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary)
    }
}
