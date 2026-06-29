#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFileIo.ahk" { IFileIo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IFileClient extends IUnknown {
    /**
     * The interface identifier for IFileClient
     * @type {Guid}
     */
    static IID := Guid("{bfccd196-1244-4840-ab44-480975c4ffe4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetObjectDiskSize : IntPtr
        Write             : IntPtr
        Read              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pqwSize 
     * @returns {HRESULT} 
     */
    GetObjectDiskSize(pqwSize) {
        pqwSizeMarshal := pqwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pqwSizeMarshal, pqwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileIo} pFio 
     * @returns {HRESULT} 
     */
    Write(pFio) {
        result := ComCall(4, this, "ptr", pFio, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileIo} pFio 
     * @returns {HRESULT} 
     */
    Read(pFio) {
        result := ComCall(5, this, "ptr", pFio, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObjectDiskSize := CallbackCreate(GetMethod(implObj, "GetObjectDiskSize"), flags, 2)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 2)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObjectDiskSize)
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.Read)
    }
}
