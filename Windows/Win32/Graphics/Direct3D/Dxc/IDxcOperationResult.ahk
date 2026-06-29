#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDxcBlobEncoding.ahk" { IDxcBlobEncoding }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcOperationResult extends IUnknown {
    /**
     * The interface identifier for IDxcOperationResult
     * @type {Guid}
     */
    static IID := Guid("{cedb484a-d4e9-445a-b991-ca21ca157dc2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcOperationResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStatus      : IntPtr
        GetResult      : IntPtr
        GetErrorBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcOperationResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetStatus() {
        result := ComCall(3, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {IDxcBlob} 
     */
    GetResult() {
        result := ComCall(4, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlob(ppResult)
    }

    /**
     * 
     * @returns {IDxcBlobEncoding} 
     */
    GetErrorBuffer() {
        result := ComCall(5, this, "ptr*", &ppErrors := 0, "HRESULT")
        return IDxcBlobEncoding(ppErrors)
    }

    Query(iid) {
        if (IDxcOperationResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetResult := CallbackCreate(GetMethod(implObj, "GetResult"), flags, 2)
        this.vtbl.GetErrorBuffer := CallbackCreate(GetMethod(implObj, "GetErrorBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetResult)
        CallbackFree(this.vtbl.GetErrorBuffer)
    }
}
