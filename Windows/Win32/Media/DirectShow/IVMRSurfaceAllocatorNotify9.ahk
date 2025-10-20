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
     * 
     * @param {Pointer} dwUserID 
     * @param {Pointer<IVMRSurfaceAllocator9>} lpIVRMSurfaceAllocator 
     * @returns {HRESULT} 
     */
    AdviseSurfaceAllocator(dwUserID, lpIVRMSurfaceAllocator) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpIVRMSurfaceAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DDevice9>} lpD3DDevice 
     * @param {HMONITOR} hMonitor 
     * @returns {HRESULT} 
     */
    SetD3DDevice(lpD3DDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", lpD3DDevice, "ptr", hMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DDevice9>} lpD3DDevice 
     * @param {HMONITOR} hMonitor 
     * @returns {HRESULT} 
     */
    ChangeD3DDevice(lpD3DDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(5, this, "ptr", lpD3DDevice, "ptr", hMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VMR9AllocationInfo>} lpAllocInfo 
     * @param {Pointer<UInt32>} lpNumBuffers 
     * @param {Pointer<IDirect3DSurface9>} lplpSurface 
     * @returns {HRESULT} 
     */
    AllocateSurfaceHelper(lpAllocInfo, lpNumBuffers, lplpSurface) {
        result := ComCall(6, this, "ptr", lpAllocInfo, "uint*", lpNumBuffers, "ptr", lplpSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventCode 
     * @param {Pointer} Param1 
     * @param {Pointer} Param2 
     * @returns {HRESULT} 
     */
    NotifyEvent(EventCode, Param1, Param2) {
        result := ComCall(7, this, "int", EventCode, "ptr", Param1, "ptr", Param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
