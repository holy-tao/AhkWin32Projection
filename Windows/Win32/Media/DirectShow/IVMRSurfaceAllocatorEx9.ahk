#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\IVMRSurfaceAllocator9.ahk" { IVMRSurfaceAllocator9 }

/**
 * The IVMRSurfaceAllocatorEx9 interface provides a way for custom allocator-presenters to control where the Video Mixing Renderer Filter 9 (VMR-9) draws the composited image.
 * @remarks
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrsurfaceallocatorex9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRSurfaceAllocatorEx9 extends IVMRSurfaceAllocator9 {
    /**
     * The interface identifier for IVMRSurfaceAllocatorEx9
     * @type {Guid}
     */
    static IID := Guid("{6de9a68a-a928-4522-bf57-655ae3866456}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRSurfaceAllocatorEx9 interfaces
    */
    struct Vtbl extends IVMRSurfaceAllocator9.Vtbl {
        GetSurfaceEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRSurfaceAllocatorEx9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSurfaceEx method retrieves a Direct3D surface and a destination rectangle.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer} dwUserID Application-defined identifier. This value is the same value that the application passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-advisesurfaceallocator">IVMRSurfaceAllocatorNotify9::AdviseSurfaceAllocator</a> method in the <i>dwUserID</i> parameter..
     * @param {Integer} SurfaceIndex Index of the surface to retrieve.
     * @param {Integer} SurfaceFlags Surface flags.
     * @param {Pointer<IDirect3DSurface9>} lplpSurface Receives a pointer to the <b>IDirect3DSurface9</b> interface. The caller must release the interface.
     * @param {Pointer<RECT>} lprcDst Location within the surface where the VMR-9 should write the composited image.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatorex9-getsurfaceex
     */
    GetSurfaceEx(dwUserID, SurfaceIndex, SurfaceFlags, lplpSurface, lprcDst) {
        result := ComCall(7, this, "ptr", dwUserID, "uint", SurfaceIndex, "uint", SurfaceFlags, IDirect3DSurface9.Ptr, lplpSurface, RECT.Ptr, lprcDst, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRSurfaceAllocatorEx9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSurfaceEx := CallbackCreate(GetMethod(implObj, "GetSurfaceEx"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSurfaceEx)
    }
}
