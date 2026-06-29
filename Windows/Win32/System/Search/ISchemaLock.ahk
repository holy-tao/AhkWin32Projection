#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISchemaLock extends IUnknown {
    /**
     * The interface identifier for ISchemaLock
     * @type {Guid}
     */
    static IID := Guid("{4c2389fb-2511-11d4-b258-00c04f7971ce}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaLock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSchemaLock     : IntPtr
        ReleaseSchemaLock : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaLock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Integer} lmMode 
     * @param {Pointer<HANDLE>} phLockHandle 
     * @param {Pointer<Integer>} pTableVersion 
     * @returns {HRESULT} 
     */
    GetSchemaLock(pTableID, lmMode, phLockHandle, pTableVersion) {
        pTableVersionMarshal := pTableVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, DBID.Ptr, pTableID, "uint", lmMode, HANDLE.Ptr, phLockHandle, pTableVersionMarshal, pTableVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hLockHandle 
     * @returns {HRESULT} 
     */
    ReleaseSchemaLock(hLockHandle) {
        result := ComCall(4, this, HANDLE, hLockHandle, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISchemaLock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSchemaLock := CallbackCreate(GetMethod(implObj, "GetSchemaLock"), flags, 5)
        this.vtbl.ReleaseSchemaLock := CallbackCreate(GetMethod(implObj, "ReleaseSchemaLock"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSchemaLock)
        CallbackFree(this.vtbl.ReleaseSchemaLock)
    }
}
