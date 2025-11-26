#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVMRSurfaceAllocator9.ahk

/**
 * The IVMRSurfaceAllocatorEx9 interface provides a way for custom allocator-presenters to control where the Video Mixing Renderer Filter 9 (VMR-9) draws the composited image.
 * @remarks
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrsurfaceallocatorex9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRSurfaceAllocatorEx9 extends IVMRSurfaceAllocator9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRSurfaceAllocatorEx9
     * @type {Guid}
     */
    static IID => Guid("{6de9a68a-a928-4522-bf57-655ae3866456}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSurfaceEx"]

    /**
     * The GetSurfaceEx method retrieves a Direct3D surface and a destination rectangle.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocatorex9-getsurfaceex
     */
    GetSurfaceEx(dwUserID, SurfaceIndex, SurfaceFlags, lplpSurface, lprcDst) {
        result := ComCall(7, this, "ptr", dwUserID, "uint", SurfaceIndex, "uint", SurfaceFlags, "ptr*", lplpSurface, "ptr", lprcDst, "HRESULT")
        return result
    }
}
