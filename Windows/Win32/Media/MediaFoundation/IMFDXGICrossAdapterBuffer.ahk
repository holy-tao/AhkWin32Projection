#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFDXGICrossAdapterBuffer extends IUnknown {
    /**
     * The interface identifier for IMFDXGICrossAdapterBuffer
     * @type {Guid}
     */
    static IID := Guid("{b25d03fb-d148-45ef-bfed-f778b7566c07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFDXGICrossAdapterBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetResourceForDevice         : IntPtr
        GetSubresourceIndexForDevice : IntPtr
        GetUnknownForDevice          : IntPtr
        SetUnknownForDevice          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFDXGICrossAdapterBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetResourceForDevice(pUnkDevice, riid) {
        result := ComCall(3, this, "ptr", pUnkDevice, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @returns {Integer} 
     */
    GetSubresourceIndexForDevice(pUnkDevice) {
        result := ComCall(4, this, "ptr", pUnkDevice, "uint*", &puSubresource := 0, "HRESULT")
        return puSubresource
    }

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetUnknownForDevice(pUnkDevice, guid, riid) {
        result := ComCall(5, this, "ptr", pUnkDevice, Guid.Ptr, guid, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @param {Pointer<Guid>} guid 
     * @param {IUnknown} pUnkData 
     * @returns {HRESULT} 
     */
    SetUnknownForDevice(pUnkDevice, guid, pUnkData) {
        result := ComCall(6, this, "ptr", pUnkDevice, Guid.Ptr, guid, "ptr", pUnkData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFDXGICrossAdapterBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResourceForDevice := CallbackCreate(GetMethod(implObj, "GetResourceForDevice"), flags, 4)
        this.vtbl.GetSubresourceIndexForDevice := CallbackCreate(GetMethod(implObj, "GetSubresourceIndexForDevice"), flags, 3)
        this.vtbl.GetUnknownForDevice := CallbackCreate(GetMethod(implObj, "GetUnknownForDevice"), flags, 5)
        this.vtbl.SetUnknownForDevice := CallbackCreate(GetMethod(implObj, "SetUnknownForDevice"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResourceForDevice)
        CallbackFree(this.vtbl.GetSubresourceIndexForDevice)
        CallbackFree(this.vtbl.GetUnknownForDevice)
        CallbackFree(this.vtbl.SetUnknownForDevice)
    }
}
