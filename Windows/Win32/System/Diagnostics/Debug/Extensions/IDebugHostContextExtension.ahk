#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostContextExtension extends IUnknown {
    /**
     * The interface identifier for IDebugHostContextExtension
     * @type {Guid}
     */
    static IID := Guid("{5e67115d-5449-4553-a9e9-ca446578cab2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostContextExtension interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddExtensionData : IntPtr
        FinalizeContext  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostContextExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} blobId 
     * @param {Integer} dataSize 
     * @param {Pointer<Void>} data 
     * @returns {HRESULT} 
     */
    AddExtensionData(blobId, dataSize, data) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", blobId, "uint", dataSize, dataMarshal, data, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugHostContext} 
     */
    FinalizeContext() {
        result := ComCall(4, this, "ptr*", &immutableContext := 0, "HRESULT")
        return IDebugHostContext(immutableContext)
    }

    Query(iid) {
        if (IDebugHostContextExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddExtensionData := CallbackCreate(GetMethod(implObj, "AddExtensionData"), flags, 4)
        this.vtbl.FinalizeContext := CallbackCreate(GetMethod(implObj, "FinalizeContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddExtensionData)
        CallbackFree(this.vtbl.FinalizeContext)
    }
}
