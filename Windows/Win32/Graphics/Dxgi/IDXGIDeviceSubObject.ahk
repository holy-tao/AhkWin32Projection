#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDXGIObject.ahk" { IDXGIObject }

/**
 * Inherited from objects that are tied to the device so that they can retrieve a pointer to it.
 * @remarks
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgidevicesubobject
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIDeviceSubObject extends IDXGIObject {
    /**
     * The interface identifier for IDXGIDeviceSubObject
     * @type {Guid}
     */
    static IID := Guid("{3d3e0379-f9de-4d58-bb6c-18d62992f1a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIDeviceSubObject interfaces
    */
    struct Vtbl extends IDXGIObject.Vtbl {
        GetDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIDeviceSubObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the device.
     * @remarks
     * The type of interface that is returned can be any interface published by the device. For example, it could be an IDXGIDevice * called pDevice, and therefore the REFIID would be obtained by calling __uuidof(pDevice).
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The reference id for the device.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to the device.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevicesubobject-getdevice
     */
    GetDevice(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &ppDevice := 0, "HRESULT")
        return ppDevice
    }

    Query(iid) {
        if (IDXGIDeviceSubObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
    }
}
