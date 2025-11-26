#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk
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
     * The AdviseSurfaceAllocator method is called by an application to instruct the VMR-9 to use a custom allocator-presenter.
     * @param {Pointer} dwUserID Application-defined value that identifies this instance of the VMR-9.
     * @param {IVMRSurfaceAllocator9} lpIVRMSurfaceAllocator Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrsurfaceallocator9">IVMRSurfaceAllocator9</a> interface on the custom surface allocator object.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-advisesurfaceallocator
     */
    AdviseSurfaceAllocator(dwUserID, lpIVRMSurfaceAllocator) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpIVRMSurfaceAllocator, "HRESULT")
        return result
    }

    /**
     * The SetD3DDevice method sets the Direct3D device.
     * @param {IDirect3DDevice9} lpD3DDevice Pointer to the <b>IDirect3DDevice9</b> interface of the device.
     * @param {HMONITOR} hMonitor Handle to a monitor.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-setd3ddevice
     */
    SetD3DDevice(lpD3DDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", lpD3DDevice, "ptr", hMonitor, "HRESULT")
        return result
    }

    /**
     * The ChangeD3DDevice method notifies the VMR that the Direct3D device has changed.
     * @param {IDirect3DDevice9} lpD3DDevice Pointer to the <b>IDirect3DDevice9</b> interface of the new device.
     * @param {HMONITOR} hMonitor Handle to the monitor associated with the new device.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-changed3ddevice
     */
    ChangeD3DDevice(lpD3DDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(5, this, "ptr", lpD3DDevice, "ptr", hMonitor, "HRESULT")
        return result
    }

    /**
     * The AllocateSurfaceHelper method allocates a Direct3D surface based on application-specified parameters.
     * @param {Pointer<VMR9AllocationInfo>} lpAllocInfo Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9allocationinfo">VMR9AllocationInfo</a> structure that describes the surfaces to create.
     * @param {Pointer<Integer>} lpNumBuffers On input, this parameter specifies the number of surfaces to create. On output, this parameter contains the number of surfaces that the method created.
     * @returns {IDirect3DSurface9} Address of an array of <b>IDirect3DSurface9</b> interface pointers. The size of the array must equal the value in <i>lpNumBuffers</i>. The method fills the array with valid <b>IDirect3DSurface9</b> pointers for each Direct3D surface that it creates. The caller must release the interface pointers. (Do not put any valid pointers into the array before you call this method, because the method will overwrite them, causing a memory leak.)
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-allocatesurfacehelper
     */
    AllocateSurfaceHelper(lpAllocInfo, lpNumBuffers) {
        lpNumBuffersMarshal := lpNumBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", lpAllocInfo, lpNumBuffersMarshal, lpNumBuffers, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirect3DSurface9(lplpSurface)
    }

    /**
     * The NotifyEvent method is called by the allocator-presenter to inform the VMR of any significant DirectShow events that it (the allocator presenter) generates during the allocation or presentation processes.
     * @param {Integer} EventCode Specifies the DirectShow event code.
     * @param {Pointer} Param1 Specifies the first event parameter. The meaning depends on the event code. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/event-notification-codes">Event Notification Codes</a>.
     * @param {Pointer} Param2 Specifies the second event parameter. The meaning depends on the event code.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-notifyevent
     */
    NotifyEvent(EventCode, Param1, Param2) {
        result := ComCall(7, this, "int", EventCode, "ptr", Param1, "ptr", Param2, "HRESULT")
        return result
    }
}
