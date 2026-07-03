#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * IDirect3DDxgiInterfaceAccess is a COM interface, which must be implemented by anything that implements IDirect3DDevice or IDirect3DSurface.
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.directx.direct3d11.interop/ns-windows-graphics-directx-direct3d11-interop-idirect3ddxgiinterfaceaccess
 * @namespace Windows.Win32.System.WinRT.Direct3D11
 */
export default struct IDirect3DDxgiInterfaceAccess extends IUnknown {
    /**
     * The interface identifier for IDirect3DDxgiInterfaceAccess
     * @type {Guid}
     */
    static IID := Guid("{a9b3d012-3df2-4ee3-b8d1-8695f457d3c1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DDxgiInterfaceAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DDxgiInterfaceAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the DXGI interface that is wrapped by the IDirect3DDxgiInterfaceAccess object.
     * @param {Pointer<Guid>} iid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in p.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * A pointer to a memory block that receives a pointer to the the DXGI interface.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-idirect3ddxgiinterfaceaccess-getinterface
     */
    GetInterface(iid) {
        result := ComCall(3, this, Guid.Ptr, iid, "ptr*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDirect3DDxgiInterfaceAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInterface := CallbackCreate(GetMethod(implObj, "GetInterface"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInterface)
    }
}
