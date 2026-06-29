#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_STATE_OBJECT_DATABASE_FLAGS.ahk" { D3D12_STATE_OBJECT_DATABASE_FLAGS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12StateObjectDatabaseFactory extends IUnknown {
    /**
     * The interface identifier for ID3D12StateObjectDatabaseFactory
     * @type {Guid}
     */
    static IID := Guid("{f5b066f0-648a-4611-bd41-27fd0948b9eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12StateObjectDatabaseFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateStateObjectDatabaseFromFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12StateObjectDatabaseFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pDatabaseFile 
     * @param {D3D12_STATE_OBJECT_DATABASE_FLAGS} flags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateStateObjectDatabaseFromFile(pDatabaseFile, flags, riid) {
        pDatabaseFile := pDatabaseFile is String ? StrPtr(pDatabaseFile) : pDatabaseFile

        result := ComCall(3, this, "ptr", pDatabaseFile, D3D12_STATE_OBJECT_DATABASE_FLAGS, flags, Guid.Ptr, riid, "ptr*", &ppvStateObjectDatabase := 0, "HRESULT")
        return ppvStateObjectDatabase
    }

    Query(iid) {
        if (ID3D12StateObjectDatabaseFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateStateObjectDatabaseFromFile := CallbackCreate(GetMethod(implObj, "CreateStateObjectDatabaseFromFile"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateStateObjectDatabaseFromFile)
    }
}
