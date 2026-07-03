#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_KERNELCALLBACKS structure contains entry pointers to the DirectDraw kernel-mode callback functions that the driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_KernelCallbacks GUID.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_kernelcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_KERNELCALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DD_KERNELCALLBACKS structure.
     */
    dwSize : UInt32

    /**
     * Indicates what Microsoft DirectDraw kernel callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_KERNEL_SYNCSURFACEDATA </dt>
     * <dt>DDHAL_KERNEL_SYNCVIDEOPORTDATA </dt>
     * </dl>
     */
    dwFlags : UInt32

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_kernelcb_syncsurface">DdSyncSurfaceData</a> callback.
     */
    SyncSurfaceData : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_kernelcb_syncvideoport">DdSyncVideoPortData</a> callback.
     */
    SyncVideoPortData : IntPtr

}
