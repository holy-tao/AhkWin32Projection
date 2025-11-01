#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRSurfaceAllocatorNotify9 interface is implemented by the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
  * The VMR-9 supports this interface in renderless mode only. Otherwise, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> returns <b>E_NOINTERFACE</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/vmr-modes-of-operation">VMR Modes of Operation</a>.
  * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrsurfaceallocatornotify9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRSurfaceAllocatorNotify9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRSurfaceAllocatorNotify9
     * @type {Guid}
     */
    static IID => Guid("{dca3f5df-bb3a-4d03-bd81-84614bfbfa0c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseSurfaceAllocator", "SetD3DDevice", "ChangeD3DDevice", "AllocateSurfaceHelper", "NotifyEvent"]

    /**
     * 
     * @param {Pointer} dwUserID 
     * @param {IVMRSurfaceAllocator9} lpIVRMSurfaceAllocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-advisesurfaceallocator
     */
    AdviseSurfaceAllocator(dwUserID, lpIVRMSurfaceAllocator) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpIVRMSurfaceAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DDevice9} lpD3DDevice 
     * @param {HMONITOR} hMonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-setd3ddevice
     */
    SetD3DDevice(lpD3DDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", lpD3DDevice, "ptr", hMonitor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DDevice9} lpD3DDevice 
     * @param {HMONITOR} hMonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-changed3ddevice
     */
    ChangeD3DDevice(lpD3DDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(5, this, "ptr", lpD3DDevice, "ptr", hMonitor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMR9AllocationInfo>} lpAllocInfo 
     * @param {Pointer<Integer>} lpNumBuffers 
     * @param {Pointer<IDirect3DSurface9>} lplpSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-allocatesurfacehelper
     */
    AllocateSurfaceHelper(lpAllocInfo, lpNumBuffers, lplpSurface) {
        lpNumBuffersMarshal := lpNumBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", lpAllocInfo, lpNumBuffersMarshal, lpNumBuffers, "ptr*", lplpSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EventCode 
     * @param {Pointer} Param1 
     * @param {Pointer} Param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-notifyevent
     */
    NotifyEvent(EventCode, Param1, Param2) {
        result := ComCall(7, this, "int", EventCode, "ptr", Param1, "ptr", Param2, "HRESULT")
        return result
    }
}
