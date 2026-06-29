#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostExtensibility2.ahk" { IDebugHostExtensibility2 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostExtensibility3 extends IDebugHostExtensibility2 {
    /**
     * The interface identifier for IDebugHostExtensibility3
     * @type {Guid}
     */
    static IID := Guid("{4be234de-d397-4378-bbb4-9055a425d7d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostExtensibility3 interfaces
    */
    struct Vtbl extends IDebugHostExtensibility2.Vtbl {
        ExtendHostContext           : IntPtr
        QueryHostContextExtension   : IntPtr
        ReleaseHostContextExtension : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostExtensibility3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} blobSize 
     * @param {Pointer<Guid>} identifier 
     * @returns {Integer} 
     */
    ExtendHostContext(blobSize, identifier) {
        result := ComCall(6, this, "uint", blobSize, Guid.Ptr, identifier, "uint*", &blobId := 0, "HRESULT")
        return blobId
    }

    /**
     * 
     * @param {Pointer<Guid>} identifier 
     * @param {Pointer<Integer>} blobId 
     * @param {Pointer<Integer>} blobSize 
     * @returns {HRESULT} 
     */
    QueryHostContextExtension(identifier, blobId, blobSize) {
        blobIdMarshal := blobId is VarRef ? "uint*" : "ptr"
        blobSizeMarshal := blobSize is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, Guid.Ptr, identifier, blobIdMarshal, blobId, blobSizeMarshal, blobSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} blobId 
     * @returns {HRESULT} 
     */
    ReleaseHostContextExtension(blobId) {
        result := ComCall(8, this, "uint", blobId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostExtensibility3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ExtendHostContext := CallbackCreate(GetMethod(implObj, "ExtendHostContext"), flags, 4)
        this.vtbl.QueryHostContextExtension := CallbackCreate(GetMethod(implObj, "QueryHostContextExtension"), flags, 4)
        this.vtbl.ReleaseHostContextExtension := CallbackCreate(GetMethod(implObj, "ReleaseHostContextExtension"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ExtendHostContext)
        CallbackFree(this.vtbl.QueryHostContextExtension)
        CallbackFree(this.vtbl.ReleaseHostContextExtension)
    }
}
