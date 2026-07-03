#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_MAPMEMORYDATA.ahk" { DD_MAPMEMORYDATA }

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
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mapmemory
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MAPMEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MAPMEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_MAPMEMORYDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_mapmemorydata">DD_MAPMEMORYDATA</a> structure that contains details for the memory mapping or unmapping operation.
     * @returns {Integer} <b>DdMapMemory</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_MAPMEMORYDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MAPMEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MAPMEMORY {
        /**
         * Creates a PDD_MAPMEMORY pointer that invokes the given AHK function when called.
         * @param {Func(DD_MAPMEMORYDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_MAPMEMORYDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
