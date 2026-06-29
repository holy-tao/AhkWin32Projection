#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMMDevice.ahk" { IMMDevice }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IMMDeviceActivator extends IUnknown {
    /**
     * The interface identifier for IMMDeviceActivator
     * @type {Guid}
     */
    static IID := Guid("{3b0d0ea4-d0a9-4b0e-935b-09516746fac0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMMDeviceActivator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Activate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMMDeviceActivator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {IMMDevice} pDevice 
     * @param {Pointer<PROPVARIANT>} pActivationParams 
     * @returns {Pointer<Void>} 
     */
    Activate(iid, pDevice, pActivationParams) {
        result := ComCall(3, this, Guid.Ptr, iid, "ptr", pDevice, PROPVARIANT.Ptr, pActivationParams, "ptr*", &ppInterface := 0, "HRESULT")
        return ppInterface
    }

    Query(iid) {
        if (IMMDeviceActivator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Activate)
    }
}
