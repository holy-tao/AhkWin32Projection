#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceServiceOpenCallback.ahk" { IPortableDeviceServiceOpenCallback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceServiceActivation extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceServiceActivation
     * @type {Guid}
     */
    static IID := Guid("{e56b0534-d9b9-425c-9b99-75f97cb3d7c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceServiceActivation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OpenAsync       : IntPtr
        CancelOpenAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceServiceActivation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszPnPServiceID 
     * @param {IPortableDeviceValues} pClientInfo 
     * @param {IPortableDeviceServiceOpenCallback} pCallback 
     * @returns {HRESULT} 
     */
    OpenAsync(pszPnPServiceID, pClientInfo, pCallback) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(3, this, "ptr", pszPnPServiceID, "ptr", pClientInfo, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelOpenAsync() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceServiceActivation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenAsync := CallbackCreate(GetMethod(implObj, "OpenAsync"), flags, 4)
        this.vtbl.CancelOpenAsync := CallbackCreate(GetMethod(implObj, "CancelOpenAsync"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenAsync)
        CallbackFree(this.vtbl.CancelOpenAsync)
    }
}
