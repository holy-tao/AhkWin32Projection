#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdMapMemory callback function maps application-modifiable portions of the frame buffer into the user-mode address space of the specified process, or unmaps memory.
 * @remarks
 * <b>DdMapMemory</b> is called to perform memory mapping before the first call to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a>. The handle returned by the driver in the <b>fpProcess</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_mapmemorydata">DD_MAPMEMORYDATA</a> structure at <i>lpMapMemory</i> will be passed to every <i>DdLock</i> call made on the driver. 
 * 
 * <b>DdMapMemory</b> is also called to unmap memory after the last <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_unlock">DdUnlock</a> call is made.
 * 
 * To prevent driver crashes, the driver must not map any portion of the frame buffer that must not be modified by an application.
 * 
 * The display driver must call upon the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/video-miniport-drivers-in-the-windows-2000-display-driver-model">video miniport driver</a> to perform the memory mapping or unmapping. To send a synchronous request to the video miniport driver to map the memory, the display driver calls the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engdeviceiocontrol">EngDeviceIoControl</a> GDI function with <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddvdeo/ni-ntddvdeo-ioctl_video_share_video_memory">IOCTL_VIDEO_SHARE_VIDEO_MEMORY</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddvdeo/ni-ntddvdeo-ioctl_video_map_video_memory">IOCTL_VIDEO_MAP_VIDEO_MEMORY</a>. The display driver sends <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddvdeo/ni-ntddvdeo-ioctl_video_unshare_video_memory">IOCTL_VIDEO_UNSHARE_VIDEO_MEMORY</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddvdeo/ni-ntddvdeo-ioctl_video_unmap_video_memory">IOCTL_VIDEO_UNMAP_VIDEO_MEMORY</a> to the video miniport driver to unmap the memory. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/communicating-ioctls-to-the-video-miniport-driver">Communicating IOCTLs to the Video Miniport Driver</a>.
 * 
 * <b>DdMapMemory</b> can only be called with a disabled <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a> to unmap memory. A PDEV is disabled or enabled by calling the display driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvassertmode">DrvAssertMode</a> function. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/managing-pdevs">Managing PDEVs</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_mapmemory
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_MAPMEMORY extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<DD_MAPMEMORYDATA>} param0 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        result := ComCall(3, this, "ptr", param0, "uint")
        return result
    }
}
