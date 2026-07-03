#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DXAPI_INTERFACE structure contains the interface callback functions that a video miniport driver implements to support Kernel-Mode Video Transport.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-dxapi_interface
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DXAPI_INTERFACE {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DXAPI_INTERFACE structure.
     */
    Size : UInt16

    /**
     * Specifies the version of the video miniport driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">DxApi interface</a>. This value is DXAPI_HALVERSION defined in <i>dxmini.h</i>.
     */
    Version : UInt16

    /**
     * Points to the device extension of the device.
     */
    Context : IntPtr

    /**
     * Unused by the driver.
     */
    InterfaceReference : IntPtr

    /**
     * Unused by the driver.
     */
    InterfaceDereference : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getirqinfo">DxGetIRQInfo</a> miniport driver callback function.
     */
    DxGetIrqInfo : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_enableirq">DxEnableIRQ</a> miniport driver callback function.
     */
    DxEnableIrq : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_skipnextfield">DxSkipNextField</a> miniport driver callback function.
     */
    DxSkipNextField : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_bobnextfield">DxBobNextField</a> miniport driver callback function.
     */
    DxBobNextField : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_setstate">DxSetState</a> miniport driver callback function.
     */
    DxSetState : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_lock">DxLock</a> miniport driver callback function.
     */
    DxLock : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipoverlay">DxFlipOverlay</a> miniport driver callback function.
     */
    DxFlipOverlay : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipvideoport">DxFlipVideoPort</a> miniport driver callback function.
     */
    DxFlipVideoPort : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getpolarity">DxGetPolarity</a> miniport driver callback function.
     */
    DxGetPolarity : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getcurrentautoflip">DxGetCurrentAutoflip</a> miniport driver callback function.
     */
    DxGetCurrentAutoflip : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getpreviousautoflip">DxGetPreviousAutoflip</a> miniport driver callback function.
     */
    DxGetPreviousAutoflip : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_transfer">DxTransfer</a> miniport driver callback function.
     */
    DxTransfer : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_gettransferstatus">DxGetTransferStatus</a> miniport driver callback function.
     */
    DxGetTransferStatus : IntPtr

}
