#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_STATUS.ahk" { D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_STATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }
#Import ".\ID3D12DeviceTools.ahk" { ID3D12DeviceTools }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceTools1 extends ID3D12DeviceTools {
    /**
     * The interface identifier for ID3D12DeviceTools1
     * @type {Guid}
     */
    static IID := Guid("{e30e9fc7-e641-4d6e-8a81-9dd9206ec47a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceTools1 interfaces
    */
    struct Vtbl extends ID3D12DeviceTools.Vtbl {
        GetApplicationSpecificDriverState      : IntPtr
        GetApplicationSpecificDriverBlobStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceTools1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ID3DBlob} 
     */
    GetApplicationSpecificDriverState() {
        result := ComCall(4, this, "ptr*", &ppBlob := 0, "HRESULT")
        return ID3DBlob(ppBlob)
    }

    /**
     * 
     * @returns {D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_STATUS} 
     */
    GetApplicationSpecificDriverBlobStatus() {
        result := ComCall(5, this, D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_STATUS)
        return result
    }

    Query(iid) {
        if (ID3D12DeviceTools1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetApplicationSpecificDriverState := CallbackCreate(GetMethod(implObj, "GetApplicationSpecificDriverState"), flags, 2)
        this.vtbl.GetApplicationSpecificDriverBlobStatus := CallbackCreate(GetMethod(implObj, "GetApplicationSpecificDriverBlobStatus"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetApplicationSpecificDriverState)
        CallbackFree(this.vtbl.GetApplicationSpecificDriverBlobStatus)
    }
}
