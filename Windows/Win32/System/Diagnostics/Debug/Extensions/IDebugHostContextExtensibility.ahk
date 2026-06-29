#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\IDebugHostContextExtension.ahk" { IDebugHostContextExtension }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostContextExtensibility extends IUnknown {
    /**
     * The interface identifier for IDebugHostContextExtensibility
     * @type {Guid}
     */
    static IID := Guid("{35ae8e40-f234-4ef1-b8ea-0dfbc58a2043}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostContextExtensibility interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HasExtensionData             : IntPtr
        ReadExtensionData            : IntPtr
        CloneContextForModification  : IntPtr
        CloneContextWithModification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostContextExtensibility.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} blobId 
     * @returns {Boolean} 
     */
    HasExtensionData(blobId) {
        result := ComCall(3, this, "uint", blobId, Int32)
        return result
    }

    /**
     * 
     * @param {Integer} blobId 
     * @param {Integer} bufferSize 
     * @returns {Void} 
     */
    ReadExtensionData(blobId, bufferSize) {
        result := ComCall(4, this, "uint", blobId, "uint", bufferSize, "ptr", &_buffer := 0, "HRESULT")
        return _buffer
    }

    /**
     * 
     * @returns {IDebugHostContextExtension} 
     */
    CloneContextForModification() {
        result := ComCall(5, this, "ptr*", &extensionHandle := 0, "HRESULT")
        return IDebugHostContextExtension(extensionHandle)
    }

    /**
     * 
     * @param {Integer} blobId 
     * @param {Integer} dataSize 
     * @param {Pointer<Void>} data 
     * @returns {IDebugHostContext} 
     */
    CloneContextWithModification(blobId, dataSize, data) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "uint", blobId, "uint", dataSize, dataMarshal, data, "ptr*", &clonedContext := 0, "HRESULT")
        return IDebugHostContext(clonedContext)
    }

    Query(iid) {
        if (IDebugHostContextExtensibility.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HasExtensionData := CallbackCreate(GetMethod(implObj, "HasExtensionData"), flags, 2)
        this.vtbl.ReadExtensionData := CallbackCreate(GetMethod(implObj, "ReadExtensionData"), flags, 4)
        this.vtbl.CloneContextForModification := CallbackCreate(GetMethod(implObj, "CloneContextForModification"), flags, 2)
        this.vtbl.CloneContextWithModification := CallbackCreate(GetMethod(implObj, "CloneContextWithModification"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HasExtensionData)
        CallbackFree(this.vtbl.ReadExtensionData)
        CallbackFree(this.vtbl.CloneContextForModification)
        CallbackFree(this.vtbl.CloneContextWithModification)
    }
}
