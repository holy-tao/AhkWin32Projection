#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxFile.ahk" { IAppxFile }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxFile2 extends IAppxFile {
    /**
     * The interface identifier for IAppxFile2
     * @type {Guid}
     */
    static IID := Guid("{0c830b3c-40e9-11ee-be56-0242ac120002}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxFile2 interfaces
    */
    struct Vtbl extends IAppxFile.Vtbl {
        GetBlockSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxFile2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetBlockSize() {
        result := ComCall(8, this, "uint*", &blockSize := 0, "HRESULT")
        return blockSize
    }

    Query(iid) {
        if (IAppxFile2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBlockSize := CallbackCreate(GetMethod(implObj, "GetBlockSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBlockSize)
    }
}
